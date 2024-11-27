// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel.freezed.dart';
part 'carousel.g.dart';

@freezed
class Carousel with _$Carousel {

  factory Carousel({
    @Default(0) int id,
    @JsonKey(name: 'url') @Default('') String linkUrl,
    @JsonKey(name: 'image') @Default('') String image,
  }) = _Carousel;

  factory Carousel.fromJson(Map<String, dynamic> json) => _$CarouselFromJson(json);
}