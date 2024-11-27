// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamImpl _$$ExamImplFromJson(Map<String, dynamic> json) => _$ExamImpl(
      examStart: json['exam_start'] == null
          ? null
          : DateTime.parse(json['exam_start'] as String),
      examEnd: json['exam_end'] == null
          ? null
          : DateTime.parse(json['exam_end'] as String),
      duration: (json['duration'] as num?)?.toInt(),
      examCompleted: json['exam_completed'] as bool?,
      numOfQuestion: (json['num_of_question'] as num?)?.toInt(),
      numOfCorrect: (json['num_of_correct'] as num?)?.toInt(),
      numAnsweredQuestion: (json['num_answered_question'] as num?)?.toInt(),
      numRemainQuestion: (json['num_remain_question'] as num?)?.toInt(),
      numOfRepeat: (json['num_of_repeat'] as num?)?.toInt(),
      minOfAnswer: (json['min_of_answer'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ExamImplToJson(_$ExamImpl instance) =>
    <String, dynamic>{
      'exam_start': instance.examStart?.toIso8601String(),
      'exam_end': instance.examEnd?.toIso8601String(),
      'duration': instance.duration,
      'exam_completed': instance.examCompleted,
      'num_of_question': instance.numOfQuestion,
      'num_of_correct': instance.numOfCorrect,
      'num_answered_question': instance.numAnsweredQuestion,
      'num_remain_question': instance.numRemainQuestion,
      'num_of_repeat': instance.numOfRepeat,
      'min_of_answer': instance.minOfAnswer,
      'score': instance.score,
    };
