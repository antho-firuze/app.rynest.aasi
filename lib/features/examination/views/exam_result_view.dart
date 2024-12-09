import 'dart:developer';

import 'package:app.rynest.aasi/common/exceptions/warning_exeption.dart';
import 'package:app.rynest.aasi/common/widgets/custom_avatar.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/camera_exam_finish_view.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/section_point.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/section_result.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/datetime_utils.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/orientation_utils.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ExamResultView extends ConsumerWidget {
  const ExamResultView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stage = ref.watch(examStageProvider);
    final profile = ref.watch(profileProvider);
    final exam = ref.watch(examProvider);
    final photos = ref.watch(examPhotosProvider);

    bool? photoExamFinish = photos?.examFinish != null;

    log("stage : $stage", name: 'EXAM-RESULT-VIEW');
    log("score : ${exam?.score}", name: 'EXAM-RESULT-VIEW');
    log("passedGrade : ${exam?.passedGrade}", name: 'EXAM-RESULT-VIEW');

    if ([ExamStage.notRegistered, ExamStage.cancel, ExamStage.tooEarlier, ExamStage.start, ExamStage.expired]
        .contains(stage)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: const Text('Hasil Ujian')),
          body: RefreshIndicator(
            onRefresh: () async => await ref.read(examCtrlProvider).fetchSchedule(),
            child: ListView(
              children: [
                5.height,
                const LogoArtWork(
                  child: LogoApp(),
                ),
                10.height,
                const WarningException(
                  title: 'Hasil ujian Anda belum tersedia.',
                ),
                60.height,
              ],
            ),
          ),
        ),
      );
    }

    if (ExamStage.finish == stage && photoExamFinish == false) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: const Text('Hasil Ujian')),
          body: RefreshIndicator(
            onRefresh: () async => await ref.read(examCtrlProvider).fetchSchedule(),
            child: ListView(
              children: [
                5.height,
                const LogoArtWork(
                  child: LogoApp(),
                ),
                10.height,
                CustomCard(
                  title: const Text('Pasca Ujian').tsTitleL().center().clr(oWhite),
                  subTitle: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                            'Mohon lengkapi terlebih dahulu data dibawah ini, sebagai syarat untuk dapat melihat Hasil Ujian :')
                        .tsBodyM()
                        .center(),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(SuperIcons.mg_IDcard_line),
                        title: const Text('Foto Selesai Ujian').bold(),
                        subtitle: const Text('Silahkan anda ambil foto setelah ujian.'),
                        trailing: Icon(photoExamFinish == true ? SuperIcons.bx_check : SuperIcons.cl_warning_line,
                            color: photoExamFinish == true ? oGreen : oRed),
                        onTap: photoExamFinish == true
                            ? null
                            : () async => await context.goto(page: const CameraExamFinishView()),
                      ),
                    ],
                  ),
                ),
                60.height,
              ],
            ),
          ),
        ),
      );
    }

    return MyUI(
      child: Scaffold(
        appBar: stage != ExamStage.ongoing
            ? AppBar(title: const Text('Hasil Ujian'))
            : AppBar(title: const Text('Hasil Ujian Sementara')),
        body: RefreshIndicator(
          onRefresh: () async => await ref.read(examCtrlProvider).fetchResult(),
          child: ListView(
            children: [
              5.height,
              LogoArtWork(
                child: CustomAvatar(
                  width: 120,
                  height: 120,
                  image: profile?.photo,
                  initial: profile?.fullName,
                ),
              ),
              10.height,
              CustomCard(
                title: const Text('Profil').tsTitleL().center().clr(oWhite),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Text('Nama Lengkap').tsBodyM().center(),
                          Text(profile?.fullName ?? '').tsTitleL().center(),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('No Identitas').tsBodyM().center(),
                              Text(profile?.cardNo ?? '').tsTitleL().center(),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Code').tsBodyM().center(),
                              Text(profile?.memberId ?? '').tsTitleL().center(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Text('Perusahaan').tsBodyM().center(),
                          Text(profile?.company?.name ?? '').tsTitleL().center(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.height,
              SectionPoint(
                numOfQuestion: exam?.numOfQuestion ?? 60,
                numAnsweredQuestion: exam?.numAnsweredQuestion ?? 0,
                numOfCorrect: exam?.numOfCorrect ?? 0,
                numOfWrong: exam?.numAnsweredQuestion == null
                    ? 0
                    : (exam?.numAnsweredQuestion ?? 0) - (exam?.numOfCorrect ?? 0),
              ),
              20.height,
              if (stage == ExamStage.finish) ...[
                SectionResult(score: exam?.score ?? 0.0, passed: exam?.passedGrade ?? 0.0),
                20.height,
                CustomCard(
                  color: Colors.green[300]!,
                  title: const Text('Detail Ujian').tsTitleL().center().clr(oWhite),
                  child: Column(
                    children: [
                      const Text('Status').tsBodyM().center(),
                      Text(ref.watch(examStatusProvider)).tsTitleL().center(),
                      20.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Wrap(
                          direction: context.isLandscape() ? Axis.horizontal : Axis.vertical,
                          spacing: 10.whenLandscape(20)!,
                          runSpacing: 10,
                          children: [
                            Column(
                              children: [
                                const Text('Mulai ujian').tsBodyM().center(),
                                if (exam?.examStart != null)
                                  Text(exam!.examStart!.custom('E, d MMM yyyy - HH:mm')).tsTitleL().center()
                                else
                                  const Text("-").tsTitleL().center(),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Selesai ujian').tsBodyM().center(),
                                if (exam?.examEnd != null)
                                  Text(exam!.examEnd!.custom('E, d MMM yyyy - HH:mm')).tsTitleL().center()
                                else
                                  const Text("-").tsTitleL().center(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
              ],
              Column(
                children: [
                  const Text('Powered By:').tsCaption(),
                  const LogoApp(width: 100),
                ],
              ),
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
