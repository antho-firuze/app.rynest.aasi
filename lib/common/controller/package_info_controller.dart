import 'dart:developer';

import 'package:app.rynest.aasi/common/services/package_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final versionInfoProvider = StateProvider<String>((ref) => '');

class PackageInfoCtrl {
  Ref ref;
  PackageInfoCtrl(this.ref);

  void initialize() async {
    log('Initialize Package Info !');

    ref.read(versionInfoProvider.notifier).state = await ref.read(packageInfoServiceProvider).getVersion();
  }
}

final packageInfoCtrlProvider = Provider(PackageInfoCtrl.new);
