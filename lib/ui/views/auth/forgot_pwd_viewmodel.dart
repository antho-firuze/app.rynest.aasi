import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:app.rynest.aasi/ui/views/auth/otp_view.dart';
import 'package:app.rynest.aasi/ui/views/auth/reset_pwd_view.dart';
import 'package:stacked/stacked.dart';

import '../../../services/auth_service.dart';
import '../../shared/dialog_mee.dart';

class ForgotPwdViewModel extends FutureViewModel {
  final authService = locator<AuthService>();

  String email = '';

  @override
  Future futureToRun() async {}

  Future sendOTP() async {
    if (isBusy) return;

    if (email.isEmpty) return DialogMee.show('Harap kolom email di isi !');

    await forgotPassword();
  }

  Future forgotPassword() async {
    setBusy(true);
    // progressDialog.show();
    Result result = await authService.forgotPassword(email: email.trim());
    // progressDialog.hide();
    setBusy(false);
    notifyListeners();

    if (result.status) {
      bool resultOTP = await F.navigate(const OtpView());

      if (resultOTP) {
        F.back();
        await F.navigate(const ResetPwdView());
      }
    } else {
      DialogMee.show(result.message!);
    }
  }
}
