import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  // FOR MAIN APPS
  @EnviedField(varName: 'ENV_CONFIG', obfuscate: true)
  static String envConfig = _Env.envConfig;

  @EnviedField(varName: 'API_URL', obfuscate: true)
  static String apiUrl = _Env.apiUrl;
  @EnviedField(varName: 'DEV_API_URL', obfuscate: true)
  static String devApiUrl = _Env.devApiUrl;

  // PUSHER SERVER CONFIG
  @EnviedField(varName: 'PUSHER_URL', obfuscate: true)
  static String pusherUrl = _Env.pusherUrl;
  @EnviedField(varName: 'PUSHER_KEY', obfuscate: true)
  static String pusherKey = _Env.pusherKey;
  @EnviedField(varName: 'PUSHER_AUTH_URL', obfuscate: true)
  static String pusherAuthUrl = _Env.pusherAuthUrl;
  @EnviedField(varName: 'DEV_PUSHER_URL', obfuscate: true)
  static String devPusherUrl = _Env.devPusherUrl;
  @EnviedField(varName: 'DEV_PUSHER_KEY', obfuscate: true)
  static String devPusherKey = _Env.devPusherKey;
  @EnviedField(varName: 'DEV_PUSHER_AUTH_URL', obfuscate: true)
  static String devPusherAuthUrl = _Env.devPusherAuthUrl;

  // @EnviedField(varName: 'LIVE_API_URL')
  // static String liveApiUrl = _Env.liveApiUrl;
  // @EnviedField(varName: 'LOCAL_API_URL')
  // static String localApiUrl = _Env.localApiUrl;
  // @EnviedField(varName: 'LIVE_CDN_URL')
  // static String liveCDNUrl = _Env.liveCDNUrl;
  // @EnviedField(varName: 'FCM_API_URL')
  // static String fcmApiUrl = _Env.fcmApiUrl;
  // @EnviedField(varName: 'FCM_ACCESS_TOKEN_URL')
  // static String fcmAccessTokenUrl = _Env.fcmAccessTokenUrl;
}
