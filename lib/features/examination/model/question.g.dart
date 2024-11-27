// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
      answerOptionA: json['answer_option_a'] as String?,
      answerOptionB: json['answer_option_b'] as String?,
      answerOptionC: json['answer_option_c'] as String?,
      answerOptionD: json['answer_option_d'] as String?,
      answerOptionE: json['answer_option_e'] as String?,
      answerKey: json['answerKey'] as String?,
      answeredKey: json['answered_key'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => QuestionOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer_option_a': instance.answerOptionA,
      'answer_option_b': instance.answerOptionB,
      'answer_option_c': instance.answerOptionC,
      'answer_option_d': instance.answerOptionD,
      'answer_option_e': instance.answerOptionE,
      'answerKey': instance.answerKey,
      'answered_key': instance.answeredKey,
      'options': instance.options,
    };

_$QuestionOptionImpl _$$QuestionOptionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionOptionImpl(
      questionId: (json['questionId'] as num?)?.toInt(),
      optionKey: json['optionKey'] as String?,
      answerKey: json['answerKey'] as String?,
      answeredKey: json['answeredKey'] as String?,
      textOption: json['textOption'] as String?,
    );

Map<String, dynamic> _$$QuestionOptionImplToJson(
        _$QuestionOptionImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'optionKey': instance.optionKey,
      'answerKey': instance.answerKey,
      'answeredKey': instance.answeredKey,
      'textOption': instance.textOption,
    };
