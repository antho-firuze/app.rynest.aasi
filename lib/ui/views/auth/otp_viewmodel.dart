import 'dart:async';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:stacked/stacked.dart';

import '../../../services/auth_service.dart';
import '../../shared/dialog_mee.dart';

class OtpViewModel extends FutureViewModel {
  final authService = locator<AuthService>();

  int? get otp => authService.otp;
  String? get otpEmail => authService.otpEmail;
  String code = '';

  bool hasTimerStopped = false;

  @override
  Future futureToRun() async {}

  numberPress(int value) {
    if (value != -1) {
      if (code.length < 4) {
        code = code + value.toString();
      }
    } else {
      // ignore: prefer_is_empty
      if (code.length > 0) code = code.substring(0, code.length - 1);
    }
    // print(code);
    if (code.length > 3) {
      if (int.parse(code) == otp) {
        confirmOTP();
      } else {
        DialogMee.show('OTP anda salah !');
      }
    }
    notifyListeners();
  }

  Future confirmOTP() async {
    if (isBusy) return;

    F.back(result: true);
  }

  Future resendOTP() async {
    if (isBusy) return;

    await forgotPassword();
  }

  Future forgotPassword() async {
    setBusy(true);
    // progressDialog.show();
    Result result = await authService.forgotPassword(email: otpEmail!);
    // progressDialog.hide();
    setBusy(false);
    notifyListeners();

    if (result.status) {
      hasTimerStopped = false;
      notifyListeners();
    } else {
      DialogMee.show(result.message!);
    }

    // switch (result.type) {
    //   case ResultType.Success:
    //     hasTimerStopped = false;
    //     otp = result.data;
    //     notifyListeners();
    //     break;
    //   case ResultType.Error:
    //     await DialogMee.showRetry(result.message);
    //     await forgotPassword();
    //     break;
    //   case ResultType.Warning:
    //     if (mustLogin.contains(result.statusCode)) {
    //       if (await F.navigateWithTransition(LoginView()))
    //         await forgotPassword();
    //     } else {
    //       DialogMee.show(result.message);
    //     }
    // }
  }
}
