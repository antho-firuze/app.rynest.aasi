import 'dart:developer';

import 'package:app.rynest.aasi/common/controller/network_ctrl.dart';
import 'package:app.rynest.aasi/common/exceptions/data_exeception_layout.dart';
import 'package:app.rynest.aasi/common/services/version_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitCtrl {
  final Ref ref;

  InitCtrl(this.ref);

  // InitializeCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;
  // final bool _showWalkThrough;

  Future initializeApps() async {
    // Check New Version
    ref.read(isConnectedFutureProvider.future).then((value) async {
      if (value == true) {
        log('Check New Version => Executed !', name: 'INIT-CTRL');
        bool result = await ref.read(versionServiceProvider).newVersionAvailable().onError((error, stackTrace) {
          final errType = ref.read(exceptionProvider(error));
          log('ERROR : ${errType.title}', name: 'INIT-CTRL');
          return false;
        });
        if (result) return;
      } else {
        log('Check New Version => Not Executed !', name: 'INIT-CTRL');
      }
    });

    // Initialize Network
    ref.read(networkCtrlProvider).initialize();

    // Check User & token
    ref.read(authCtrlProvider).initialize();

    // Initialize Profile
    ref.read(profileCtrlProvider).initialize();

    // Initialize Examination
    ref.read(examCtrlProvider).initialize();

    // Check token validity
    if (ref.read(authTokenProvider) != null) {
      await ref.read(authCtrlProvider).checkToken();
    }

    // Goto Next Route
    ref.read(goRouterProvider).go('/home');
  }
}

final initCtrlProvider = Provider(InitCtrl.new);
