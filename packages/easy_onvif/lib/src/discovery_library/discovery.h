#ifndef ONVIF_H
#define ONVIF_H

#include <chrono>
#include <thread>
#include <cstring>

#ifdef _WIN32
#define LIBRARY_API __declspec(dllexport)
#include <ws2tcpip.h>
#include <iphlpapi.h>
#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "iphlpapi.lib")
#else
#define LIBRARY_API
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#endif

#ifdef __MINGW32__
#include <ws2tcpip.h>
#endif

#pragma pack(push, 1)
struct OnvifDiscoveryData
{
	char buf[128][8192];
};
#pragma pack(pop)

#ifdef __cplusplus
extern "C"
{
#endif

	LIBRARY_API int discovery(OnvifDiscoveryData *data, const char *probeMessage, int duration);

#ifdef __cplusplus
}
#endif

#endif