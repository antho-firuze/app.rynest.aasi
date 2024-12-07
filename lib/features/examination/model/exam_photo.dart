// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_photo.freezed.dart';
part 'exam_photo.g.dart';

@freezed
class ExamPhotos with _$ExamPhotos {

  factory ExamPhotos({
    String? selfie,
    String? idCard,
    @JsonKey(name: 'exam_finish') String? examFinish,
    @JsonKey(name: 'exam_start') String? examStart,
  }) = _ExamPhotos;

  factory ExamPhotos.fromJson(Map<String, dynamic> json) => _$ExamPhotosFromJson(json);
}