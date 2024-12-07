import 'package:app.rynest.aasi/common/exceptions/image_failed.dart';
import 'package:app.rynest.aasi/common/exceptions/loading_failed.dart';
import 'package:app.rynest.aasi/common/widgets/custom_interactive_viewer.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/user/controller/carousel_ctrl.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/responsive_screen.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPage extends ConsumerWidget {
  const CarouselPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchCarouselProvider).when(
          skipLoadingOnRefresh: false,
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => LoadingFailed(onTap: () => ref.refresh(fetchCarouselProvider)),
          data: (data) {
            if (data.isEmpty) return ImageFailed(onTap: () => ref.refresh(fetchCarouselProvider));
            return ResponsiveScreen(
              largeScreen: SizedBox(
                height: context.screenHeight * 0.35,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CarouselSlider(
                        carouselController: homeCarouselController,
                        options: CarouselOptions(
                          height: context.screenHeight * 0.3,
                          enlargeFactor: .3,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {},
                        ),
                        items: List.generate(data.length, (index) {
                          final item = data[index];
                          return GestureDetector(
                            onTap: () => context.goto(page: CustomInteractiveViewer(child: Image.asset(item.image))),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.transparent,
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // 10.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FutureBuilder(
                        future: homeCarouselController.onReady,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done ||
                              homeCarouselController.state!.pageController != null) {
                            return SmoothPageIndicator(
                              controller: homeCarouselController.state!.pageController!,
                              count: homeCarouselController.state!.itemCount!,
                              onDotClicked: (index) => homeCarouselController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              ),
                              effect: const SlideEffect(
                                activeDotColor: oWhite,
                                dotColor: oGrey70,
                                dotWidth: 8,
                                dotHeight: 8,
                                type: SlideType.slideUnder,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    // 10.height,
                  ],
                ),
              ),
              child: SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CarouselSlider(
                        carouselController: homeCarouselController,
                        options: CarouselOptions(
                          height: 230.whenLandscape(230),
                          enlargeFactor: .3.whenLandscape(.2)!,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, _) {},
                        ),
                        items: List.generate(data.length, (index) {
                          final item = data[index];
                          return GestureDetector(
                            onTap: () => context.goto(
                              page: CustomInteractiveViewer(
                                child: Image.asset(item.image),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.transparent,
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // 10.height,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FutureBuilder(
                        future: homeCarouselController.onReady,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done ||
                              homeCarouselController.state!.pageController != null) {
                            return SmoothPageIndicator(
                              controller: homeCarouselController.state!.pageController!,
                              count: homeCarouselController.state!.itemCount!,
                              onDotClicked: (index) => homeCarouselController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              ),
                              effect: const SlideEffect(
                                activeDotColor: oWhite,
                                dotColor: oGrey70,
                                dotWidth: 8,
                                dotHeight: 8,
                                type: SlideType.slideUnder,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    // 10.height,
                  ],
                ),
              ),
            );
          },
        );
  }
}
