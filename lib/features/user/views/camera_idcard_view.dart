import 'dart:io';

import 'package:app.rynest.aasi/common/views/camera/camera_view.dart';
import 'package:app.rynest.aasi/common/views/camera/widgets/card_clip.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/ml_idcard_recognition.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraIdCardView extends ConsumerStatefulWidget {
  const CameraIdCardView({super.key, this.onTakeShoot});

  final Function(File file)? onTakeShoot;

  @override
  ConsumerState<CameraIdCardView> createState() => _CameraIdCardViewState();
}

class _CameraIdCardViewState extends ConsumerState<CameraIdCardView> {
  final _cameraLensDirection = CameraLensDirection.back;
  bool _enabled = false;
  late MLIdCardRecognition mlIdCardRecognition;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    mlIdCardRecognition = MLIdCardRecognition(
      confidenceLevel: .5,
      onConfidence: (value) {
        _enabled = value;
        if (mounted) {
          setState(() {});
        }
      },
    );
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

    mlIdCardRecognition.close();

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
              onImage: mlIdCardRecognition.processImage,
              initialCameraLensDirection: _cameraLensDirection,
              customClipperFront: CardClip(),
              customClipperRear: CardClip(),
              onTakeShoot: (file) async => await ref.read(profileCtrlProvider).updatePhotoIdCard(file),
              canSwitch: false,
              enabled: _enabled,
              // triggerShoot: true,
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
}
