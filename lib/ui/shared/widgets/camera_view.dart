import 'dart:developer';
import 'dart:io';

import 'package:app.rynest.aasi/ui/shared/loading_mee.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';

import 'icon_button_mee.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    super.key,
    this.customPaint,
    required this.onImage,
    this.onCameraFeedReady,
    this.onDetectorViewModeChanged,
    this.onCameraLensDirectionChanged,
    required this.initialCameraLensDirection,
    this.onTakeShoot,
  });

  final CustomPaint? customPaint;
  final Function(InputImage inputImage) onImage;
  final VoidCallback? onCameraFeedReady;
  final VoidCallback? onDetectorViewModeChanged;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;
  final CameraLensDirection initialCameraLensDirection;
  final Function(File file)? onTakeShoot;

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
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );

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
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );

    _stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    if (_file != null) return _preview();

    return Scaffold(body: _liveFeedBody());
  }

  Widget _liveFeedBody() {
    if (_cameras!.isEmpty) return Container();
    if (_controller == null) return Container();
    if (_controller?.value.isInitialized == false) return Container();
    return ColoredBox(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: _changingCameraLens
                ? const Center(
                    child: Text('Changing camera lens'),
                  )
                : ClipPath(
                    clipper: _cameraIndex == 0 ? CardClip() : SelfieClip(),
                    child: CameraPreview(
                      _controller!,
                      child: widget.customPaint,
                    ),
                  ),
          ),
          _backButton(),
          if (_cameraIndex == 0) _flashButton(),
          _switchButton(),
          _captureButton(),
          // _detectionViewModeToggle(),
          // _zoomControl(),
          // _exposureControl(),
        ],
      ),
    );
  }

  Widget _backButton() => Positioned(
        top: 20,
        left: 20,
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            heroTag: Object(),
            onPressed: () => Navigator.of(context).pop(),
            backgroundColor: Colors.black54,
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
              color: Colors.white54,
            ),
          ),
        ),
      );

  Widget _flashButton() => Positioned(
        right: screenWidth! / 6,
        bottom: 25,
        child: IconButtonMee(
          size: 45,
          icon: Icon(
            iconFlash,
            color: Colors.white54,
          ),
          color: Colors.black54,
          onPressed: _flashMode,
        ),
      );

  Future _flashMode() async {
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
        child: IconButtonMee(
          size: 45,
          icon: const Icon(
            Icons.cameraswitch,
            color: Colors.white54,
          ),
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
        child: IconButtonMee(
          size: 65,
          icon: const Icon(
            Icons.camera,
            color: Colors.white54,
          ),
          color: Colors.black54,
          onPressed: _captureImage,
        ),
      );

  Future _captureImage() async {
    LoadingMee.show();

    XFile xFile = await _controller!.takePicture();
    _file = File(xFile.path);
    _file = await _flipImage(_file!);
    _file = await _compressImage(_file!);

    log("filepath : ${_file!.path}", name: "CAMERA");

    LoadingMee.dismiss();
    setState(() {});
  }

  Future<File> _flipImage(File file) async {
    // If camera direction front (1), then flip image
    if (_cameraIndex == 1) {
      // FLIP IMAGE TO HORIZONTAL
      Uint8List imageBytes = await file.readAsBytes();
      img.Image? originalImage = img.decodeImage(imageBytes);
      img.Image fixedImage = img.flipHorizontal(originalImage!);
      log('size => ${fixedImage.lengthInBytes}');

      return await file.writeAsBytes(img.encodeJpg(fixedImage), flush: true);
    }

    log('original size => ${file.lengthSync()}');
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

    log('original size => ${file.lengthSync()}');
    log('compressed size => ${fille.lengthSync()}');

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
      _controller?.startImageStream(_processCameraImage).then((value) {
        if (widget.onCameraFeedReady != null) {
          widget.onCameraFeedReady!();
        }
        if (widget.onCameraLensDirectionChanged != null) {
          widget.onCameraLensDirectionChanged!(camera.lensDirection);
        }
      });
      setState(() {});
    });
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    // log("_processCameraImage : $inputImage", name: "CAMERA");
    if (inputImage == null) return;
    widget.onImage(inputImage);
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
    // log("image.format: $format", name: "CAMERA");
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    // log("image.planes.length: ${image.planes.length}", name: "CAMERA");
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
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Widget _preview() => Stack(children: [
        Positioned.fill(
          child: Image.file(_file!, fit: BoxFit.fill),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtonMee(
                      size: 65,
                      icon: const Icon(Icons.save, color: Colors.white54),
                      color: Colors.black54,
                      onPressed: () async {
                        // return F.back(result: _file!.path);
                        widget.onTakeShoot!(_file!);
                      },
                    ),
                    IconButtonMee(
                      size: 65,
                      icon: const Icon(Icons.close, color: Colors.white54),
                      color: Colors.black54,
                      onPressed: () async {
                        _file = null;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]);

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

class Paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.grey.withOpacity(0.8), BlendMode.dstOut);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CardClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // print(size);
    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(10, size.height / 2 - 120, size.width - 20, 260), const Radius.circular(26)));
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}

class SelfieClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // print(size);
    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));
    return path;
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}