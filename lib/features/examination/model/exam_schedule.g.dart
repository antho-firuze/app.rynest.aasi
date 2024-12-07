// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamScheduleImpl _$$ExamScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ExamScheduleImpl(
      name: json['name'] as String?,
      duration: const JsonIntConverter().fromJson(json['duration']),
      notes: json['notes'] as String?,
      scheduleRequestId:
          const JsonIntConverter().fromJson(json['schedule_request_id']),
      scheduleId: const JsonIntConverter().fromJson(json['schedule_id']),
      locationId: const JsonIntConverter().fromJson(json['location_id']),
      categoryId: const JsonIntConverter().fromJson(json['category_id']),
      openRegistration:
          const JsonDateTimeConverter().fromJson(json['open_registration']),
      closeRegistration:
          const JsonDateTimeConverter().fromJson(json['close_registration']),
      category: json['category'] == null
          ? null
          : ExamCategory.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExamScheduleImplToJson(_$ExamScheduleImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'duration': _$JsonConverterToJson<dynamic, int>(
          instance.duration, const JsonIntConverter().toJson),
      'notes': instance.notes,
      'schedule_request_id': _$JsonConverterToJson<dynamic, int>(
          instance.scheduleRequestId, const JsonIntConverter().toJson),
      'schedule_id': _$JsonConverterToJson<dynamic, int>(
          instance.scheduleId, const JsonIntConverter().toJson),
      'location_id': _$JsonConverterToJson<dynamic, int>(
          instance.locationId, const JsonIntConverter().toJson),
      'category_id': _$JsonConverterToJson<dynamic, int>(
          instance.categoryId, const JsonIntConverter().toJson),
      'open_registration':
          const JsonDateTimeConverter().toJson(instance.openRegistration),
      'close_registration':
          const JsonDateTimeConverter().toJson(instance.closeRegistration),
      'category': instance.category,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
