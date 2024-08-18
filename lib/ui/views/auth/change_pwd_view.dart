import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/appbar_mee.dart';
import '../../shared/colors.dart';
import '../../shared/widgets/button_mee.dart';
import '../../shared/widgets/input_field.dart';
import '../../shared/widgets/logos.dart';
import 'change_pwd_viewmodel.dart';

class ChangePwdView extends StatelessWidget {
  const ChangePwdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePwdViewModel>.reactive(
      viewModelBuilder: () => ChangePwdViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: Scaffold(
              appBar: const AppBarMee(
                title: 'Ubah Password',
                titleColor: kcPrimaryColor,
                backgroundColor: Colors.transparent,
              ),
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              body: Stack(children: [Body(model: model)])),
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

  final ChangePwdViewModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const LogoSignature(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  vSpaceSmall,
                  InputField(
                    onChanged: (p0) => model.passwordOld = p0,
                    hintText: 'Password Lama',
                    iconData: Icons.lock,
                    isPassword: true,
                  ),
                  vSpaceXSmall,
                  InputField(
                    onChanged: (p0) => model.passwordNew = p0,
                    hintText: 'Password Baru',
                    iconData: Icons.lock,
                    isPassword: true,
                  ),
                  vSpaceXSmall,
                  InputField(
                    onChanged: (p0) => model.passwordNewConfirm = p0,
                    hintText: 'Konfirmasi Password Baru',
                    iconData: Icons.lock,
                    isPassword: true,
                    enterPressed: () async => await model.updatePassword(),
                  ),
                  vSpaceSmall,
                  ButtonMee(
                    title: 'Simpan',
                    busy: model.isBusy,
                    onPressed: () async => await model.updatePassword(),
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
