// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:app.rynest.aasi/utils/string_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
class Exam with _$Exam {
  factory Exam({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'start_at') @JsonDateTimeConverter() DateTime? startAt,
    @JsonKey(name: 'finish_at') @JsonDateTimeConverter() DateTime? finishAt,
    @JsonKey(name: 'duration') @JsonIntConverter() int? duration,
    @JsonKey(name: 'real_duration') String? realDuration,
    @JsonKey(name: 'question_ids') String? questionIds,
    @JsonKey(name: 'answer_keys') String? answerKeys,
    @JsonKey(name: 'sync_question') @JsonIntConverter() int? syncQuestion,
    @JsonKey(name: 'click_score') @JsonIntConverter() int? clickScore,
    @JsonKey(name: 'check_score') @JsonIntConverter() int? checkScore,
    @JsonKey(name: 'questions') @JsonIntConverter() int? questionCount,
    @JsonKey(name: 'answered_count') @JsonIntConverter() int? answeredCount,
    @JsonKey(name: 'r_answered_count') @JsonIntConverter() int? correctCount,
    @JsonKey(name: 'w_answered_count') @JsonIntConverter() int? wrongCount,
    @JsonKey(name: 'passed_grade') @JsonDoubleConverter() double? passedGrade,
    @JsonKey(name: 'score') @JsonDoubleConverter() double? score,
    @JsonKey(name: 'desc1') String? desc1,
    @JsonKey(name: 'desc2') String? desc2,
    @JsonKey(name: 'restart') int? restart,
    @JsonKey(name: 'device') String? device,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'ip_address') String? ipAddress,
    @JsonKey(name: 'photo_start') @Default(false) bool photoStart,
    @JsonKey(name: 'photo_finish') @Default(false) bool photoFinish,
    @JsonKey(name: 'state') String? state,
    @Default([]) List<int> qids,
    @Default([]) List<String> opts,
    @Default([]) List<String> keys,
  }) = _Exam;

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);
}

extension ExamExt on Exam {
  Exam afterStart() {
    // Extract data question_ids
    final arrQuestionIds = questionIds?.split(',') ?? [];
    List<int> qids_ = [];
    List<String> opts_ = [];
    for (var idOpt in arrQuestionIds) {
      int id = idOpt.substring(0, idOpt.length - 4).toInt();
      String option = idOpt.substring(idOpt.length - 4);
      qids_.add(id);
      opts_.add(option);
    }

    // Extract data answer_keys
    final arrKeys = answerKeys?.split(',') ?? [];

    return copyWith(qids: qids_, opts: opts_, keys: arrKeys);
  }

  Exam afterAnswer(int idx, String answer) {
    // Extract data answer_keys
    final arrAnswerKeys = answerKeys?.split(',') ?? [];
    arrAnswerKeys[idx] = answer;

    return copyWith(answerKeys: arrAnswerKeys.join(','), keys: arrAnswerKeys);
  }
}
