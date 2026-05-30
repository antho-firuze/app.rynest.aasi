import 'dart:developer';

import 'package:app.rynest.aasi/common/controller/location_ctrl.dart';
import 'package:app.rynest.aasi/common/controller/network_ctrl.dart';
import 'package:app.rynest.aasi/common/controller/notification_ctrl.dart';
import 'package:app.rynest.aasi/common/controller/pusher_ctrl.dart';
import 'package:app.rynest.aasi/utils/check_version.dart';
import 'package:app.rynest.aasi/common/services/device_service.dart';
import 'package:app.rynest.aasi/common/services/talker_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/auth/model/jwt_token.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:app.rynest.aasi/utils/talker_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitCtrl {
  final Ref ref;

  InitCtrl(this.ref);

  final _kLogName = 'INIT-CTRL';

  // InitializeCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;
  // final bool _showWalkThrough;

  Future initializeApps() async {
    try {
      // Only check when connected to the network
      ref.read(isConnectedFutureProvider.future).then((value) async {
        if (value == true) {

          final checkVersion = CheckVersion(showLog: true);
          bool result = await checkVersion.run();

          // When result = true, mean new version available
          // then automatic show the Dialog Update to force User to update the Apps first.
          // The Apps cannot be continue to the next steps.
          if (result) return;
        }
      });

      // Initialize Notification
      ref.read(notificationCtrlProvider).initialize();

      // Initialize Network
      ref.read(networkCtrlProvider).initialize();

      // Initialize Location/GPS
      await ref.read(locationCtrlProvider).initialize();

      // Get Device Info
      ref.read(deviceServiceProvider).getDeviceInfo();

      // Initialize Pusher
      ref.read(pusherCtrlProvider).initialize();

      // Initialize Token First
      ref.read(authCtrlProvider).initialize();

      // Check Token, before init user, profile, etc
      log("Check token ?", name: _kLogName);
      var token = ref.read(authTokenProvider);
      if (token == null) {
        log("Token : null => need sign in", name: _kLogName);
        await ref.read(authCtrlProvider).signOut(silence: true);
      } else {
        if (token.hasExpired()) {
          log("Token : expired => request refresh token if available", name: _kLogName);
          token = await ref.read(authCtrlProvider).refreshToken();
          if (token == null) {
            log("Token Refresh : expired too => need sign in", name: _kLogName);
            await ref.read(authCtrlProvider).signOut(silence: true);
          } else {
            log("New Token : $token", name: _kLogName);
            // Load User
            ref.read(authCtrlProvider).loadUser();
          }
        } else {
          log("Token : valid => \n$token", name: _kLogName);
          // Load User
          ref.read(authCtrlProvider).loadUser();
        }
      }

      // Initialize Profile
      ref.read(profileCtrlProvider).initialize();

      // Initialize Examination
      ref.read(examCtrlProvider).initialize();
      
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error : initializeApps", error: e, stackTrace: s, name: _kLogName);
    } finally {
      // Goto Next Route
      ref.read(goRouterProvider).go('/home');
    }
  }
}

final initCtrlProvider = Provider(InitCtrl.new);
