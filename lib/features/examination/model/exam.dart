// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
class Exam with _$Exam {
  factory Exam({
    @JsonKey(name: 'exam_start') @JsonDateTimeConverter() DateTime? examStart,
    @JsonKey(name: 'exam_end') @JsonDateTimeConverter() DateTime? examEnd,
    @JsonIntConverter() int? duration,
    @JsonKey(name: 'question_ids') String? questionIds,
    @JsonKey(name: 'answer_keys') String? answerKeys,
    @JsonKey(name: 'sync_question') @JsonIntConverter() int? syncQuestion,
    @JsonKey(name: 'exam_completed') bool? examCompleted,
    @JsonKey(name: 'num_of_repeat') @JsonIntConverter() int? numOfRepeat,
    @JsonKey(name: 'num_of_correct') @JsonIntConverter() int? numOfCorrect,
    @JsonKey(name: 'num_answered_question') @JsonIntConverter() int? numAnsweredQuestion,
    @JsonKey(name: 'num_of_question') @JsonIntConverter() int? numOfQuestion,
    double? score,
    @JsonKey(name: 'passed_grade') @JsonDoubleConverter() double? passedGrade,
  }) = _Exam;

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
}
