import 'package:easy_onvif/onvif.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart" as services;
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Onvif Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetDeviceInformationResponse? deviceInfo;

  String model = "";

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    final yamlData = await services.rootBundle.loadString('assets/config.yaml');

    final config = loadYaml(yamlData);

    //configure device connection
    var onvif = Onvif(
        host: config['host'],
        username: config['username'],
        password: config['password']);

    await onvif.initialize();

    deviceInfo = await onvif.deviceManagement.getDeviceInformation();
  }

  void _showModel() {
    setState(() {
      if (deviceInfo != null) {
        model = deviceInfo!.model;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Device Model:',
            ),
            Text(
              model,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showModel,
        tooltip: 'Show Model',
        child: const Text('Model'),
      ),
    );
  }
}
