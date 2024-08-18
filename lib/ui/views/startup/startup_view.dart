import 'package:app.rynest.aasi/constants/backend.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/circle_button.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/custom_shape.dart';
import 'package:app.rynest.aasi/ui/views/startup/startup_viewmodel.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/version_info.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'widgets/logo_aasi.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) => Container(
        color: Colors.white,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Body(model: model),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Opacity(
                        opacity: 0.25,
                        child: Text(
                          endPointUrl,
                          style: bodyStyle(context),
                        ),
                      ),
                      vSpace(5),
                      VersionInfo(
                        version: model.appService.appVersion,
                      ),
                      vSpaceSmall,
                    ],
                  ),
                ),
              ],
            ),
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

  final StartUpViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          const LogoAASI(
            width: 250,
          ),
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
          // SizedBox(
          //   width: safeBlockHorizontal(context) * 60,
          //   child: const LinearProgressIndicator(),
          // ),
          CircleButton(
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
            ),
            onPressed: () async => await model.btnNext(),
          ),
          vSpaceXSmall,
        ],
      ),
    );
  }
}
