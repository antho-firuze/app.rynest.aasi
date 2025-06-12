import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  // FOR MAIN APPS
  @EnviedField(varName: 'ENV_CONFIG')
  static String envConfig = _Env.envConfig;
  @EnviedField(varName: 'LIVE_API_URL')
  static String liveApiUrl = _Env.liveApiUrl;
  @EnviedField(varName: 'LOCAL_API_URL')
  static String localApiUrl = _Env.localApiUrl;
  @EnviedField(varName: 'LIVE_CDN_URL')
  static String liveCDNUrl = _Env.liveCDNUrl;
  @EnviedField(varName: 'FCM_API_URL')
  static String fcmApiUrl = _Env.fcmApiUrl;
  @EnviedField(varName: 'FCM_ACCESS_TOKEN_URL')
  static String fcmAccessTokenUrl = _Env.fcmAccessTokenUrl;
  // PUSHER SERVER CONFIG
  @EnviedField(varName: 'PUSHER_URL')
  static String pusherUrl = _Env.pusherUrl;
  @EnviedField(varName: 'PUSHER_KEY')
  static String pusherKey = _Env.pusherKey;
  @EnviedField(varName: 'PUSHER_AUTH_URL')
  static String pusherAuthUrl = _Env.pusherAuthUrl;
}
