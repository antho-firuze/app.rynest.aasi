// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamImpl _$$ExamImplFromJson(Map<String, dynamic> json) => _$ExamImpl(
      examStart: const JsonDateTimeConverter().fromJson(json['exam_start']),
      examEnd: const JsonDateTimeConverter().fromJson(json['exam_end']),
      duration: const JsonIntConverter().fromJson(json['duration']),
      questionIds: json['question_ids'] as String?,
      answerKeys: json['answer_keys'] as String?,
      syncQuestion: const JsonIntConverter().fromJson(json['sync_question']),
      examCompleted: json['exam_completed'] as bool?,
      numOfRepeat: const JsonIntConverter().fromJson(json['num_of_repeat']),
      numOfCorrect: const JsonIntConverter().fromJson(json['num_of_correct']),
      numAnsweredQuestion:
          const JsonIntConverter().fromJson(json['num_answered_question']),
      numOfQuestion: const JsonIntConverter().fromJson(json['num_of_question']),
      score: const JsonDoubleConverter().fromJson(json['score']),
      passedGrade: const JsonDoubleConverter().fromJson(json['passed_grade']),
    );

Map<String, dynamic> _$$ExamImplToJson(_$ExamImpl instance) =>
    <String, dynamic>{
      'exam_start': const JsonDateTimeConverter().toJson(instance.examStart),
      'exam_end': const JsonDateTimeConverter().toJson(instance.examEnd),
      'duration': _$JsonConverterToJson<dynamic, int>(
          instance.duration, const JsonIntConverter().toJson),
      'question_ids': instance.questionIds,
      'answer_keys': instance.answerKeys,
      'sync_question': _$JsonConverterToJson<dynamic, int>(
          instance.syncQuestion, const JsonIntConverter().toJson),
      'exam_completed': instance.examCompleted,
      'num_of_repeat': _$JsonConverterToJson<dynamic, int>(
          instance.numOfRepeat, const JsonIntConverter().toJson),
      'num_of_correct': _$JsonConverterToJson<dynamic, int>(
          instance.numOfCorrect, const JsonIntConverter().toJson),
      'num_answered_question': _$JsonConverterToJson<dynamic, int>(
          instance.numAnsweredQuestion, const JsonIntConverter().toJson),
      'num_of_question': _$JsonConverterToJson<dynamic, int>(
          instance.numOfQuestion, const JsonIntConverter().toJson),
      'score': _$JsonConverterToJson<dynamic, double>(
          instance.score, const JsonDoubleConverter().toJson),
      'passed_grade': _$JsonConverterToJson<dynamic, double>(
          instance.passedGrade, const JsonDoubleConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
