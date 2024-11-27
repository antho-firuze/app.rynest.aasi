import 'package:freezed_annotation/freezed_annotation.dart';

part 'reqs.freezed.dart';
part 'reqs.g.dart';

@freezed
class Reqs with _$Reqs {

  factory Reqs({
    required String method,
    Map<String, dynamic>? params,
    String? filePath,
  }) = _Reqs;

  factory Reqs.fromJson(Map<String, dynamic> json) => _$ReqsFromJson(json);
}