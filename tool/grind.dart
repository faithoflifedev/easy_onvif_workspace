import 'dart:io';

import 'package:grinder/grinder.dart';
import 'package:mustache_template/mustache.dart';
import 'package:process_run/shell.dart';
import 'package:yaml/yaml.dart';

main(args) => grind(args);

@Task()
test() => new TestRunner().testAsync();

@DefaultTask()
@Depends(test)
build() {
  Pub.build();
}

@Task()
clean() => defaultClean();

@Task('deploy')
@Depends(version, dartdoc, analyze, dryrun)
deploy() async {
  log('deploying...');
}

@Task('dartdoc')
dartdoc() async {
  log('drydoc...');

  await shell(exec: 'dartdoc');
}

@Task('dart pub publish --dry-run')
dryrun() async {
  log('dryrun...');

  await shell(args: 'pub publish --dry-run');
}

@Task('dart analyze')
analyze() async {
  log('analyzing...');

  await shell(args: 'analyze --fatal-infos');
}

@Task('version bump')
version() async {
  final config = loadYaml(File('tool/config.yaml').readAsStringSync());

  if (!config.containsKey('templates') || !config.containsKey('version'))
    throw Exception();

  updateMarkdown(config);

  updatePubspec(config['version']);
}

Future<void> shell({String exec = 'dart', String args = ''}) async {
  final dartExectutable = whichSync(exec);

  if (dartExectutable == null) throw Exception();

  final shell = Shell(verbose: true);

  await shell.run('$dartExectutable $args');
}

void updateMarkdown(config) {
  final templates = config['templates'].value;

  templates.forEach((templateFilename) {
    log('template: ' + templateFilename['name']);

    final mustacheTpl = File('tool/${templateFilename['name']}');

    if (!templateFilename.containsKey('name')) throw Exception();

    final String type = templateFilename.containsKey('type')
        ? templateFilename['type']!
        : 'append';

    final String templateFileName = templateFilename['name']!;

    final outputFile = File(templateFileName);

    final template =
        new Template(mustacheTpl.readAsStringSync(), name: templateFileName);

    switch (type) {
      case 'prepend':
        outputFile.writeAsStringSync(template.renderString(config));

        outputFile.writeAsStringSync(outputFile.readAsStringSync(),
            mode: FileMode.append);

        break;

      case 'overwrite':
        outputFile.deleteSync();

        outputFile.writeAsStringSync(template.renderString(config));

        break;

      default:
        outputFile.writeAsString(template.renderString(config),
            mode: FileMode.append);
    }
  });
}

void updatePubspec(String version) {
  final pubspecFile = File('pubspec.yaml');

  final String pubspecContent = pubspecFile.readAsStringSync();

  pubspecFile.renameSync('.pubspec.yaml.bak');

  File('pubspec.yaml').writeAsStringSync(
      pubspecContent.replaceAll(RegExp(r'version:.*'), 'version: $version'));
}

// @Task()
// compile() async {
//   final dartExectutable = whichSync('dart');

//   if (dartExectutable == null) throw Exception();

//   final result = await Process.run(
//       dartExectutable, ['compile', 'aot-snapshot', 'bin/onvif_cli.dart']);

//   log(result.errText);

//   log('compiling completed');
// }
