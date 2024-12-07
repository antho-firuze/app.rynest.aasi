// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_category.freezed.dart';
part 'exam_category.g.dart';

@freezed
class ExamCategory with _$ExamCategory {
  factory ExamCategory({
    @JsonIntConverter() int? id,
    String? name,
    @JsonIntConverter() @Default(0) int duration,
    @JsonKey(name: 'passed_grade') @JsonIntConverter() @Default(0) int passedGrade,
    @JsonKey(name: 'num_of_question') @JsonIntConverter() int? numOfQuestion,
  }) = _ExamCategory;

  factory ExamCategory.fromJson(Map<String, dynamic> json) => _$ExamCategoryFromJson(json);
}
