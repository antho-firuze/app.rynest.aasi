import 'dart:convert';
import 'dart:math';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/constants/picture_type.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/services/app_service.dart';
import 'package:app.rynest.aasi/services/auth_service.dart';
import 'package:app.rynest.aasi/services/media_service.dart';
import 'package:camera/camera.dart';
import 'package:stacked/stacked.dart';

import '../../../models/profile.dart';
import '../../../models/result.dart';
import '../../../services/account_service.dart';
import '../../shared/dialog_mee.dart';
import '../../shared/widgets/camera_page.dart';

class ProfileViewModel extends BaseViewModel {
  final mediaService = locator<MediaService>();
  final accountService = locator<AccountService>();
  final authService = locator<AuthService>();
  final appService = locator<AppService>();

  Profile? get profile => accountService.profile;
  String? photo;

  Future futureToRun() async {
    await loadData();
  }

  Future onRefresh() async {
    await loadData(init: false);
  }

  Future loadData({bool init = true}) async {
    await Future.delayed(Duration.zero);

    if (init == false) {
      await accountService.getProfile(isRefresh: true);
    }

    if (await F.isURLValid(accountService.profile?.photo)) {
      var dummyId = Random().nextInt(99999);
      photo = '${accountService.profile?.photo}?v=$dummyId';
    } else {
      photo = null;
    }

    notifyListeners();
  }

  Future getSelfie() async {
    try {
      var cameras = await availableCameras();
      String? imagePath = await F.navigate(
          CameraPage(
            cameras: cameras,
            cameraType: CameraType.selfie,
          ),
          force: true);
      // String? imagePath = await mediaService.getImageFromDevice();
      if (imagePath == null) {
        return;
      }

      Result result = await accountService.savePicture(
        filePath: imagePath,
        type: PictureType.selfie,
      );

      if (!result.status) {
        return await DialogMee.show(result.message);
      }

      accountService.profile?.photo = result.data;
      await F.session
          .profile(value: jsonEncode(accountService.profile?.toJson()));

      var dummyId = Random().nextInt(99999);
      photo = '${profile?.photo}?v=$dummyId';
      notifyListeners();
    } catch (e) {
      F.log.e(e);
    }
  }

  logout() async => await F.signOutConfirm(message: 'Anda ingin logout ?');

  Future removeAccount() async {
    if (await DialogMee.confirm(
            'Anda yakin ingin menon-aktifkan Akun Anda ?') !=
        true) return;

    Result result = await authService.unRegister();

    if (result.status) {
      await DialogMee.show(
          'Akun Anda telah berhasil di non-aktifkan, silahkan cek email anda untuk informasi lebih lanjut !');

      await F.signOutExitApp();
    }
  }
}
