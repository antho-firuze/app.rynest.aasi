// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_service.g.dart';

@JsonLiteral('../repository/banner.json', asConst: true)
const banner = _$bannerJsonLiteral;

class CarouselService {
  Ref ref;
  CarouselService(this.ref);

  Future all({Map<String, dynamic>? data}) async {

    return banner;
  }
}

final carouselServiceProvider = Provider(CarouselService.new);
