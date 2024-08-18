import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:stacked/stacked.dart';

import '../../../services/auth_service.dart';
import '../../shared/dialog_mee.dart';

class ResetPwdViewModel extends FutureViewModel {
  final authService = locator<AuthService>();

  String password = '', passwordConfirm = '';

  int? get otp => authService.otp;

  @override
  Future futureToRun() async {}

  Future resetPwd() async {
    if (isBusy) return;

    int err = 0;
    if (password.isEmpty) err++;
    if (passwordConfirm.isEmpty) err++;
    if (err > 0) return DialogMee.show('Harap semua kolom di isi !');

    if (password.trim() != passwordConfirm.trim()) {
      return DialogMee.show('Konfirmasi Password tidak sama !');
    }

    if (await DialogMee.confirm('Anda yakin ingin me-reset password ?') ==
        true) {
      await resetPassword();
    }
  }

  Future resetPassword() async {
    setBusy(true);
    Result result = await authService.resetPassword(
      otp: otp!,
      password: password.trim(),
    );
    setBusy(false);
    notifyListeners();

    if (result.status) {
      DialogMee.show(result.message!);
      F.back();
    } else {
      DialogMee.show(result.message!);
    }
  }
}
