import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_interruption.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_expired.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_finish.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_kicked_out.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_not_registered.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_start.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_too_earlier.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamView extends ConsumerWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(authUserProvider) == null) {
      return ExamStageKickedOut();
    }

    if (ref.watch(examInterruptionProvider) == true) {
      return ExamInterruption();
    }

    final examSchedule = ref.watch(examScheduleProvider);
    return MyUI(
      child: switch (examSchedule?.state) {
        'NOT-YET-OPEN' => const ExamStageTooEarlier(),
        'IN-SCHEDULE' => const ExamStageStart(),
        'ON-GOING' => const ExamStageStart(),
        'COMPLETED' => const ExamStageFinish(),
        'EXPIRED' => const ExamStageExpired(),
        String() => const ExamStageNotRegistered(),
        null => const ExamStageNotRegistered(),
      },
    );
  }
}
