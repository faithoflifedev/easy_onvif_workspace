import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/probe.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

final String? dllPath = () {
  if (!Platform.isWindows) return null;

  var pathToLib = '${Directory.current.path}/assets/discovery.dll';

  if (kReleaseMode) {
    final String localLib = join('flutter_assets', 'assets', 'discovery.dll');

    pathToLib =
        join(Directory(Platform.resolvedExecutable).parent.path, localLib);
  }

  return pathToLib;
}();

class DevicePage extends StatelessWidget {
  final multicastProbe =
      MulticastProbe(dllPath: Platform.isWindows ? dllPath : null);

  DevicePage({Key? key}) : super(key: key);

  Future<List<ProbeMatch>> fetchDevices() async {
    await multicastProbe.probe();

    return multicastProbe.onvifDevices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: FutureBuilder<List<ProbeMatch>>(
          future: fetchDevices(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].xAddr),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
