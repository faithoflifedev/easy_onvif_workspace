import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'focus_status_20.dart';

part 'imaging_status_20.g.dart';

/// Requested imaging status.
@JsonSerializable()
class ImagingStatus20 {
  /// Status of focus.
  @JsonKey(name: 'FocusStatus20')
  final FocusStatus20? focusStatus20;

  @JsonKey(name: 'Extension')
  final Map<String, dynamic>? extension;

  ImagingStatus20({required this.focusStatus20, this.extension});

  factory ImagingStatus20.fromJson(Map<String, dynamic> json) =>
      _$ImagingStatus20FromJson(json);

  Map<String, dynamic> toJson() => _$ImagingStatus20ToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
