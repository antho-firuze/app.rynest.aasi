import 'dart:developer';
import 'dart:io';

import 'package:app.rynest.aasi/ui/shared/loading_mee.dart';
import 'package:camera/camera.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../helpers/F.dart';
import '../ui_helper.dart';
import 'icon_button_mee.dart';

enum CameraType { card, selfie }

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, this.cameras, this.cameraType = CameraType.selfie});

  final List<CameraDescription>? cameras;
  final CameraType cameraType;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? controller;
  XFile? xFile;
  CameraLensDirection? direction;
  FlashMode? flashMode;
  IconData? iconFlash;
  CameraDescription? description;

  bool showFocusCircle = false;
  double x = 0;
  double y = 0;
  double? screenWidth;
  double? screenHeight;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    try {
      flashMode = FlashMode.off;
      iconFlash = Icons.flash_off;
      if (widget.cameras != null && widget.cameras!.isNotEmpty) {
        if (widget.cameraType == CameraType.selfie) {
          direction = CameraLensDirection.front;
        } else {
          direction = CameraLensDirection.back;
        }
        description = widget.cameras!.firstWhere((element) => element.lensDirection == direction);
        controller = CameraController(
          description!,
          ResolutionPreset.high,
          enableAudio: false,
        );
        controller!.initialize().then((_) {
          if (!mounted) {
            return F.back();
          }
          controller!.setFlashMode(flashMode!);
          controller!.setZoomLevel(1.5);
          setState(() {});
        });
      }
    } catch (e) {
      F.log.e(e);
    } finally {
      // F.log.i(controller?.cameraId);
      // F.log.i(controller?.value.isInitialized);
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: controller == null
            ? Center(
                child: Text(
                'No Camera Available !',
                style: subheadingStyle(context),
              ))
            : (controller?.value.isInitialized == false && controller!.cameraId >= 0)
                ? const Center(child: CircularProgressIndicator())
                : controller!.cameraId < 0
                    ? Center(
                        child: Text(
                        'Permission Failed !',
                        style: subheadingStyle(context),
                      ))
                    : Stack(
                        children: [
                          // GestureDetector(
                          //   onTapUp: onCameraTap,
                          //   child: AspectRatio(
                          //     aspectRatio: 1 / controller!.value.aspectRatio,
                          //     child: CustomPaint(
                          //       foregroundPainter: Paint(),
                          //       child: CameraPreview(controller!),
                          //     ),
                          //   ),
                          // ),
                          CustomPaint(
                            foregroundPainter: Paint(),
                            child: CameraPreview(controller!),
                          ),
                          ClipPath(
                            clipper: widget.cameraType == CameraType.card ? CardClip() : SelfieClip(),
                            child: CameraPreview(controller!),
                          ),
                          flashButton(),
                          captureButton(),
                          switchButton(),
                          if (showFocusCircle) focusCircle(),
                          if (xFile != null) preview(),
                        ],
                      ),
        // child: Column(
        //   children: [
        //     Container(
        //       width: double.infinity,
        //       height: 55,
        //       color: kcPrimaryColor,
        //       child: Center(
        //         child: Text(
        //           'Kamera',
        //           style: heading2Style(context).copyWith(color: Colors.white),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: controller == null
        //           ? Center(
        //               child: Text(
        //               'No Camera Available !',
        //               style: subheadingStyle(context),
        //             ))
        //           : Stack(
        //               children: [
        //                 CameraPreview(controller!),
        //               ],
        //             ),
        //     ),
        //     Container(
        //       width: double.infinity,
        //       height: 75,
        //       color: kcPrimaryColor,
        //       child: Center(
        //         child: Text(
        //           'Kamera',
        //           style: heading2Style(context).copyWith(color: Colors.white),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  flashButton() {
    return direction == CameraLensDirection.front
        ? Container()
        : Positioned(
            left: screenWidth! / 4 - 10,
            top: 20,
            child: IconButtonMee(
              size: 45,
              icon: Icon(iconFlash),
              color: Colors.white12,
              onPressed: () async {
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
                controller!.setFlashMode(flashMode!);
                setState(() {});
              },
            ),
          );
  }

  preview() {
    return Stack(children: [
      Positioned.fill(
        child: Image.file(
          File(xFile!.path),
          fit: BoxFit.fill,
        ),
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
                    icon: const Icon(Icons.save),
                    color: Colors.white12,
                    onPressed: () async {
                      return F.back(result: xFile!.path);
                    },
                  ),
                  IconButtonMee(
                    size: 65,
                    icon: const Icon(Icons.close),
                    color: Colors.white12,
                    onPressed: () async {
                      xFile = null;
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
  }

  focusCircle() {
    return Positioned(
      top: y - 20,
      left: x - 20,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  captureButton() {
    return Positioned(
      left: screenWidth! / 2 - 30,
      bottom: 15,
      child: IconButtonMee(
        size: 65,
        icon: const Icon(Icons.camera),
        color: Colors.white12,
        onPressed: () async {
          LoadingMee.show();

          xFile = await controller!.takePicture();
          File file = File(xFile!.path);
          file = await flipImage(file);
          file = await compressImage(file);

          xFile = XFile(file.path);
          
          // final lastIndex = file.absolute.path.lastIndexOf(RegExp(r'.jp'));
          // final splitted = file.absolute.path.substring(0, (lastIndex));
          // final outPath = "${splitted}_out${file.absolute.path.substring(lastIndex)}";

          // XFile? compressedFile = await FlutterImageCompress.compressAndGetFile(
          //   file.absolute.path,
          //   outPath,
          //   quality: 100,
          // );
          // File fille = File(compressedFile!.path);

          // if (direction == CameraLensDirection.front) {
          //   // FLIP IMAGE TO HORIZONTAL
          //   Uint8List imageBytes = await compressedFile.readAsBytes();
          //   img.Image? originalImage = img.decodeImage(imageBytes);
          //   img.Image fixedImage = img.flipHorizontal(originalImage!);
          //   File fixedFile = await compressedFile.writeAsBytes(
          //     img.encodeJpg(fixedImage),
          //     flush: true,
          //   );
          //   xFile = XFile(fixedFile.path);
          // } else {
          //   xFile = XFile(compressedFile.path);
          // }

          LoadingMee.dismiss();
          setState(() {});
        },
      ),
    );
  }

  Future<File> flipImage(File file) async {
    if (direction == CameraLensDirection.front) {
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

  switchButton() {
    return Positioned(
      left: screenWidth! / 6,
      bottom: 25,
      child: IconButtonMee(
        size: 45,
        icon: const Icon(Icons.cameraswitch),
        color: Colors.white12,
        onPressed: () async {
          try {
            showFocusCircle = false;
            direction = direction == CameraLensDirection.front ? CameraLensDirection.back : CameraLensDirection.front;
            description = widget.cameras!.firstWhere((element) => element.lensDirection == direction);
            if (direction == CameraLensDirection.front) {
              controller!.setZoomLevel(1.5);
            } else {
              controller!.setZoomLevel(1);
            }
            controller = CameraController(
              description!,
              ResolutionPreset.high,
              enableAudio: false,
            );
            controller!.initialize().then((value) {
              controller!.setFlashMode(flashMode!);
              if (!mounted) {
                return;
              }
              setState(() {});
            });
          } catch (e) {
            F.log.e(e);
          }
        },
      ),
    );
  }

  Future<void> onCameraTap(TapUpDetails details) async {
    if (controller!.value.isInitialized != true) return;
    if (direction == CameraLensDirection.front) return;

    x = details.localPosition.dx;
    y = details.localPosition.dy;
    double sWidth = screenWidth!;
    double sHeight = screenHeight!;

    setState(() {
      controller!.setFocusPoint(Offset(x / sWidth, y / sHeight));
      controller!.setExposurePoint(Offset(x / sWidth, y / sHeight));
      showFocusCircle = true;

      Future.delayed(const Duration(seconds: 2)).whenComplete(() {
        setState(() {
          showFocusCircle = false;
        });
      });
    });
  }
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
