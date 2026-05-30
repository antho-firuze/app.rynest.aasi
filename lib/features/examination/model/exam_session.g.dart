// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamSessionImpl _$$ExamSessionImplFromJson(Map<String, dynamic> json) =>
    _$ExamSessionImpl(
      restart: (json['restart'] as num?)?.toInt(),
      deviceId: json['device_id'] as String?,
      deviceName: json['device_name'] as String?,
      ipAddress: json['ip_address'] as String?,
      location: json['location'] as String?,
      restartAt: const JsonDateTimeConverter().fromJson(json['restart_at']),
    );

Map<String, dynamic> _$$ExamSessionImplToJson(_$ExamSessionImpl instance) =>
    <String, dynamic>{
      'restart': instance.restart,
      'device_id': instance.deviceId,
      'device_name': instance.deviceName,
      'ip_address': instance.ipAddress,
      'location': instance.location,
      'restart_at': const JsonDateTimeConverter().toJson(instance.restartAt),
    };
