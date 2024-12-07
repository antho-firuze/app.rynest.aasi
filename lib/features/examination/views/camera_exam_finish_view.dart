import 'dart:io';

import 'package:app.rynest.aasi/common/views/camera/camera_view.dart';
import 'package:app.rynest.aasi/common/views/camera/widgets/selfie_clip.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraExamFinishView extends ConsumerWidget {
  const CameraExamFinishView({super.key, this.onTakeShoot});

  final Function(File file)? onTakeShoot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Ambil Foto Selesai Ujian')),
        body: Stack(
          children: [
            CameraView(
              initialCameraLensDirection: CameraLensDirection.front,
              customClipperFront: SelfieClip(),
              customClipperRear: SelfieClip(),
              onTakeShoot: (file) async => await ref.read(examCtrlProvider).updatePhotoExamFinish(file),
            ),
          ],
        ),
      ),
    );
  }
}
