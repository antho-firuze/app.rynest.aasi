import 'dart:io';

import 'package:app.rynest.aasi/common/views/camera/camera_view.dart';
import 'package:app.rynest.aasi/common/views/camera/widgets/card_clip.dart';
import 'package:app.rynest.aasi/common/views/camera/widgets/selfie_clip.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/text_detector_painter.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class CameraIdCardView extends StatefulWidget {
  const CameraIdCardView({super.key, this.onTakeShoot});

  final Function(File file)? onTakeShoot;

  @override
  State<CameraIdCardView> createState() => _CameraIdCardViewState();
}

class _CameraIdCardViewState extends State<CameraIdCardView> {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  final _cameraLensDirection = CameraLensDirection.front;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraView(
            customPaint: _customPaint,
            onImage: _processImage,
            initialCameraLensDirection: _cameraLensDirection,
            customClipperFront: SelfieClip(),
            customClipperRear: CardClip(),
          ),
        ],
      ),
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.metadata?.size != null && inputImage.metadata?.rotation != null) {
      final painter = TextRecognizerPainter(
        recognizedText,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
      );
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Recognized text:\n\n${recognizedText.text}';
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
