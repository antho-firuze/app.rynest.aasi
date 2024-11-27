
import 'package:app.rynest.aasi/core/app_config.dart';
import 'package:app.rynest.aasi/env/env.dart';

class AppBase {
  static const imagePath = "assets/images";
  static const animationPath = "assets/animations";
  static const iconPath = "assets/icons";
  static const placeholderPath = "assets/placeholders";
  static String prodUrl = Env.liveApiUrl;
  static String testUrl = Env.localApiUrl;
  static String url = AppConfig.devMode ? AppBase.testUrl : AppBase.prodUrl;
  static String liveCDNUrl = Env.liveCDNUrl;
  static String fcmApiUrl = Env.fcmApiUrl;
  static String fcmAccessTokenUrl = Env.fcmAccessTokenUrl;
}
