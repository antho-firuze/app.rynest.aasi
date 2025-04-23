import 'package:freezed_annotation/freezed_annotation.dart';

part 'reqs.freezed.dart';
part 'reqs.g.dart';

@freezed
class Reqs with _$Reqs {

  factory Reqs({
    String? method,
    Map<String, dynamic>? params,
    String? url,
    String? path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? filePath,
    @Default('userfile') String fileKey,
  }) = _Reqs;

  factory Reqs.fromJson(Map<String, dynamic> json) => _$ReqsFromJson(json);
}