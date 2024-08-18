import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/button_mee.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/appbar_mee.dart';
import '../../shared/widgets/input_field.dart';
import '../../shared/widgets/logo_lsp.dart';
import 'reset_pwd_viewmodel.dart';

class ResetPwdView extends StatelessWidget {
  const ResetPwdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ResetPwdViewModel>.reactive(
      viewModelBuilder: () => ResetPwdViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            appBar: const AppBarMee(title: 'Reset Password'),
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Body(model: model),
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

  final ResetPwdViewModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (model.isBusy) const LinearProgressIndicator(),
            vSpaceSmall,
            const LogoLSP(),
            vSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  InputField(
                    onChanged: (p0) => model.password = p0,
                    hintText: 'Password',
                    iconData: Icons.lock,
                    isPassword: true,
                  ),
                  vSpaceXSmall,
                  InputField(
                    onChanged: (p0) => model.passwordConfirm = p0,
                    hintText: 'Konfirmasi Password',
                    iconData: Icons.lock,
                    isPassword: true,
                    enterPressed: () async => await model.resetPwd(),
                  ),
                  vSpaceSmall,
                  ButtonMee(
                    title: 'RESET PASSWORD !',
                    busy: model.isBusy,
                    onPressed: () async => await model.resetPwd(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
