import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/constants/status_code.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/helpers/api_helper.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:app.rynest.aasi/services/app_service.dart';
import 'package:app.rynest.aasi/services/auth_service.dart';
import 'package:app.rynest.aasi/services/exam_service.dart';
import 'package:app.rynest.aasi/ui/views/auth/login_view.dart';
import 'package:stacked/stacked.dart';

import '../../shared/dialog_mee.dart';
import '../dashboard/dashboard_view.dart';

class StartUpViewModel extends FutureViewModel {
  final appService = locator<AppService>();
  final examService = locator<ExamService>();
  final authService = locator<AuthService>();
  // final fcmService = locator<FcmService>();

  @override
  Future futureToRun() async {
    await appService.getThisVersion();
    notifyListeners();

    await appService.init();
    await authService.init();
    // await fcmService.init();

    await btnNext();
  }

  Future btnNext() async {
    if (await checkToken() == true) {
      await F.replaceWithTransition(DashboardView());
    }
  }

  Future<bool?> checkToken() async {
    await apiHelper.init();

    if (apiHelper.token.isEmpty) {
      await F.navigate(const LoginView());
      return true;
    }

    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.authCheckToken);

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await checkToken();
      }

      if (result.errCode != errNetwork) {
        await DialogMee.show(result.message!);
      }

      return false;
    }
    // String topic = await F.session.topicSignIn();
    // if (topic.isNotEmpty) await fcmService.subscribe(topic: topic);

    return true;
  }
}
