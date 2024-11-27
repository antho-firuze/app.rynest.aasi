// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {

  factory Question({
  int? id,
  String? question,
  @JsonKey(name: 'answer_option_a') String? answerOptionA,
  @JsonKey(name: 'answer_option_b') String? answerOptionB,
  @JsonKey(name: 'answer_option_c') String? answerOptionC,
  @JsonKey(name: 'answer_option_d') String? answerOptionD,
  @JsonKey(name: 'answer_option_e') String? answerOptionE,
  String? answerKey,
  @JsonKey(name: 'answered_key') String? answeredKey,
  List<QuestionOption>? options,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}

@freezed
class QuestionOption with _$QuestionOption {

  factory QuestionOption({
  int? questionId,
  String? optionKey,
  String? answerKey,
  String? answeredKey,
  String? textOption,
  }) = _QuestionOption;

  factory QuestionOption.fromJson(Map<String, dynamic> json) => _$QuestionOptionFromJson(json);
}