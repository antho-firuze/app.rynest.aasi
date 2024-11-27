import 'package:freezed_annotation/freezed_annotation.dart';

part 'resp.freezed.dart';
part 'resp.g.dart';

@freezed
class Resp with _$Resp {
  factory Resp({
    bool? status,
    String? message,
    Map<String, dynamic>? result,
    Err? error,
  }) = _Resp;

  factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);
}

@freezed
class Err with _$Err {
  factory Err({
    String? message,
    int? code,
  }) = _Err;

  factory Err.fromJson(Map<String, dynamic> json) => _$ErrFromJson(json);
}

extension RespX on Resp {
  bool hasResult() => result != null;

  bool hasError() => status == false;
}
