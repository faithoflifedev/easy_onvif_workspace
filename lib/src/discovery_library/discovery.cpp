#include "discovery.h"

char preferred_network_address[16];

int setSocketOptions(int socket)
{
	struct timeval tv;
	tv.tv_sec = 0;
	tv.tv_usec = 500000;
	int broadcast = 500;
	char loopch = 0;
	int status = 0;
	struct in_addr localInterface;

#ifdef _WIN32
	PMIB_IPADDRTABLE pIPAddrTable;
	DWORD dwSize = 0;
	DWORD dwRetVal = 0;
	IN_ADDR IPAddr;

	pIPAddrTable = (MIB_IPADDRTABLE *)malloc(sizeof(MIB_IPADDRTABLE));
	if (pIPAddrTable)
	{
		if (GetIpAddrTable(pIPAddrTable, &dwSize, 0) == ERROR_INSUFFICIENT_BUFFER)
		{
			free(pIPAddrTable);
			pIPAddrTable = (MIB_IPADDRTABLE *)malloc(dwSize);
		}
		if (pIPAddrTable == NULL)
		{
			printf("Memory allocation failed for GetIpAddrTable\n");
			return -1;
		}
	}

	if ((dwRetVal = GetIpAddrTable(pIPAddrTable, &dwSize, 0)) != NO_ERROR)
	{
		printf("GetIpAddrTable failed with error %d\n", dwRetVal);
		return -1;
	}

	int p = 0;
	while (p < (int)pIPAddrTable->dwNumEntries)
	{
		IPAddr.S_un.S_addr = (u_long)pIPAddrTable->table[p].dwAddr;
		IPAddr.S_un.S_addr = (u_long)pIPAddrTable->table[p].dwMask;
		if (pIPAddrTable->table[p].dwAddr != inet_addr("127.0.0.1") && pIPAddrTable->table[p].dwMask == inet_addr("255.255.255.0"))
		{
			if (strlen(preferred_network_address) > 0)
			{
				localInterface.s_addr = inet_addr(preferred_network_address);
			}
			else
			{
				localInterface.s_addr = pIPAddrTable->table[p].dwAddr;
			}
			status = setsockopt(socket, IPPROTO_IP, IP_MULTICAST_IF, (const char *)&localInterface, sizeof(localInterface));
			if (status < 0)
				printf("ip_multicast_if error");
			p = (int)pIPAddrTable->dwNumEntries;
		}
		p++;
	}

	if (pIPAddrTable)
	{
		free(pIPAddrTable);
		pIPAddrTable = NULL;
	}

	status = setsockopt(socket, SOL_SOCKET, SO_RCVTIMEO, (const char *)&broadcast, sizeof(broadcast));
#else
	if (strlen(preferred_network_address) > 0)
	{
		localInterface.s_addr = inet_addr(preferred_network_address);
		status = setsockopt(socket, IPPROTO_IP, IP_MULTICAST_IF, (const char *)&localInterface, sizeof(localInterface));
		if (status < 0)
			printf("ip_multicast_if error");
	}
	status = setsockopt(socket, SOL_SOCKET, SO_RCVTIMEO, (struct timeval *)&tv, sizeof(struct timeval));
#endif
	status = setsockopt(socket, IPPROTO_IP, IP_MULTICAST_LOOP, (char *)&loopch, sizeof(loopch));
	return 0;
}

int discovery(OnvifDiscoveryData *data, const char *probeMessage, int duration)
{
#ifdef _WIN32
	WSADATA wsaData;
	int wsaStartup = WSAStartup(MAKEWORD(2, 2), &wsaData);
#endif

	sockaddr_in broadcast_address = {};

	int broadcast_message_length = strlen(probeMessage);
	int broadcast_socket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	setSocketOptions(broadcast_socket);

	memset((char *)&broadcast_address, 0, sizeof(broadcast_address));
	broadcast_address.sin_family = AF_INET;
	broadcast_address.sin_port = htons(3702);
	broadcast_address.sin_addr.s_addr = inet_addr("239.255.255.250");
	int status = sendto(broadcast_socket, probeMessage, broadcast_message_length, 0, (struct sockaddr *)&broadcast_address, sizeof(broadcast_address));
	if (status < 0)
	{
		// error
	}

	std::this_thread::sleep_for(std::chrono::milliseconds(duration));
	int i = 0;
	bool loop = true;
	socklen_t address_size = sizeof(broadcast_address);
	while (loop)
	{
		int len = recvfrom(broadcast_socket, data->buf[i], sizeof(data->buf[i]), 0, (struct sockaddr *)&broadcast_address, &address_size);
		if (len > 0)
		{
			i++;
		}
		else
		{
			loop = false;
			if (len < 0)
			{
				// error
			}
		}
	}

#ifdef _WIN32
	closesocket(broadcast_socket);
	WSACleanup();
#else
	close(broadcast_socket);
#endif

	return i;
}