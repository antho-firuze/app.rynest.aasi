import 'package:freezed_annotation/freezed_annotation.dart';

part 'resp.freezed.dart';
part 'resp.g.dart';

@freezed
class RespError with _$RespError {

  factory RespError({
    int? code,
    String? message,
  }) = _RespError;

  factory RespError.fromJson(Map<String, dynamic> json) => _$RespErrorFromJson(json);
}