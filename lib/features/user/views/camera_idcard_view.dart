import 'dart:io';

import 'package:app.rynest.aasi/common/views/camera/camera_view.dart';
import 'package:app.rynest.aasi/common/views/camera/widgets/card_clip.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/text_detector_painter.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class CameraIdCardView extends ConsumerStatefulWidget {
  const CameraIdCardView({super.key, this.onTakeShoot});

  final Function(File file)? onTakeShoot;

  @override
  ConsumerState<CameraIdCardView> createState() => _CameraIdCardViewState();
}

class _CameraIdCardViewState extends ConsumerState<CameraIdCardView> {
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  final _cameraLensDirection = CameraLensDirection.back;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Ambil Foto KTP')),
        body: Stack(
          children: [
            CameraView(
              customPaint: _customPaint,
              onImage: _processImage,
              initialCameraLensDirection: _cameraLensDirection,
              customClipperFront: CardClip(),
              customClipperRear: CardClip(),
              onTakeShoot: (file) async => await ref.read(profileCtrlProvider).updatePhotoIdCard(file),
            ),
          ],
        ),
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