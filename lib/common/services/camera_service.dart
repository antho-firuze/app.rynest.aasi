import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:app.rynest.aasi/utils/download_utils.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;

class CameraService {
  static List<CameraDescription>? _cameras = [];
  CameraController? _controller;
  File? _file;

  Future takeSilencePic({required Function(File file)? callback}) async {
    _cameras = await availableCameras();
    // Camera Front
    final camera = _cameras![1];

    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    _controller?.initialize().then((_) async {
      _controller?.setFlashMode(FlashMode.off);

      XFile xfile = await _controller!.takePicture();

      // convert xfile => file
      _file = File(xfile.path);
      log('_originalImage => ${fileSize(_file?.lengthSync())}', name: "CAMERA-SERVICE");
      
      // If camera direction front (1), then flip image
      _file = await _flipImage(_file!);
      _file = await _compressImage(_file!);
      log('_finalImage => ${fileSize(_file!.lengthSync())}', name: "CAMERA-SERVICE");

      if (callback == null) return;

      callback(_file!);

    }).whenComplete(() {
      _controller?.dispose();
      _controller = null;
    });
  }

  Future<File> _flipImage(File file) async {
    // FLIP IMAGE HORIZONTAL
    Uint8List imageBytes = await file.readAsBytes();
    img.Image? originalImage = img.decodeImage(imageBytes);
    img.Image fixedImage = img.flipHorizontal(originalImage!);
    log('_flipImage => ${fileSize(fixedImage.lengthInBytes)}', name: "CAMERA-SERVICE");

    return await file.writeAsBytes(img.encodeJpg(fixedImage), flush: true);
  }

  Future<File> _compressImage(File file) async {
    final lastIndex = file.absolute.path.lastIndexOf(RegExp(r'.jp'));
    final splitted = file.absolute.path.substring(0, (lastIndex));
    final outPath = "${splitted}_out${file.absolute.path.substring(lastIndex)}";

    var compressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 100,
    );
    File fille = File(compressedFile!.path);

    log('_compressImage => ${fileSize(fille.lengthSync())}', name: "CAMERA-SERVICE");

    return fille;
  }
}
