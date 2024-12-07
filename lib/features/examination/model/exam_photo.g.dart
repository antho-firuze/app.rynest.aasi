// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamPhotosImpl _$$ExamPhotosImplFromJson(Map<String, dynamic> json) =>
    _$ExamPhotosImpl(
      selfie: json['selfie'] as String?,
      idCard: json['idCard'] as String?,
      examFinish: json['exam_finish'] as String?,
      examStart: json['exam_start'] as String?,
    );

Map<String, dynamic> _$$ExamPhotosImplToJson(_$ExamPhotosImpl instance) =>
    <String, dynamic>{
      'selfie': instance.selfie,
      'idCard': instance.idCard,
      'exam_finish': instance.examFinish,
      'exam_start': instance.examStart,
    };
