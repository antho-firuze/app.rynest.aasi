// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_session.freezed.dart';
part 'exam_session.g.dart';

@freezed
class ExamSession with _$ExamSession {

  factory ExamSession({
    @JsonKey(name: 'restart') int? restart,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'device_name') String? deviceName,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'restart_at') @JsonDateTimeConverter() DateTime? restartAt,
  }) = _ExamSession;

  factory ExamSession.fromJson(Map<String, dynamic> json) => _$ExamSessionFromJson(json);
}