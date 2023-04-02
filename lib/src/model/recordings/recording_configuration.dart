import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recording_source_information.dart';

part 'recording_configuration.g.dart';

/// Configuration of the recording.
@JsonSerializable()
class RecordingConfiguration {
  /// Information about the source of the recording.
  @JsonKey(name: 'Source')
  final RecordingSourceInformation source;

  /// Informative description of the source.
  @JsonKey(name: 'Content', fromJson: OnvifUtil.mappedToString)
  final String content;

  /// Specifies the maximum time that data in any track within the recording
  /// shall be stored. The device shall delete any data older than the maximum
  /// retention time. Such data shall not be accessible anymore. If the
  /// MaximumRetentionPeriod is set to 0, the device shall not limit the
  /// retention time of stored data, except by resource constraints. Whatever
  /// the value of MaximumRetentionTime, the device may automatically delete
  /// recordings to free up storage space for new recordings.
  @JsonKey(name: 'MaximumRetentionTime', fromJson: OnvifUtil.mappedToString)
  final String maximumRetentionTime;

  RecordingConfiguration({
    required this.source,
    required this.content,
    required this.maximumRetentionTime,
  });

  factory RecordingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RecordingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());

  void toXml() {
    Transport.builder.element('RecordingConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.tt);

      source.toXml();

      Transport.builder.element('Content', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(content);
      });

      Transport.builder.element('MaximumRetentionTime', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(maximumRetentionTime);
      });
    });
  }
}
