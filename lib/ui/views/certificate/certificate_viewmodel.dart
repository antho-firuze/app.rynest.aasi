import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/models/certificate.dart';
import 'package:app.rynest.aasi/models/profile.dart';
import 'package:app.rynest.aasi/services/account_service.dart';
import 'package:stacked/stacked.dart';

class CertificateViewModel extends FutureViewModel {
  final accountService = locator<AccountService>();

  Profile? get profile => accountService.profile;
  Certificate? get certificate => accountService.certificate;
  String? get certType => accountService.certificate?.certNo?.substring(6, 8);

  @override
  Future futureToRun() async {
    await loadData();
  }

  Future refresh() async {
    await loadData(init: false);
  }

  Future loadData({bool init = true}) async {
    await Future.delayed(Duration.zero);

    await accountService.getCertificate(showLoading: true, isRefresh: true);

    notifyListeners();
  }
}
