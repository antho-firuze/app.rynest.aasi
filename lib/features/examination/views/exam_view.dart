import 'dart:developer';

import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_questions.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_cancel.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_expired.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_finish.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_not_registered.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_start.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_stage_too_earlier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamView extends ConsumerWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stage = ref.watch(examStageProvider);
    final exam = ref.watch(examProvider);
    final questions = ref.watch(questionsProvider);

    log(stage.toString(), name: 'EXAM-VIEW');

    // return const ExamStageCancel();

    if ([ExamStage.start, ExamStage.ongoing].contains(stage) && exam?.examStart != null && questions != null) {
      return const ExamQuestions();
    }

    return switch (stage) {
      ExamStage.notRegistered => const ExamStageNotRegistered(),
      ExamStage.cancel => const ExamStageCancel(),
      ExamStage.tooEarlier => const ExamStageTooEarlier(),
      ExamStage.start => const ExamStageStart(),
      ExamStage.ongoing => const ExamStageStart(),
      ExamStage.finish => const ExamStageFinish(),
      ExamStage.expired => const ExamStageExpired(),
    };
  }
}
