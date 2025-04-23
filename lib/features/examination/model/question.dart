// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    @JsonIntConverter() int? id,
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'option_a') String? optionA,
    @JsonKey(name: 'option_b') String? optionB,
    @JsonKey(name: 'option_c') String? optionC,
    @JsonKey(name: 'option_d') String? optionD,
    @JsonKey(name: 'shuffle_option_a') String? shuffleOptionA,
    @JsonKey(name: 'shuffle_option_b') String? shuffleOptionB,
    @JsonKey(name: 'shuffle_option_c') String? shuffleOptionC,
    @JsonKey(name: 'shuffle_option_d') String? shuffleOptionD,
    @JsonKey(name: 'answer_key') String? answerKey,
    @JsonKey(name: 'answered_key') String? answeredKey,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
