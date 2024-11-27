import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  final Ref ref;
  PackageInfoService(this.ref);

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}

final packageInfoServiceProvider = Provider(PackageInfoService.new);
