import 'dart:convert';

import 'package:easy_onvif/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'modal_options.g.dart';

/// Supported options for PT Direction Control.
@JsonSerializable()
class ModalOptions {
  /// Options of EFlip mode parameter.
  /// - enum { 'OFF', 'ON', 'Extended' }
  @JsonKey(name: 'Mode', fromJson: OnvifUtil.nullableMappedToStringList)
  final List<String>? mode;

  ModalOptions({this.mode});

  factory ModalOptions.fromJson(Map<String, dynamic> json) =>
      _$ModalOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ModalOptionsToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}
