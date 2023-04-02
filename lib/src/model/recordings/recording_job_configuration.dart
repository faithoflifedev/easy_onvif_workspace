import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'recording_event_filter.dart';
import 'recording_job_source.dart';

part 'recording_job_configuration.g.dart';

@JsonSerializable()
class RecordingJobConfiguration {
  /// This attribute adds an additional requirement for activating the recording
  /// job. If this optional field is provided the job shall only record if the
  /// schedule exists and is active.
  @JsonKey(name: 'ScheduleToken', fromJson: OnvifUtil.nullableMappedToString)
  final String? scheduleToken;

  /// Identifies the recording to which this job shall store the received data.
  @JsonKey(name: 'RecordingToken', fromJson: OnvifUtil.mappedToString)
  final String recordingToken;

  /// Identifies the recording to which this job shall store the received data.
  @JsonKey(name: 'Mode', fromJson: _recordingJobConfiguration)
  final RecordingJobConfigurationMode mode;

  /// List of recording jobs.
  @JsonKey(name: 'Priority', fromJson: OnvifUtil.mappedToInt)
  final int priority;

  /// Source of the recording.
  @JsonKey(name: 'Source')
  final RecordingJobSource? source;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  /// Optional filter defining on which event condition a recording job gets active.
  @JsonKey(name: 'EventFilter')
  final RecordingEventFilter? eventFilter;

  RecordingJobConfiguration({
    this.scheduleToken,
    required this.recordingToken,
    required this.mode,
    required this.priority,
    this.source,
    this.extension,
    this.eventFilter,
  });

  factory RecordingJobConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RecordingJobConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingJobConfigurationToJson(this);

  @override
  String toString() => json.encode(toJson());

  void toXml() {
    Transport.builder.element('JobConfiguration', nest: () {
      Transport.builder.namespace(Xmlns.trc);

      if (scheduleToken != null) {
        Transport.builder.element('ScheduleToken', nest: () {
          Transport.builder.namespace(Xmlns.trc);
          Transport.builder.text(scheduleToken!);
        });
      }

      Transport.builder.element('RecordingToken', nest: () {
        Transport.builder.namespace(Xmlns.trc);
        Transport.builder.text(recordingToken);
      });

      Transport.builder.element('Mode', nest: () {
        Transport.builder.namespace(Xmlns.trc);
        Transport.builder.text(_$RecordingJobConfigurationModeEnumMap[mode]!);
      });

      Transport.builder.element('Priority', nest: () {
        Transport.builder.namespace(Xmlns.trc);
        Transport.builder.text(priority);
      });

      source?.toXml();

      if (eventFilter != null) {
        eventFilter!.toXml();
      }
    });
  }

  static RecordingJobConfigurationMode _recordingJobConfiguration(
          dynamic json) =>
      $enumDecode(_$RecordingJobConfigurationModeEnumMap,
          OnvifUtil.mappedToString(json));
}

enum RecordingJobConfigurationMode {
  @JsonValue('Idle')
  idle('Idle'),
  @JsonValue('Active')
  active('Active');

  const RecordingJobConfigurationMode(this.value);
  final String value;
}
