import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:stacked/stacked.dart';

import '../../../models/profile.dart';
import '../../../services/account_service.dart';

class ProfileEditViewModel extends FutureViewModel {
  final accountService = locator<AccountService>();

  Profile? get profile => accountService.profile;

  @override
  Future futureToRun() async {}

  Future refresh() async {}
}
