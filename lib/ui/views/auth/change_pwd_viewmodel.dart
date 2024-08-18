import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:stacked/stacked.dart';

import '../../../services/auth_service.dart';
import '../../shared/dialog_mee.dart';

class ChangePwdViewModel extends FutureViewModel {
  final authService = locator<AuthService>();

  // final passwordOldCtrl = TextEditingController();
  // final passwordNewCtrl = TextEditingController();
  // final passwordNewConfirmCtrl = TextEditingController();
  // final passwordOldFocus = FocusNode();
  // final passwordNewFocus = FocusNode();
  // final passwordNewConfirmFocus = FocusNode();

  String passwordOld = '', passwordNew = '', passwordNewConfirm = '';

  @override
  Future futureToRun() async {}

  Future updatePassword() async {
    if (isBusy) return;

    int err = 0;
    if (passwordOld.isEmpty) err++;
    if (passwordNew.isEmpty) err++;
    if (passwordNewConfirm.isEmpty) err++;
    if (err > 0) return DialogMee.show('Harap semua kolom di isi !');

    if (passwordOld.trim() == passwordNew.trim()) {
      return DialogMee.show(
          'Password baru anda tidak boleh sama dengan password lama !');
    }

    if (passwordNew.trim() != passwordNewConfirm.trim()) {
      return DialogMee.show(
          'Konfirmasi Password harus sama dengan password baru !');
    }

    if (await DialogMee.confirm('Anda yakin ingin merubah data ?') == true) {
      await changePassword();
    }
  }

  Future changePassword() async {
    setBusy(true);
    Result result = await authService.changePassword(
      password: passwordOld.trim(),
      newPassword: passwordNew.trim(),
    );
    setBusy(false);
    notifyListeners();

    if (result.status) {
      DialogMee.show(result.message);
      F.back();
    } else {
      DialogMee.show(result.message!);
    }
  }
}
