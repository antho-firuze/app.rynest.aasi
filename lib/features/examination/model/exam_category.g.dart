// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamCategoryImpl _$$ExamCategoryImplFromJson(Map<String, dynamic> json) =>
    _$ExamCategoryImpl(
      id: const JsonIntConverter().fromJson(json['id']),
      name: json['name'] as String?,
      duration: json['duration'] == null
          ? 0
          : const JsonIntConverter().fromJson(json['duration']),
      passedGrade: json['passed_grade'] == null
          ? 0
          : const JsonIntConverter().fromJson(json['passed_grade']),
      numOfQuestion: const JsonIntConverter().fromJson(json['num_of_question']),
    );

Map<String, dynamic> _$$ExamCategoryImplToJson(_$ExamCategoryImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, int>(
          instance.id, const JsonIntConverter().toJson),
      'name': instance.name,
      'duration': const JsonIntConverter().toJson(instance.duration),
      'passed_grade': const JsonIntConverter().toJson(instance.passedGrade),
      'num_of_question': _$JsonConverterToJson<dynamic, int>(
          instance.numOfQuestion, const JsonIntConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
