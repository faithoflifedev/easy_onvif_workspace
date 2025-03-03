import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'modal_options.dart';

part 'pt_control_direction.g.dart';

/// Supported options for PT Direction Control.
@JsonSerializable()
class PtControlDirectionOptions {
  /// Supported options for EFlip feature.
  @JsonKey(name: 'EFlip')
  final ModalOptions? eFlip;

  /// Supported options for Reverse feature.
  @JsonKey(name: 'Reverse')
  final ModalOptions? reverse;

  PtControlDirectionOptions({this.eFlip, this.reverse});

  factory PtControlDirectionOptions.fromJson(Map<String, dynamic> json) =>
      _$PtControlDirectionOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$PtControlDirectionOptionsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
