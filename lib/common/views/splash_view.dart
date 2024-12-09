import 'dart:developer';

import 'package:app.rynest.aasi/common/controller/initialize_controller.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/features/user/views/widgets/custom_shape.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  static const routeName = '/splash';

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() async {
    // Note:
    // Gunakan method di bawah ini sesuai kebutuhan,
    // running action after widget building is complete.
    // - WidgetsBinding.instance.addPostFrameCallback((_) {});
    // - await Future.delayed(Duration.zero);
    // - await Future.delayed(const Duration(seconds: 3));
    await Future.delayed(const Duration(seconds: 3));
    await ref.read(initCtrlProvider).initializeApps();
  }

  @override
  Widget build(BuildContext context) {
    log("SplashView => Build");

    return MyUI(
      enabledSafeArea: false,
      showConnectivityInfo: false,
      child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: context.screenHeight * 0.55,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/im_2.png'),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  45.whenLandscape(0)!.height,
                  const LogoApp(width: 250),
                  20.height,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text('Online tutoring that trains skill according to '
                            'there talents in a flexible methodologi')
                        .tsTitleL()
                        .center(),
                  ),
                  20.height,
                  // CircleButton(
                  //   child: const Icon(
                  //     Icons.arrow_forward_rounded,
                  //     color: Colors.white,
                  //   ),
                  //   onPressed: () async => ref.read(initCtrlProvider).initializeApps(),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
