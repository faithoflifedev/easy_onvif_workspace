import 'package:easy_onvif/device_management.dart' as device;
import 'package:easy_onvif/media2.dart';
import 'package:easy_onvif/onvif.dart';
import 'package:easy_onvif/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter_image/network.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';
import 'package:yaml/yaml.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onvif Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Onvif Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with UiLoggy {
  late final List<MediaProfile> profiles;

  late final device.GetDeviceInformationResponse deviceInfo;

  late final YamlMap config;

  String? snapshotUri;

  bool connecting = true;

  String model = '';

  String manufacturer = '';

  String firmwareVersion = '';

  String url = '';

  @override
  void initState() {
    _initialize();

    super.initState();
  }

  _initialize() async {
    final yamlData = await services.rootBundle.loadString('assets/config.yaml');

    config = loadYaml(yamlData);

    // configure device connection
    final onvif = await Onvif.connect(
        host: config['host'],
        username: config['username'],
        password: config['password'],
        logOptions: const LogOptions(
          LogLevel.debug,
          stackTraceLevel: LogLevel.off,
        ),
        printer: const PrettyDeveloperPrinter());

    setState(() {
      connecting = false;
    });

    deviceInfo = await onvif.deviceManagement.getDeviceInformation();

    profiles = await onvif.media.getProfiles();

    try {
      if (profiles.isNotEmpty) {
        snapshotUri = await onvif.media.getSnapshotUri(profiles[0].token);
      }
    } catch (err) {
      loggy.error(err.toString());
    }
  }

  void _update() {
    setState(() {
      model = deviceInfo.model;

      manufacturer = deviceInfo.manufacturer;

      firmwareVersion = deviceInfo.firmwareVersion;

      if (snapshotUri != null) {
        url = OnvifUtil.authenticatingUri(
            snapshotUri!, config['username']!, config['password']!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: connecting
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                      Text('Connecting to camera'),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      )
                    ])
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Device Manufacturer:',
                      ),
                    ),
                    Text(
                      manufacturer,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Model:',
                      ),
                    ),
                    Text(
                      model,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Firmware Version:',
                      ),
                    ),
                    Text(
                      firmwareVersion,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Snapshot:',
                      ),
                    ),
                    url != ''
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                            child: Image(
                              image: NetworkImageWithRetry(
                                url,
                              ),
                              errorBuilder: (context, exception, stackTrack) =>
                                  const Icon(
                                Icons.error,
                              ),
                              loadingBuilder:
                                  (context, exception, stackTrack) =>
                                      const CircularProgressIndicator(),
                            ))
                        : Container(),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _update,
        tooltip: 'Update',
        child: const Text('Get'),
      ),
    );
  }
}
