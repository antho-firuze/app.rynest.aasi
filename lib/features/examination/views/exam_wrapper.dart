import 'package:app.rynest.aasi/common/views/overlay_container.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ExamWrapper extends ConsumerWidget {
  const ExamWrapper({
    super.key,
    this.child,
    this.onTap,
  });

  final Widget? child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(examStillGoingProvider);
    final user = ref.watch(authUserProvider);

    return Scaffold(
      body: Stack(
        children: [
          child ?? const SizedBox(),
          if (user != null)
            GestureDetector(
              onTap: onTap,
              child: Column(
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
                            if (ref.watch(remainingTimeStrProvider).isNotEmpty)
                              Row(
                                children: [
                                  const Text('Waktu tersisa : ').clr(oWhite),
                                  Text(ref.watch(remainingTimeStrProvider)).clr(oWhite),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
