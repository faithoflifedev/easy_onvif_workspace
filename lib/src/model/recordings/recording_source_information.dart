import 'dart:convert';

import 'package:easy_onvif/soap.dart';
import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recording_source_information.g.dart';

/// Information about the source of the recording.
@JsonSerializable()
class RecordingSourceInformation {
  /// Identifier for the source chosen by the client that creates the structure.
  /// This identifier is opaque to the device. Clients may use any type of URI
  /// for this field. A device shall support at least 128 characters.
  @JsonKey(name: 'SourceId', fromJson: OnvifUtil.mappedToString)
  final String sourceId;

  /// Informative user readable name of the source, e.g. "Camera23". A device
  /// shall support at least 20 characters.
  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  /// Informative description of the physical location of the source, e.g. the
  /// coordinates on a map.
  @JsonKey(name: 'Location', fromJson: OnvifUtil.mappedToString)
  final String location;

  /// URI provided by the service supplying data to be recorded. A device shall
  /// support at least 128 characters.
  @JsonKey(name: 'Description', fromJson: OnvifUtil.mappedToString)
  final String description;

  /// Informative description of the physical location of the source, e.g. the
  /// coordinates on a map.
  @JsonKey(name: 'Address', fromJson: OnvifUtil.mappedToString)
  final String address;

  RecordingSourceInformation({
    required this.sourceId,
    required this.name,
    required this.location,
    required this.description,
    required this.address,
  });

  factory RecordingSourceInformation.fromJson(Map<String, dynamic> json) =>
      _$RecordingSourceInformationFromJson(json);

  Map<String, dynamic> toJson() => _$RecordingSourceInformationToJson(this);

  @override
  String toString() => json.encode(toJson());

  void toXml() {
    Transport.builder.element('Source', nest: () {
      Transport.builder.namespace(Xmlns.tt);

      Transport.builder.element('SourceId', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(sourceId);
      });

      Transport.builder.element('Name', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(name);
      });

      Transport.builder.element('Location', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(location);
      });

      Transport.builder.element('Description', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(description);
      });

      Transport.builder.element('Address', nest: () {
        Transport.builder.namespace(Xmlns.tt);
        Transport.builder.text(address);
      });
    });
  }
}
