// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: const JsonIntConverter().fromJson(json['id']),
      questionId: json['question_id'] as String?,
      shuffle: json['shuffle'] as String?,
      question: json['question'] as String?,
      answerOptionA: json['answer_option_a'] as String?,
      answerOptionB: json['answer_option_b'] as String?,
      answerOptionC: json['answer_option_c'] as String?,
      answerOptionD: json['answer_option_d'] as String?,
      answerKey: json['answer_key'] as String?,
      answeredKey: json['answered_key'] as String?,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, int>(
          instance.id, const JsonIntConverter().toJson),
      'question_id': instance.questionId,
      'shuffle': instance.shuffle,
      'question': instance.question,
      'answer_option_a': instance.answerOptionA,
      'answer_option_b': instance.answerOptionB,
      'answer_option_c': instance.answerOptionC,
      'answer_option_d': instance.answerOptionD,
      'answer_key': instance.answerKey,
      'answered_key': instance.answeredKey,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
