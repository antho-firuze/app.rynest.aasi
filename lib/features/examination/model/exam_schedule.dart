// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/features/examination/model/exam_category.dart';
import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_schedule.freezed.dart';
part 'exam_schedule.g.dart';

@freezed
class ExamSchedule with _$ExamSchedule {
  factory ExamSchedule({
    String? name,
    @JsonIntConverter() int? duration,
    String? notes,
    @JsonKey(name: 'schedule_request_id') @JsonIntConverter() int? scheduleRequestId,
    @JsonKey(name: 'schedule_id') @JsonIntConverter() int? scheduleId,
    @JsonKey(name: 'location_id') @JsonIntConverter() int? locationId,
    @JsonKey(name: 'category_id') @JsonIntConverter() int? categoryId,
    @JsonKey(name: 'open_registration') @JsonDateTimeConverter() DateTime? openRegistration,
    @JsonKey(name: 'close_registration') @JsonDateTimeConverter() DateTime? closeRegistration,
    ExamCategory? category,
  }) = _ExamSchedule;

  factory ExamSchedule.fromJson(Map<String, dynamic> json) => _$ExamScheduleFromJson(json);
}
