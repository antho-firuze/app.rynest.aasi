import 'dart:developer';
import 'dart:io';

import 'package:app.rynest.aasi/common/views/camera/camera_view.dart';
import 'package:app.rynest.aasi/common/views/camera/widgets/card_clip.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _cameraLensDirection = CameraLensDirection.back;
  bool _canProcess = true;
  bool _isBusy = false;
  bool _enabled = false;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
              onImage: _processImage2,
              initialCameraLensDirection: _cameraLensDirection,
              customClipperFront: CardClip(),
              customClipperRear: CardClip(),
              onTakeShoot: (file) async => await ref.read(profileCtrlProvider).updatePhotoIdCard(file),
              canSwitch: false,
              enabled: _enabled,
              // triggerShoot: _enabled,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Text('Pastikan KTP Anda berada pas dalam kotak foto.').tsTitleL().center(),
                    5.height,
                    Text('[ Sekitar jarak 10-15 cm. ]').tsBodyL().center(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Tombol shutter akan aktif apabila posisi KTP sudah pas.').tsTitleL().center(),
                      5.height,
                      Text('* Hanya KTP yang diperbolehkan.').tsBodyL().center(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _processImage2(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {});

    final recognizedText = await _textRecognizer.processImage(inputImage);
    _processText(recognizedText);
    // if (_enabled) {
    //   if (mounted) {
    //     WidgetsBinding.instance.addPostFrameCallback((_) {
    //       log("closed", name: "CAMERA-OCR");
    //       Navigator.of(context).pop();
    //     });
    //   }
    // }

    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  void _processText(RecognizedText text) async {
    List<String> texts = [];
    int confidence = 0;

    if (text.blocks.length > 13) {
      log("blocks : ${text.blocks.length}", name: "CAMERA-OCR");

      texts = await _getTexts(text.blocks);
      log("texts length : ${texts.length}", name: "CAMERA-OCR");
      log("texts values : $texts", name: "CAMERA-OCR");

      confidence = await _getConfidence(texts);
      log("confidence : $confidence", name: "CAMERA-OCR");

      _enabled = confidence > 7;
    } else {
      _enabled = false;
    }
  }

  Future<List<String>> _getTexts(List<TextBlock> textBlocks) async {
    List<String> res = [];
    for (final block in textBlocks) {
      res.add(block.text.toLowerCase());
    }
    return res;
  }

  Future<int> _getConfidence(List<String> texts) async {
    int confidence = 0;
    final idcardElements = [
      "nik",
      "nama",
      "tempat",
      "tgl lahir",
      "jenis kelamin",
      "alamat",
      "agama",
      "status",
      "perkawinan",
      "pekerjaan",
      "kewarganegaraan",
      "berlaku",
      "hingga",
    ];

    for (final el in idcardElements) {
      for (final text in texts) {
        if (text.contains(el)) {
          confidence += 1;
        }
      }
    }
    return confidence;
  }
}
