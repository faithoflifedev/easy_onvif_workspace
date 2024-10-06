import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'capabilities.g.dart';

/// The capabilities for the recording service is returned in the Capabilities
/// element.
@JsonSerializable()
class Capabilities {
  /// Indication if the device supports dynamic creation and deletion of
  /// recordings
  @JsonKey(name: '@DynamicRecordings', fromJson: OnvifUtil.stringToBool)
  final bool dynamicRecordings;

  /// Indication if the device supports dynamic creation and deletion of tracks
  @JsonKey(name: '@DynamicTracks', fromJson: OnvifUtil.stringToBool)
  final bool dynamicTracks;

  /// Indication which encodings are supported for recording. The list may
  /// contain one or more enumeration values of tt:VideoEncoding and
  /// tt:AudioEncoding. For encodings that are neither defined in
  /// tt:VideoEncoding nor tt:AudioEncoding the device shall use the [IANA](http://www.iana.org/assignments/media-types/media-types.xhtml)
  /// definitions. Note, that a device without audio support shall not return
  /// audio encodings.
  @JsonKey(name: '@Encoding', fromJson: OnvifUtil.stringToList)
  final List<String> encoding;

  /// Maximum supported bit rate for all tracks of a recording in kBit/s.
  @JsonKey(name: '@MaxRate', fromJson: int.parse)
  final int maxRate;

  /// Maximum supported bit rate for all recordings in kBit/s.
  @JsonKey(name: '@MaxTotalRate', fromJson: int.parse)
  final int maxTotalRate;

  /// Maximum number of recordings supported. (Integer values only.)
  @JsonKey(name: '@MaxRecordings', fromJson: int.parse)
  final int maxRecordings;

  /// Maximum total number of supported recording jobs by the device.
  @JsonKey(name: '@MaxRecordingJobs', fromJson: int.parse)
  final int maxRecordingJobs;

  /// Indication if the device supports the GetRecordingOptions command.
  @JsonKey(name: '@Options', fromJson: OnvifUtil.stringToBool)
  final bool options;

  /// Indication if the device supports recording metadata.
  @JsonKey(name: '@MetadataRecording', fromJson: OnvifUtil.nullableStringToBool)
  final bool? metadataRecording;

  /// Indication that the device supports ExportRecordedData command for the
  /// listed export file formats. The list shall return at least one export file
  /// format value. The value of 'ONVIF' refers to ONVIF Export File Format
  /// specification.
  @JsonKey(
      name: '@SupportedExportFileFormats',
      fromJson: OnvifUtil.nullableStringToBool)
  final bool? supportedExportFileFormats;

  /// Indication that the device supports event triggered recording.
  @JsonKey(name: '@EventRecording', fromJson: OnvifUtil.nullableStringToBool)
  final bool? eventRecording;

  /// If present a device shall support configuring before event durations up to
  /// the given value.
  @JsonKey(name: '@BeforeEventLimit')
  final String? beforeEventLimit;

  /// If present a device shall support configuring after event durations up to
  /// the given value.
  @JsonKey(name: '@AfterEventLimit')
  final String? afterEventLimit;

  Capabilities({
    required this.dynamicRecordings,
    required this.dynamicTracks,
    required this.encoding,
    required this.maxRate,
    required this.maxTotalRate,
    required this.maxRecordings,
    required this.maxRecordingJobs,
    required this.options,
    this.metadataRecording,
    this.supportedExportFileFormats,
    this.eventRecording,
    this.beforeEventLimit,
    this.afterEventLimit,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}
