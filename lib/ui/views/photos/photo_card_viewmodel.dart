import 'dart:convert';
import 'dart:math';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/models/profile.dart';
import 'package:app.rynest.aasi/services/media_service.dart';
import 'package:camera/camera.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/picture_type.dart';
import '../../../helpers/F.dart';
import '../../../models/result.dart';
import '../../../services/account_service.dart';
import '../../shared/dialog_mee.dart';
import '../../shared/widgets/camera_page.dart';

class PhotoCardViewModel extends FutureViewModel {
  final mediaService = locator<MediaService>();
  final accountService = locator<AccountService>();

  Profile? get profile => accountService.profile;
  String? photo;

  @override
  Future futureToRun() async {
    await loadData();
  }

  Future refresh() async {
    await loadData();
  }

  Future loadData() async {
    if (await F.isURLValid(accountService.profile?.photoIdCard)) {
      var dummyId = Random().nextInt(99999);
      photo = '${accountService.profile?.photoIdCard}?v=$dummyId';
    } else {
      photo = null;
    }

    notifyListeners();
  }

  Future getPicture() async {
    var cameras = await availableCameras();
    String? imagePath = await F.navigate(
        CameraPage(
          cameras: cameras,
          cameraType: CameraType.card,
        ),
        force: true);
    // String? imagePath = await mediaService.getImageFromDevice();
    if (imagePath == null) {
      return;
    }

    Result result = await accountService.savePicture(
      filePath: imagePath,
      type: PictureType.idCard,
    );

    if (!result.status) {
      return await DialogMee.show(result.message);
    }

    accountService.profile?.photoIdCard = result.data;
    await F.session
        .profile(value: jsonEncode(accountService.profile?.toJson()));

    var dummyId = Random().nextInt(99999);
    photo = '${accountService.profile?.photoIdCard}?v=$dummyId';
    notifyListeners();
  }
}
