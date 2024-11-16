import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/models/profile.dart';
import 'package:app.rynest.aasi/services/media_service.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/camera_view.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/text_detector_view.dart';
// import 'package:app.rynest.aasi/ui/shared/widgets/text_detector_painter.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import '../../../constants/picture_type.dart';
import '../../../helpers/F.dart';
import '../../../models/result.dart';
import '../../../services/account_service.dart';
import '../../shared/dialog_mee.dart';
// import '../../shared/widgets/camera_page.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class PhotoCardViewModel extends FutureViewModel {
  final mediaService = locator<MediaService>();
  final accountService = locator<AccountService>();

  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final bool _canProcess = true;
  final bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  final _cameraLensDirection = CameraLensDirection.back;

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
    // var cameras = await availableCameras();
    // String? imagePath = await F.navigate(
    //     CameraPage(
    //       cameras: cameras,
    //       cameraType: CameraType.card,
    //     ),
    //     force: true);
    // // String? imagePath = await mediaService.getImageFromDevice();
    // if (imagePath == null) {
    //   return;
    // }

    await F.navigate(TextDetectorView(
      onTakeShoot: (file) {
        log("file path: ${file.path}", name: "CAMERA");
      },
    ), force: true);

    // String? imagePath = await F.navigate(
    //     CameraView(
    //       customPaint: _customPaint,
    //       onImage: _processImage,
    //       initialCameraLensDirection: _cameraLensDirection,
    //     ),
    //     force: true);
    // String? imagePath = await mediaService.getImageFromDevice();
    // if (imagePath == null) {
    //   return;
    // }

    // Result result = await accountService.savePicture(
    //   filePath: imagePath,
    //   type: PictureType.idCard,
    // );

    // if (!result.status) {
    //   return await DialogMee.show(result.message);
    // }

    // accountService.profile?.photoIdCard = result.data;
    // await F.session.profile(value: jsonEncode(accountService.profile?.toJson()));

    // var dummyId = Random().nextInt(99999);
    // photo = '${accountService.profile?.photoIdCard}?v=$dummyId';
    // notifyListeners();
  }

  // Future<void> _processImage(InputImage inputImage) async {
  //   // if (!_canProcess) return;
  //   // if (_isBusy) return;
  //   // _isBusy = true;
  //   // setState(() {
  //   //   _text = '';
  //   // });
  //   log("_processImage: $inputImage", name: "CAMERA");
  //   final recognizedText = await _textRecognizer.processImage(inputImage);
  //   // log("texts : $recognizedText", name: "CAMERA");
  //   // if (inputImage.metadata?.size != null && inputImage.metadata?.rotation != null) {
  //   //   final painter = TextRecognizerPainter(
  //   //     recognizedText,
  //   //     inputImage.metadata!.size,
  //   //     inputImage.metadata!.rotation,
  //   //     _cameraLensDirection,
  //   //   );
  //   //   _customPaint = CustomPaint(painter: painter);
  //   // } else {
  //   //   _text = 'Recognized text:\n\n${recognizedText.text}';
  //   //   // TODO: set _customPaint to draw boundingRect on top of image
  //   //   _customPaint = null;
  //   // }
  //   // _isBusy = false;
  //   // if (mounted) {
  //   //   setState(() {});
  //   // }
  // }
}
