import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_questions_list.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examCtrl = ref.read(examCtrlProvider);

    return SizedBox(
      height: 38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          CustomButton(
            tooltip: "Pertanyaan awal",
            child: const Text('First'),
            onPressed: () => examCtrl.loadQuestion(Go.first),
          ),
          10.width,
          CustomButton(
            tooltip: "Pertanyaan sebelumnya",
            child: const Text('Prev'),
            onPressed: () => examCtrl.loadQuestion(Go.previous),
          ),
          10.width,
          CustomIcon(
            // SuperIcons.is_grid_1_outline,
            SuperIcons.bx_grid_solid,
            // SuperIcons.cl_list_line,
            // SuperIcons.mg_list_ordered_line,
            tooltip: "List Pertanyaan",
            backgroundColor: oGrey70,
            // foregroundColor: oWhite,
            size: 38,
            onPressed: () => context.goto(page: const ExamQuestionsList()),
          ),
          10.width,
          CustomButton(
            tooltip: "Pertanyaan selanjutnya",
            child: const Text('Next'),
            onPressed: () => examCtrl.loadQuestion(Go.next),
          ),
          10.width,
          CustomButton(
            tooltip: "Pertanyaan terakhir",
            child: const Text('Last'),
            onPressed: () => examCtrl.loadQuestion(Go.last),
          ),
        ],
      ),
    );
  }
}
