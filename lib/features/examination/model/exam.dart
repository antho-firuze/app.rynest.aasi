// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
class Exam with _$Exam {
  factory Exam({
    @JsonKey(name: 'exam_start') DateTime? examStart,
    @JsonKey(name: 'exam_end') DateTime? examEnd,
    int? duration,
    @JsonKey(name: 'exam_completed') bool? examCompleted,
    @JsonKey(name: 'num_of_question') int? numOfQuestion,
    @JsonKey(name: 'num_of_correct') int? numOfCorrect,
    @JsonKey(name: 'num_answered_question') int? numAnsweredQuestion,
    @JsonKey(name: 'num_remain_question') int? numRemainQuestion,
    @JsonKey(name: 'num_of_repeat') int? numOfRepeat,
    @JsonKey(name: 'min_of_answer') int? minOfAnswer,
    double? score,
  }) = _Exam;

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
}
