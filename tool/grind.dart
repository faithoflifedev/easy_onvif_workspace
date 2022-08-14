import 'package:grinder/grinder.dart';
import 'package:mustache_template/mustache.dart';
import 'package:process_run/which.dart';
import 'package:easy_onvif/util/meta_update.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:pubspec/pubspec.dart';
import 'package:universal_io/io.dart';
import 'package:yaml/yaml.dart';

final config = getConfig();

final pubspecDirectory = Directory.current;

main(args) => grind(args);

@DefaultTask('Build the project.')
@Depends(test)
build() {
  // log('building...');
}

@Task('publish')
@Depends(analyze, version, doc, commit, release, dryrun)
// @Depends(analyze, version, test, doc, commit, release, dryrun)
publish() {
  log('''
Use the command:
  dart pub publish

To publish this package on the pub.dev site.
''');
}

@Task('dart pub publish --dry-run')
dryrun() {
  shell(args: ['pub', 'publish', '--dry-run']);
}

@Task('dartdoc')
@Depends(version)
doc() {
  DartDoc.doc();
}

@Task('analyze')
analyze() {
  Analyzer.analyze('.', fatalWarnings: true);
}

@Task('version')
version() async {
  final version = config['version']!;

  final newTag = await isNewTag(version);

  if (newTag) {
    MetaUpdate('pubspec.yaml').writeMetaDartFile('lib/util/meta.dart');

    updateMarkdown(config);

    await updatePubspec(version);
  }
}

@Task('release')
release() async {
  final newTag = await isNewTag(config['version']);
  if (newTag) {
    shell(
      exec: 'gh',
      args: [
        'release',
        'create',
        'v${config['version']}',
        '--title',
        'Release v${config['version']}',
        '--notes',
        '${config['change']}',
        '--repo',
        '${config['repo']}'
      ],
      verbose: true,
    );
  }
}

@Task('commit')
commit() async {
  final newTag = await isNewTag(config['version']);

  try {
    shell(exec: 'git', args: ['commit', '-a', '-m', '\'${config['change']}\'']);
  } catch (exception) {
    log('No files committed');
  }

  if (newTag) {
    shell(exec: 'git', args: ['tag', 'v${config['version']}']);

    shell(exec: 'git', args: ['push', '--tags']);
  }

  shell(
    exec: 'git',
    args: ['push'],
    verbose: true,
  );
}

@Task('test')
@Depends(version)
test() {
  TestRunner().test();
}

YamlMap getConfig() {
  final config = loadYaml(File('tool/config.yaml').readAsStringSync());

  if (!config.containsKey('templates') ||
      !config.containsKey('version') ||
      !config.containsKey('change')) throw Exception();

  return config;
}

String shell(
    {String exec = 'dart',
    List<String> args = const <String>[],
    bool verbose = true}) {
  final executable = whichSync(exec);

  if (executable == null) throw Exception();

  return run(executable, arguments: args, quiet: !verbose);
}

Future<bool> isNewTag(String version) async {
  final result = shell(
    exec: 'git',
    args: ['tag', '-l', 'v$version'],
    verbose: false,
  );

  return result.trim() != 'v$version';
}

void updateMarkdown(config) {
  final templates = config['templates'].value;

  templates.forEach((templateFilename) {
    final mustacheTpl = File('tool/${templateFilename['name']}');

    if (!templateFilename.containsKey('name')) throw Exception();

    final String type = templateFilename.containsKey('type')
        ? templateFilename['type']!
        : 'append';

    final String templateFileName = templateFilename['name']!;

    final outputFile = File(templateFileName);

    final template =
        Template(mustacheTpl.readAsStringSync(), name: templateFileName)
            .renderString(config);

    switch (type) {
      case 'prepend':
        final currentContent =
            outputFile.readAsStringSync().replaceFirst('# Changelog\n', '');

        if (!currentContent
            .startsWith(template.replaceFirst('# Changelog\n', ''))) {
          outputFile.writeAsStringSync(template, mode: FileMode.write);

          outputFile.writeAsStringSync(currentContent, mode: FileMode.append);
        }

        break;

      case 'overwrite':
        outputFile.deleteSync();

        outputFile.writeAsStringSync(template);

        break;

      default:
        outputFile.writeAsString(template, mode: FileMode.append);
    }
  });
}

Future<void> updatePubspec(String version) async {
  final pubSpec = await PubSpec.load(pubspecDirectory);

  final newPubSpec = pubSpec.copy(version: Version.parse(version));

  await newPubSpec.save(pubspecDirectory);

  Pub.upgrade();
}
