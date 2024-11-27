import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  // FOR MAIN APPS
  @EnviedField(varName: 'LIVE_API_URL', obfuscate: true)
  static String liveApiUrl = _Env.liveApiUrl;
  @EnviedField(varName: 'LOCAL_API_URL', obfuscate: true)
  static String localApiUrl = _Env.localApiUrl;
  @EnviedField(varName: 'LIVE_CDN_URL', obfuscate: true)
  static String liveCDNUrl = _Env.liveCDNUrl;
  @EnviedField(varName: 'FCM_API_URL', obfuscate: true)
  static String fcmApiUrl = _Env.fcmApiUrl;
  @EnviedField(varName: 'FCM_ACCESS_TOKEN_URL', obfuscate: true)
  static String fcmAccessTokenUrl = _Env.fcmAccessTokenUrl;

}
