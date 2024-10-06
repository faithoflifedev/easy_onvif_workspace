import 'package:publish_tools/publish_tools.dart';

main(args) async {
  PublishTools.addAllTasks();

  grind(args);
}

@DefaultTask('Just keeping it real')
@Depends('pt-commit', 'pt-publish')
done() {
  log('commit to faithoflifedev/easy_onvif complete');
  log('publish to pub.dev/packages complete.');
  // log('commit to faithoflifedev/homebrew-easy_onvif complete');
}
