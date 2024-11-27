// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarouselImpl _$$CarouselImplFromJson(Map<String, dynamic> json) =>
    _$CarouselImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      linkUrl: json['url'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$CarouselImplToJson(_$CarouselImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.linkUrl,
      'image': instance.image,
    };
