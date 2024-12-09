import 'dart:developer';
import 'dart:io';

import 'package:app.rynest.aasi/common/services/loading_service.dart';
import 'package:app.rynest.aasi/common/views/camera/widgets/camera_button.dart';
import 'package:app.rynest.aasi/utils/download_utils.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    super.key,
    this.customPaint,
    this.customClipperRear,
    this.customClipperFront,
    this.onImage,
    this.onCameraFeedReady,
    this.onDetectorViewModeChanged,
    this.onCameraLensDirectionChanged,
    this.initialCameraLensDirection = CameraLensDirection.back,
    this.onTakeShoot,
    this.enabled = true,
    this.canSwitch = true,
    this.triggerShoot = false,
  });

  final CustomPaint? customPaint;
  final CustomClipper<Path>? customClipperRear;
  final CustomClipper<Path>? customClipperFront;
  final VoidCallback? onCameraFeedReady;
  final VoidCallback? onDetectorViewModeChanged;
  final CameraLensDirection initialCameraLensDirection;
  final bool enabled;
  final bool canSwitch;
  final Function(InputImage inputImage)? onImage;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;
  final Function(File file)? onTakeShoot;
  final bool triggerShoot;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  static List<CameraDescription>? _cameras = [];
  CameraController? _controller;
  int _cameraIndex = -1;
  bool _changingCameraLens = false;

  FlashMode? flashMode;
  IconData? iconFlash;
  bool showFocusCircle = false;
  double? screenWidth;
  double? screenHeight;
  File? _file;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    if (_cameras!.isEmpty) {
      _cameras = await availableCameras();
    }
    for (var i = 0; i < _cameras!.length; i++) {
      if (_cameras![i].lensDirection == widget.initialCameraLensDirection) {
        _cameraIndex = i;
        break;
      }
    }
    if (_cameraIndex != -1) {
      _startLiveFeed();
    }
  }

  @override
  void didUpdateWidget(covariant CameraView oldWidget) {
    // log("widget.triggerShoot => ${widget.triggerShoot}", name: "CAMERA-VIEW");
    if (widget.triggerShoot) {
      _captureImage();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    // if (_file != null) return _preview();

    return MyUI(
      child: Scaffold(
        body: _liveFeedBody(),
      ),
    );
  }

  Widget _liveFeedBody() {
    if (_cameras!.isEmpty) return Container();
    if (_controller == null) return Container();
    if (_controller?.value.isInitialized == false) return Container();
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (_changingCameraLens) ...[
          const Center(
            child: Text('Changing camera lens'),
          ),
        ] else ...[
          if (_cameraIndex == 0 && widget.customClipperRear != null)
            ClipPath(
              clipper: widget.customClipperRear,
              child: CameraPreview(_controller!, child: widget.customPaint),
            )
          else if (_cameraIndex == 1 && widget.customClipperFront != null)
            ClipPath(
              clipper: widget.customClipperFront,
              child: CameraPreview(_controller!, child: widget.customPaint),
            )
          else
            CameraPreview(_controller!, child: widget.customPaint),
        ],
        // _backButton(),
        if (_cameraIndex == 0) _flashButton(),
        if (widget.canSwitch) _switchButton(),
        _captureButton(),
        // _detectionViewModeToggle(),
        // _zoomControl(),
        // _exposureControl(),
      ],
    );
  }

  // Widget _backButton() => Positioned(
  //       top: 20,
  //       left: 20,
  //       child: SizedBox(
  //         height: 50.0,
  //         width: 50.0,
  //         child: FloatingActionButton(
  //           heroTag: Object(),
  //           onPressed: () => Navigator.of(context).pop(),
  //           backgroundColor: Colors.white54,
  //           child: const Icon(
  //             Icons.arrow_back_ios_outlined,
  //             size: 20,
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //     );

  Widget _flashButton() => Positioned(
        right: screenWidth! / 6,
        bottom: 25,
        child: CameraButton(
          size: 45,
          icon: Icon(iconFlash, color: Colors.white),
          color: Colors.black54,
          onPressed: _flashMode,
        ),
      );

  void _flashMode() {
    switch (flashMode!) {
      case FlashMode.off:
        flashMode = FlashMode.always;
        iconFlash = Icons.flash_on;
        break;
      case FlashMode.auto:
        break;
      case FlashMode.always:
        flashMode = FlashMode.torch;
        iconFlash = Icons.flashlight_on;
        break;
      case FlashMode.torch:
        flashMode = FlashMode.off;
        iconFlash = Icons.flash_off;
        break;
    }
    _controller!.setFlashMode(flashMode!);

    log('flashMode => $flashMode', name: 'CAMERA');
    setState(() {});
  }

  Widget _switchButton() => Positioned(
        left: screenWidth! / 6,
        bottom: 25,
        child: CameraButton(
          size: 45,
          icon: const Icon(Icons.cameraswitch, color: Colors.white),
          color: Colors.black54,
          onPressed: _switchCamera,
        ),
      );

  Future _switchCamera() async {
    setState(() => _changingCameraLens = true);
    showFocusCircle = false;

    _cameraIndex = (_cameraIndex + 1) % _cameras!.length;

    await _stopLiveFeed();
    await _startLiveFeed();

    log('switchCamera => ${_cameraIndex == 0 ? 'BACK' : 'FRONT'}', name: 'CAMERA');
    setState(() => _changingCameraLens = false);
  }

  Widget _captureButton() => Positioned(
        left: screenWidth! / 2 - 30,
        bottom: 15,
        child: CameraButton(
          size: 65,
          icon: const Icon(Icons.camera, color: Colors.white),
          color: Colors.black54,
          onPressed: widget.enabled ? _captureImage : null,
        ),
      );

  Future _captureImage() async {
    LoadingService.show();
    setState(() {});

    XFile xFile = await _controller!.takePicture();

    _file = File(xFile.path);
    log('_originalImage => ${fileSize(_file?.lengthSync())}', name: "CAMERA-VIEW");

    _file = await _flipImage(_file!);
    _file = await _compressImage(_file!);
    log('_finalImage => ${fileSize(_file!.lengthSync())}', name: "CAMERA-VIEW");

    LoadingService.dissmiss();
    setState(() {});

    if (widget.onTakeShoot != null) {
      widget.onTakeShoot!(_file!);
    }
    if (mounted) Navigator.of(context).pop();
  }

  Future<File> _flipImage(File file) async {
    // If camera direction front (1), then flip image
    if (_cameraIndex == 1) {
      // FLIP IMAGE TO HORIZONTAL
      Uint8List imageBytes = await file.readAsBytes();
      img.Image? originalImage = img.decodeImage(imageBytes);
      img.Image fixedImage = img.flipHorizontal(originalImage!);
      log('_flipImage => ${fileSize(fixedImage.lengthInBytes)}', name: "CAMERA-VIEW");

      return await file.writeAsBytes(img.encodeJpg(fixedImage), flush: true);
    }
    return file;
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

    log('_compressImage => ${fileSize(fille.lengthSync())}', name: "CAMERA-VIEW");

    return fille;
  }

  Future _startLiveFeed() async {
    flashMode = FlashMode.off;
    iconFlash = Icons.flash_off;
    final camera = _cameras![_cameraIndex];
    _controller = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid ? ImageFormatGroup.nv21 : ImageFormatGroup.bgra8888,
    );
    _controller?.initialize().then((_) {
      _controller!.setFlashMode(flashMode!);

      if (!mounted) {
        return;
      }

      if (widget.onImage != null) {
        // log("_startLiveFeed => with stream", name: "CAMERA-VIEW");
        _controller?.startImageStream(_processCameraImage).then((value) {
          if (widget.onCameraFeedReady != null) {
            widget.onCameraFeedReady!();
          }
          if (widget.onCameraLensDirectionChanged != null) {
            widget.onCameraLensDirectionChanged!(camera.lensDirection);
          }
        });
      }
      setState(() {});
    });
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    // log("_processCameraImage : $inputImage", name: "CAMERA-VIEW");
    if (inputImage == null) return;
    widget.onImage!(inputImage);
  }

  final _orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_controller == null) return null;

    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart
    final camera = _cameras![_cameraIndex];
    final sensorOrientation = camera.sensorOrientation;
    // print(
    //     'lensDirection: ${camera.lensDirection}, sensorOrientation: $sensorOrientation, ${_controller?.value.deviceOrientation} ${_controller?.value.lockedCaptureOrientation} ${_controller?.value.isCaptureOrientationLocked}');
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation = _orientations[_controller!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation = (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotation == null) return null;
    // print('final rotation: $rotation');

    // image.getNv21Uint8List();
    // image = CameraImage.fromPlatformInterface(CameraImageData);

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    // log("image.format: $format", name: "CAMERA-VIEW");
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    // log("image.planes.length: ${image.planes.length}", name: "CAMERA-VIEW");
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }

  Future _stopLiveFeed() async {
    if (widget.onImage != null) {
      await _controller?.stopImageStream();
    }
    await _controller?.dispose();
    _controller = null;
  }

  // Widget _preview() => Stack(children: [
  //       Positioned.fill(
  //         child: Image.file(_file!, fit: BoxFit.fill),
  //       ),
  //       Positioned.fill(
  //         child: Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Padding(
  //             padding: const EdgeInsets.only(bottom: 14),
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 30),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   CameraButton(
  //                     size: 65,
  //                     icon: const Icon(Icons.save, color: Colors.white54),
  //                     color: Colors.black54,
  //                     onPressed: () async {
  //                       log("filepath : ${_file!.path}", name: "CAMERA-VIEW");
  //                       if (widget.onTakeShoot != null) {
  //                         widget.onTakeShoot!(_file!);
  //                       }
  //                       if (mounted) Navigator.of(context).pop();
  //                     },
  //                   ),
  //                   CameraButton(
  //                     size: 65,
  //                     icon: const Icon(Icons.close, color: Colors.white54),
  //                     color: Colors.black54,
  //                     onPressed: () async {
  //                       _file = null;
  //                       setState(() {});
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ]);

  // focusCircle() {
  //   return Positioned(
  //     top: y - 20,
  //     left: x - 20,
  //     child: Container(
  //       width: 40,
  //       height: 40,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         border: Border.all(
  //           color: Colors.white,
  //           width: 1.5,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Future<void> onCameraTap(TapUpDetails details) async {
  //   if (controller!.value.isInitialized != true) return;
  //   if (direction == CameraLensDirection.front) return;

  //   x = details.localPosition.dx;
  //   y = details.localPosition.dy;
  //   double sWidth = screenWidth!;
  //   double sHeight = screenHeight!;

  //   setState(() {
  //     controller!.setFocusPoint(Offset(x / sWidth, y / sHeight));
  //     controller!.setExposurePoint(Offset(x / sWidth, y / sHeight));
  //     showFocusCircle = true;

  //     Future.delayed(const Duration(seconds: 2)).whenComplete(() {
  //       setState(() {
  //         showFocusCircle = false;
  //       });
  //     });
  //   });
  // }
}

// class Paint extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawColor(Colors.grey.withOpacity(0.8), BlendMode.dstOut);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
