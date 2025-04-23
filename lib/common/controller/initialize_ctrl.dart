import 'dart:developer';

import 'package:app.rynest.aasi/common/controller/network_ctrl.dart';
import 'package:app.rynest.aasi/common/services/version_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/auth/model/jwt_token.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitCtrl {
  final Ref ref;

  InitCtrl(this.ref);

  final _kLogName = 'INIT-CTRL';

  // InitializeCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;
  // final bool _showWalkThrough;

  Future initializeApps() async {
    // Check New Version
    ref.read(isConnectedFutureProvider.future).then((value) async {
      if (value == true) {
        bool result = await ref.read(versionServiceProvider).newVersionAvailable().onError((error, stackTrace) {
          // final errType = ref.read(exceptionProvider(error));
          // log('ERROR : ${errType.title}', name: _kLogName);
          return false;
        });
        if (result) return;
      } else {
        log('Check new version not executed !', name: _kLogName);
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

    // Check Is Token Expired
    log("Check token ?", name: _kLogName);
    var token = ref.read(authTokenProvider);
    if (token != null) {
      if (token.hasExpired()) {
        log("Token has expired", name: _kLogName);
        log("Request refresh token", name: _kLogName);
        token = await ref.read(authCtrlProvider).refreshToken();
        if (token == null) {
          log("Refresh token has expired too, need re-sign in again", name: _kLogName);
          await ref.read(authCtrlProvider).signOut(silence: true);
        } else {
          log("New token : $token", name: _kLogName);
        }
      } else {
        log("Token still valid", name: _kLogName);
      }
    } else {
      log("Token is null, need sign in", name: _kLogName);
      await ref.read(authCtrlProvider).signOut(silence: true);
    }

    // Goto Next Route
    ref.read(goRouterProvider).go('/home');
  }
}

final initCtrlProvider = Provider(InitCtrl.new);
