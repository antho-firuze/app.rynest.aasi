// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamImpl _$$ExamImplFromJson(Map<String, dynamic> json) => _$ExamImpl(
      id: (json['id'] as num?)?.toInt(),
      startAt: const JsonDateTimeConverter().fromJson(json['start_at']),
      finishAt: const JsonDateTimeConverter().fromJson(json['finish_at']),
      duration: const JsonIntConverter().fromJson(json['duration']),
      realDuration: json['real_duration'] as String?,
      questionIds: json['question_ids'] as String?,
      answerKeys: json['answer_keys'] as String?,
      syncQuestion: const JsonIntConverter().fromJson(json['sync_question']),
      clickScore: const JsonIntConverter().fromJson(json['click_score']),
      checkScore: const JsonIntConverter().fromJson(json['check_score']),
      questionCount: const JsonIntConverter().fromJson(json['questions']),
      answeredCount: const JsonIntConverter().fromJson(json['answered_count']),
      correctCount: const JsonIntConverter().fromJson(json['r_answered_count']),
      wrongCount: const JsonIntConverter().fromJson(json['w_answered_count']),
      passedGrade: const JsonDoubleConverter().fromJson(json['passed_grade']),
      score: const JsonDoubleConverter().fromJson(json['score']),
      desc1: json['desc1'] as String?,
      desc2: json['desc2'] as String?,
      restart: (json['restart'] as num?)?.toInt(),
      device: json['device'] as String?,
      location: json['location'] as String?,
      ipAddress: json['ip_address'] as String?,
      photoStart: json['photo_start'] as bool? ?? false,
      photoFinish: json['photo_finish'] as bool? ?? false,
      state: json['state'] as String?,
      qids: (json['qids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      opts:
          (json['opts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      keys:
          (json['keys'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$ExamImplToJson(_$ExamImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start_at': const JsonDateTimeConverter().toJson(instance.startAt),
      'finish_at': const JsonDateTimeConverter().toJson(instance.finishAt),
      'duration': _$JsonConverterToJson<dynamic, int>(
          instance.duration, const JsonIntConverter().toJson),
      'real_duration': instance.realDuration,
      'question_ids': instance.questionIds,
      'answer_keys': instance.answerKeys,
      'sync_question': _$JsonConverterToJson<dynamic, int>(
          instance.syncQuestion, const JsonIntConverter().toJson),
      'click_score': _$JsonConverterToJson<dynamic, int>(
          instance.clickScore, const JsonIntConverter().toJson),
      'check_score': _$JsonConverterToJson<dynamic, int>(
          instance.checkScore, const JsonIntConverter().toJson),
      'questions': _$JsonConverterToJson<dynamic, int>(
          instance.questionCount, const JsonIntConverter().toJson),
      'answered_count': _$JsonConverterToJson<dynamic, int>(
          instance.answeredCount, const JsonIntConverter().toJson),
      'r_answered_count': _$JsonConverterToJson<dynamic, int>(
          instance.correctCount, const JsonIntConverter().toJson),
      'w_answered_count': _$JsonConverterToJson<dynamic, int>(
          instance.wrongCount, const JsonIntConverter().toJson),
      'passed_grade': _$JsonConverterToJson<dynamic, double>(
          instance.passedGrade, const JsonDoubleConverter().toJson),
      'score': _$JsonConverterToJson<dynamic, double>(
          instance.score, const JsonDoubleConverter().toJson),
      'desc1': instance.desc1,
      'desc2': instance.desc2,
      'restart': instance.restart,
      'device': instance.device,
      'location': instance.location,
      'ip_address': instance.ipAddress,
      'photo_start': instance.photoStart,
      'photo_finish': instance.photoFinish,
      'state': instance.state,
      'qids': instance.qids,
      'opts': instance.opts,
      'keys': instance.keys,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
