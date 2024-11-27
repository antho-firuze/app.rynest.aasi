import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/button_mee.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/appbar_mee.dart';
import 'forgot_pwd_viewmodel.dart';

class ForgotPwdView extends StatelessWidget {
  const ForgotPwdView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPwdViewModel>.reactive(
      viewModelBuilder: () => ForgotPwdViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: Scaffold(
            appBar: const AppBarMee(title: 'Lupa Password'),
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

  final ForgotPwdViewModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // const LogoSignature(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'Anda akan menerima 4 digit kode melalui email, untuk selanjutnya akan di verifikasi.',
                    textAlign: TextAlign.center,
                    style: bodyStyle(context),
                  ),
                  vSpaceSmall,
                  Text(
                    'Silahkan masukkan Email anda.',
                    textAlign: TextAlign.center,
                    style: bodyStyle(context),
                  ),
                ],
              ),
            ),
            vSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  InputField(
                    hintText: 'Alamat Email',
                    iconData: Icons.email,
                    textInputAction: TextInputAction.done,
                    onChanged: (p0) => model.email = p0,
                    validator: (val) => val!.isEmpty ? 'Harap di isi !' : null,
                    enterPressed: () async => await model.sendOTP(),
                  ),
                  vSpaceSmall,
                  ButtonMee(
                    title: 'KIRIM OTP !',
                    busy: model.isBusy,
                    onPressed: () async => await model.sendOTP(),
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
