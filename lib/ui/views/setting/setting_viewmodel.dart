import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/F.dart';
import '../../../services/app_service.dart';

class SettingViewModel extends FutureViewModel {
  final appService = locator<AppService>();

  List<Map<String, dynamic>> get fontSizes => appService.fontSizes;
  int get fontSize => appService.fontSize;
  bool get autoNextQuestion => appService.autoNextQuestion;

  Map<String, dynamic>? get osInfoMap => appService.osInfoMap;
  Map<String, dynamic> get deviceInfoMap => appService.deviceInfoMap;

  String? get ipAddress => appService.ipAddress;

  Map<String, dynamic>? appInfo;
  Map<String, dynamic>? deviceInfo;

  @override
  Future futureToRun() async {
    // F.log.d(deviceInfoMap);
    // F.log.d(osInfoMap);
    appInfo = {
      'App Name': osInfoMap?['appName'],
      'Package Name': osInfoMap?['packageName'],
      'Version / Build':
          "${osInfoMap?['version']} / ${osInfoMap?['buildNumber']}",
    };
    deviceInfo = {
      'Perangkat': appService.getPhoneInfo(),
      'Operating System': appService.getOSInfo(),
      'Screen Resolution (w x h)': osInfoMap?['screenResolution'],
      'IP Address (public)': osInfoMap?['ipAddress'],
    };
  }

  Future fontSizeOnChanged(int newValue) async {
    appService.fontSize = newValue;
    await F.session.fontSize(value: newValue);

    notifyListeners();
  }

  Future autoNextQuestionChanged(bool newValue) async {
    appService.autoNextQuestion = newValue;
    await F.session.autoNextQuestion(value: newValue);

    notifyListeners();
  }
}
