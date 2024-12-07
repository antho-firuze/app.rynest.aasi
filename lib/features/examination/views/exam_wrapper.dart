import 'package:app.rynest.aasi/common/views/overlay_container.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ExamWrapper extends ConsumerWidget {
  const ExamWrapper({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(examStageProvider) == ExamStage.ongoing;

    return Scaffold(
      body: Stack(
        children: [
          child ?? const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OverlayContainer(
                isShowOverlay: isShowOverlay,
                backgroundColor: oDarkBlue,
                offsetY: 3,
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              SuperIcons.bs_exclamation_diamond,
                              color: oWhite,
                            ),
                            10.width,
                            const Text('Ujian masih berjalan !').clr(oWhite),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Waktu tersisa : ').clr(oWhite),
                            Text(ref.watch(remainingTimeProvider)).clr(oWhite),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
