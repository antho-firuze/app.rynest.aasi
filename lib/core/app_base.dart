
import 'package:app.rynest.aasi/env/env.dart';

class AppBase {
  static const imagePath = "assets/images";
  static const animationPath = "assets/animations";
  static const iconPath = "assets/icons";
  static const placeholderPath = "assets/placeholders";
  static String apiUrl = Env.envConfig == "DEVELOPMENT" ? Env.devApiUrl : Env.apiUrl;
  static String pusherUrl = Env.envConfig == "DEVELOPMENT" ? Env.devPusherUrl : Env.pusherUrl;
  static String pusherKey = Env.envConfig == "DEVELOPMENT" ? Env.devPusherKey : Env.pusherKey;
  static String pusherAuthUrl = Env.envConfig == "DEVELOPMENT" ? Env.devPusherAuthUrl : Env.pusherAuthUrl;
}
