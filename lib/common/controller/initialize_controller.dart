import 'package:app.rynest.aasi/common/controller/network_controller.dart';
import 'package:app.rynest.aasi/common/controller/package_info_controller.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitializeCtrl {
  final Ref ref;

  InitializeCtrl(this.ref);

  // InitializeCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;
  // final bool _showWalkThrough;

  Future initializeApps() async {
    // Get Device Info
    // await ref.read(deviceServiceProvider).getDeviceInfo();

    // Initialize Package Info
    ref.read(packageInfoCtrlProvider).initialize();

    // Initialize Network
    ref.read(networkCtrlProvider).initialize();

    // Initialize Location/GPS
    // await ref.read(locationCtrlProvider).initialize();

    // Check User & token
    ref.read(authCtrlProvider).initialize();

    // Initialize User Settings
    // ref.read(userSettingCtrlProvider).initialize();

    // Initialize Profile
    ref.read(profileCtrlProvider).initialize();

    // Initialize Examination
    ref.read(examCtrlProvider).initialize();

    // // Initialize Prayer Times
    // ref.read(prayerTimesCtrlProvider).initialize();

    // // Initialize Prayers Time Alert
    // ref.read(prayerTimesAlertProvider).initialize();

    // // Initialize Notifications
    // ref.read(notificationCtrlProvider).initialize();

    // // Initialized Quran
    // ref.read(quranCtrlProvider).initialize();

    // // Initialize Broadcast
    // ref.read(broadcastCtrlProvider).initialize();

    // // Initialize Online Host Stream
    // // ref.read(onlineHostStreamProvider).initialize();

    // // Signaling WEBRTC
    // ref.read(signalingCtrlProvider).initialize();

    // // Initialize Live Location
    // ref.read(liveLocationCtrlProvider).initialize();

    // // Initialize Live Location
    // ref.read(onlineMemberStreamProvider).initialize();

    // Check token validity
    if (ref.read(authTokenProvider) != null) {
      await ref.read(authCtrlProvider).checkToken();
      // if (await ref.read(authCtrlProvider).checkToken()) {
      //   if (ref.read(profileProvider) == null) {
      //     await ref.read(profileCtrlProvider).fetchProfile();
      //   }
      // }
    }
    // Goto Next Route
    ref.read(goRouterProvider).go('/home');
    // if (_showWalkThrough) {
    //   ref.read(goRouterProvider).go('/walkthrough');
    // } else {
    //   ref.read(goRouterProvider).go('/home');
    // }
  }
}

final initCtrlProvider = Provider(InitializeCtrl.new);
