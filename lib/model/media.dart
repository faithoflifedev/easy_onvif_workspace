import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

///Media capabilities
@JsonSerializable(explicitToJson: true)
class Media {
  @JsonKey(name: 'XAddr')
  final dynamic xmlXaddr;

  ///Media service URI.
  String get xaddr => xmlXaddr['\$'];

  Media(this.xmlXaddr);

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
