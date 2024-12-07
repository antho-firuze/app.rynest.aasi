// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    @JsonIntConverter() int? id,
    @JsonKey(name: 'question_id') String? questionId,
    String? shuffle,
    String? question,
    @JsonKey(name: 'answer_option_a') String? answerOptionA,
    @JsonKey(name: 'answer_option_b') String? answerOptionB,
    @JsonKey(name: 'answer_option_c') String? answerOptionC,
    @JsonKey(name: 'answer_option_d') String? answerOptionD,
    @JsonKey(name: 'answer_key') String? answerKey,
    @JsonKey(name: 'answered_key') String? answeredKey,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}

extension QuestionExt on Question {
  String? shuffledOption([String? letter]) => letter == 'a'
      ? answerOptionA
      : letter == 'b'
          ? answerOptionB
          : letter == 'c'
              ? answerOptionC
              : letter == 'd'
                  ? answerOptionD
                  : '';

  get shuffledA => shuffle?.substring(0, 1);
  get shuffledB => shuffle?.substring(1, 2);
  get shuffledC => shuffle?.substring(2, 3);
  get shuffledD => shuffle?.substring(3, 4);
  get shuffledOptionA => shuffledOption(shuffledA);
  get shuffledOptionB => shuffledOption(shuffledB);
  get shuffledOptionC => shuffledOption(shuffledC);
  get shuffledOptionD => shuffledOption(shuffledD);
}
