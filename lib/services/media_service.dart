import 'dart:developer';
import 'dart:io';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/services/auth_service.dart';
import 'package:app.rynest.aasi/ui/shared/dialog_mee.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/F.dart';

class MediaService {
  final authService = locator<AuthService>();

  final ImagePicker picker = ImagePicker();

  Future<String?> getImageFromDevice() async {
    bool? fromCamera = await DialogMee.confirm(
      'Pilih sumber photo ?',
      yesTitle: 'CAMERA',
      noTitle: 'GALERI',
    );
    if (fromCamera == null) return null;

    var source = fromCamera ? ImageSource.camera : ImageSource.gallery;
    XFile? image = await picker.pickImage(
      maxWidth: 720,
      maxHeight: 960,
      imageQuality: 50,
      source: source,
    );
    if (image == null) return null;

    return image.path;
  }

  Future<String?> getImageFromCamera() async {
    XFile? image = await picker.pickImage(
      maxWidth: 720,
      maxHeight: 960,
      imageQuality: 50,
      source: ImageSource.camera,
    );
    if (image == null) return null;

    return image.path;
  }

  Future<String?> takeSilencePic() async {
    final camera = (await availableCameras())[1];
    final controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    try {
      await controller.initialize();
      await controller.setFlashMode(FlashMode.off);
      final xFile = await controller.takePicture();
      controller.dispose();
      F.log.d(xFile.path);

      /// 720p (1280x720) <= this size is problem on IOS
      // File compressedFile = await FlutterNativeImage.compressImage(
      //   image.path,
      //   // targetWidth: 1280,
      //   // targetHeight: 720,
      //   quality: 50,
      // );
      // F.log.i('size => ${compressedFile.lengthSync()}');

      File file = File(xFile.path);
      file = await compressImage(file);

      return file.path;
    } catch (e) {
      controller.dispose();
      F.log.e(e);
      return null;
    }
  }

  Future<File> compressImage(File file) async {
    final lastIndex = file.absolute.path.lastIndexOf(RegExp(r'.jp'));
    final splitted = file.absolute.path.substring(0, (lastIndex));
    final outPath = "${splitted}_out${file.absolute.path.substring(lastIndex)}";

    var compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 100,
    );
    File fille = File(compressedFile!.path);

    log('original size => ${file.lengthSync()}');
    log('compressed size => ${fille.lengthSync()}');

    return fille;
  }
}
