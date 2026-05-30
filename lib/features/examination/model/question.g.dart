// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: const JsonIntConverter().fromJson(json['id']),
      question: json['question'] as String?,
      optionA: json['option_a'] as String?,
      optionB: json['option_b'] as String?,
      optionC: json['option_c'] as String?,
      optionD: json['option_d'] as String?,
      shuffleOptionA: json['shuffle_option_a'] as String?,
      shuffleOptionB: json['shuffle_option_b'] as String?,
      shuffleOptionC: json['shuffle_option_c'] as String?,
      shuffleOptionD: json['shuffle_option_d'] as String?,
      answerKey: json['answer_key'] as String?,
      answeredKey: json['answered_key'] as String?,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, int>(
          instance.id, const JsonIntConverter().toJson),
      'question': instance.question,
      'option_a': instance.optionA,
      'option_b': instance.optionB,
      'option_c': instance.optionC,
      'option_d': instance.optionD,
      'shuffle_option_a': instance.shuffleOptionA,
      'shuffle_option_b': instance.shuffleOptionB,
      'shuffle_option_c': instance.shuffleOptionC,
      'shuffle_option_d': instance.shuffleOptionD,
      'answer_key': instance.answerKey,
      'answered_key': instance.answeredKey,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
