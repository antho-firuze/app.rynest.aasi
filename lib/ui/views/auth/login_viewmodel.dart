import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

import '../../../services/auth_service.dart';
import '../../shared/dialog_mee.dart';

class LoginViewModel extends FutureViewModel {
  final authService = locator<AuthService>();

  bool get isRemember => authService.isRemember;
  String username = '', password = '';

  @override
  Future futureToRun() async {
    await loadData();
    await F.session.token(clear: true);
  }

  Future loadData() async {
    if (isRemember) {
      username = authService.remember!['username'];
      password = authService.remember!['password'];
      notifyListeners();
    }
  }

  remember(bool val) {
    authService.isRemember = val;
    notifyListeners();
  }

  Future signIn() async {
    if (isBusy) return;

    if (username.isEmpty && password.isEmpty) {
      return DialogMee.show('check_username_password'.tr);
    } else if (username.isEmpty) {
      return DialogMee.show('check_username'.tr);
    } else if (password.isEmpty) {
      return DialogMee.show('check_password'.tr);
    }

    setBusy(true);
    Result result = await authService.signIn(
      username: username.trim(),
      password: password,
    );
    setBusy(false);

    if (!result.status) {
      return await DialogMee.show(result.message!);
    } 
    
    F.back(result: true);
  }

  Future screenRegister(BuildContext context) async {
    String text =
        "• Anda harus terdaftar sebagai Agen pada Perusahaan Asuransi Syariah.\n\n"
        "• Melakukan pendaftaran sebagai Agen Asuransi Syariah pada Perusahaan Asuransi Syariah.\n\n"
        "• Username dan Password akan dikirimkan kepada masing-masing user.\n\n"
        "";
    Widget messageW = Column(
      children: [
        Text(
          text,
          style: bodyStyle(context),
        ),
        Text(
          "Untuk informasi lebih lanjut anda bisa hubungi CS kami.",
          textAlign: TextAlign.center,
          style: bodyStyle(context),
        ),
        vSpaceSmall,
      ],
    );
    await DialogMee.show(
      '',
      title: 'Cara & Syarat Registrasi',
      messageW: messageW,
    );
  }
}
