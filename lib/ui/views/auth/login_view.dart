import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/widgets/button_mee.dart';
import '../../shared/widgets/checkbox_mee.dart';
import '../../shared/widgets/input_field.dart';
import '../../shared/widgets/logos.dart';
import 'forgot_pwd_view.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // var screenWidthx = (window.physicalSize.shortestSide);
    // var screenHeightx = (window.physicalSize.longestSide);
    // var devicePixelRatio = (window.devicePixelRatio);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        await F.onWillPop();
      },
      child: ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => Container(
          color: kcPrimaryColor,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenProp(context, s: 20, m: 20, l: 40),
                      ),
                      child: const LogoSignature2(),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: Text(
                            'Sign In ',
                            // '\n${screenWidth(context)} x ${screenHeight(context)} = ${screenWidth(context) * screenHeight(context)}'
                            // '\n$screenWidthx x $screenHeightx = ${screenWidthx * screenHeightx}'
                            // '\n$devicePixelRatio',
                            style: bodyStyle(context).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Body(model: model),
                ],
              ),
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

  final LoginViewModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -14,
                  left: 7,
                  child: SizedBox(
                    width: screenWidth(context) - 14,
                    height: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0x70FFFFFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      vSpaceMedium,
                      Align(
                        child: Column(
                          children: [
                            Text(
                              "Welcome Back !",
                              style: heading4Style(context).copyWith(
                                color: kcPrimaryColor,
                              ),
                            ),
                            vSpaceXSmall,
                            Text(
                              "Please sign to your account",
                              style: bodyStyle(context),
                            ),
                          ],
                        ),
                      ),
                      vSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            InputField(
                              value: model.username,
                              onChanged: (p0) => model.username = p0,
                              hintText: 'Username',
                              iconData: Icons.email,
                            ),
                            vSpaceXSmall,
                            InputField(
                              value: model.password,
                              onChanged: (p0) => model.password = p0,
                              textInputAction: TextInputAction.done,
                              hintText: "Password",
                              iconData: Icons.lock,
                              isPassword: true,
                              enterPressed: () async => await model.signIn(),
                            ),
                          ],
                        ),
                      ),
                      vSpaceXSmall,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CheckboxMee(
                                caption: 'Remember me',
                                value: model.isRemember,
                                onChanged: (bool val) => model.remember(val),
                              ),
                            ),
                            InkWell(
                              onTap: () async => await F.navigate(const ForgotPwdView(), force: true),
                              child: Text(
                                'Forgot Password ?',
                                style: labelStyle(context).clr(kcLinkColor).italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      vSpaceMedium,
                      SizedBox(
                        width: screenProp(context, s: 200, m: 200, l: 300),
                        height: screenProp(context, s: 45, m: 55, l: 65),
                        child: ButtonMee(
                          title: 'Sign In',
                          color: kcPrimaryColor,
                          busy: model.isBusy,
                          onPressed: () async => await model.signIn(),
                        ),
                      ),
                      vSpaceMedium,
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don' 't have an Account? Please ',
                              style: bodyStyle(context).copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            InkWell(
                              onTap: () => model.screenRegister(context),
                              child: Text(
                                'click here',
                                style: bodyStyle(context).copyWith(color: kcPrimaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      vSpaceMedium,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
