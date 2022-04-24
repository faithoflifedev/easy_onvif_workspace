import 'package:json_annotation/json_annotation.dart';

import 'audio_output_configuration.dart';
import 'audio_decoder_configuration.dart';

part 'extension.g.dart';

@JsonSerializable(explicitToJson: true)
class Extension {
  @JsonKey(name: 'Name')
  final AudioOutputConfiguration audioOutputConfiguration;

  @JsonKey(name: 'UseCount')
  final AudioDecoderConfiguration audioDecoderConfiguration;

  Extension(this.audioOutputConfiguration, this.audioDecoderConfiguration);

  factory Extension.fromJson(Map<String, dynamic> json) =>
      _$ExtensionFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionToJson(this);
}
