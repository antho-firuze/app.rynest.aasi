// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamPhotoImpl _$$ExamPhotoImplFromJson(Map<String, dynamic> json) =>
    _$ExamPhotoImpl(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$ExamPhotoImplToJson(_$ExamPhotoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'image_url': instance.imageUrl,
    };
