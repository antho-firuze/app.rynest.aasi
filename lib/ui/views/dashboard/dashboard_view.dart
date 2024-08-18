import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import 'widgets/bottom_nav_bar.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  final _model = DashboardViewModel();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        log("PopScope | index | ${_model.currentIndex}", name: "DashboardView");

        if (_model.currentIndex > 0) {
          _model.onTap(0);
          return;
        }

        await F.onWillPop();
      },
      // onWillPop: () async {
      //   if (_model.currentIndex > 0) {
      //     _model.onTap(0);
      //     return false;
      //   }

      //   return await F.onWillPop();
      // },
      child: ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => locator<DashboardViewModel>(),
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        onViewModelReady: (model) async {
          await Future.delayed(Duration.zero);
          model.onTap(0);
        },
        builder: (context, model, child) => Scaffold(
          body: Stack(
            children: [
              Body(
                model: model,
              ),
              BottomNavBar(
                currentIndex: model.currentIndex,
                onTap: model.onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.model,
  });

  final DashboardViewModel model;

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 300),
      reverse: model.reverse,
      transitionBuilder: (Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
        return SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      },
      child: PageView(
        controller: model.pageController,
        onPageChanged: model.setIndex,
        children: model.pages,
      ),
    );
  }
}
