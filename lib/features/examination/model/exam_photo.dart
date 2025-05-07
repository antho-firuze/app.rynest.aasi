// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_photo.freezed.dart';
part 'exam_photo.g.dart';

@freezed
class ExamPhoto with _$ExamPhoto {

  factory ExamPhoto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _ExamPhoto;

  factory ExamPhoto.fromJson(Map<String, dynamic> json) => _$ExamPhotoFromJson(json);
}