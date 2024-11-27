import 'package:freezed_annotation/freezed_annotation.dart';

part 'latlong.freezed.dart';
part 'latlong.g.dart';

@freezed
class LatLong with _$LatLong {
  factory LatLong(
    double lat,
    double lng,
  ) = _LatLong;

  factory LatLong.fromJson(Map<String, dynamic> json) => _$LatLongFromJson(json);
}
