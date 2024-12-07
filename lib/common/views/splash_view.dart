import 'package:app.rynest.aasi/common/controller/initialize_controller.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/circle_button.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/custom_shape.dart';
import 'package:app.rynest.aasi/ui/views/startup/widgets/logo_aasi.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
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
    return MyUI(
      enabledSafeArea: false,
      showConnectivityInfo: false,
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: screenHeight(context) * 0.55,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/im_2.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              const LogoAASI(width: 250),
              vSpaceXSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Online tutoring that trains skill according to '
                  'there talents in a flexible methodologi',
                  textAlign: TextAlign.center,
                  style: bodyStyle(context).copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              vSpaceSmall,
              CircleButton(
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
                onPressed: () async => ref.read(initCtrlProvider).initializeApps(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
