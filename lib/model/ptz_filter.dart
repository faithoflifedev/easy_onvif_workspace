import 'package:easy_onvif/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ptz_filter.g.dart';

///optional element to configure which PTZ related data is to include in the metadata stream
@JsonSerializable()
class PtzFilter {
  ///True if the metadata stream shall contain the PTZ status (IDLE, MOVING or
  ///UNKNOWN)
  @JsonKey(name: 'Status', fromJson: OnvifUtil.mappedToBool)
  final bool status;

  ///True if the metadata stream shall contain the PTZ position
  @JsonKey(name: 'Position', fromJson: OnvifUtil.mappedToBool)
  final bool position;

  PtzFilter({required this.status, required this.position});

  factory PtzFilter.fromJson(Map<String, dynamic> json) =>
      _$PtzFilterFromJson(json);

  Map<String, dynamic> toJson() => _$PtzFilterToJson(this);
}
