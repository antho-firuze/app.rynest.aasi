import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class TopNavigation extends ConsumerWidget {
  const TopNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examCtrl = ref.read(examCtrlProvider);
    final exam = ref.watch(examProvider);

    int checkScore = exam?.checkScore ?? 0;
    int clickScore = exam?.clickScore ?? 0;

    return Center(
      child: SizedBox(
        height: 35,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            20.width,
            CustomButton(
              tooltip: "Lihat score/nilai sementara",
              color: secondaryLight,
              onPressed: () async => await examCtrl.callCheckScore(),
              child: Text("Cek Score $checkScore/$clickScore"),
            ),
            5.width,
            CustomIcon(
              SuperIcons.bx_zoom_out,
              tooltip: "Kecilkan ukuran huruf",
              backgroundColor: oGrey70,
              size: 38,
              onPressed: () => examCtrl.setFontSize(FontSize.decrease),
            ),
            5.width,
            CustomIcon(
              SuperIcons.is_next_outline,
              tooltip: "Otomatis lanjut ke soal berikutnya setelah menjawab.",
              backgroundColor: ref.watch(autoNextQuestionProvider) ? oGrey70 : null,
              size: 38,
              onPressed: () => examCtrl.setAutoNext(),
            ),
            5.width,
            CustomIcon(
              SuperIcons.bx_zoom_in,
              tooltip: "Besarkan ukuran huruf",
              backgroundColor: oGrey70,
              size: 38,
              onPressed: () => examCtrl.setFontSize(FontSize.increase),
            ),
            5.width,
            CustomButton(
              color: secondaryLight,
              onPressed: () async => await examCtrl.callFinish(),
              child: const Text('Selesai'),
            ),
            20.width,
          ],
        ),
      ),
    );
  }
}
