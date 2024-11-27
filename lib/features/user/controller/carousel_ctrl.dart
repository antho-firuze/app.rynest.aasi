import 'dart:developer';

import 'package:app.rynest.aasi/features/user/model/carousel.dart';
import 'package:app.rynest.aasi/features/user/service/carousel_service.dart';
import 'package:app.rynest.aasi/utils/custom_carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeCarouselController = CustomCarouselController();

final fetchCarouselProvider = FutureProvider.autoDispose<List<Carousel>>((ref) async {
  final state = await AsyncValue.guard(() async => await ref.read(carouselServiceProvider).all());

  if (state.hasError) return [];

  List<dynamic> jsonList = state.value;
  if (jsonList.isEmpty) return [];

  final result = jsonList.map((json) => Carousel.fromJson(json)).toList();
  log('fetchCarouselProvider | $result', name: 'carousel_controller');

  return result;
});

