import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamStageCancel extends ConsumerWidget {
  const ExamStageCancel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Ujian')),
        body: RefreshIndicator(
          onRefresh: () async {
            await ref.read(profileCtrlProvider).fetchProfile();
            await ref.read(examCtrlProvider).fetchSchedule();
            await ref.read(examCtrlProvider).fetchPhotos();
            await ref.read(examCtrlProvider).fetchStatus();
            // log("$photos");
          },
          child: ListView(
            children: [
              5.height,
              const LogoArtWork(child: LogoApp()),
              5.height,
              CustomCard(
                title: const Text('Jadwal Ujian Di Batalkan').tsTitleL().center().clr(oWhite),
                subTitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('Mohon maaf, jadwal anda dalam mengikuti Ujian Lisensi AASI di batalkan.')
                      .tsBodyM()
                      .center(),
                ),
                child: Column(
                  children: [
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                              'Untuk lebih jelasnya mengenai masalah ini silahkan hubungi Customer Service AASI.')
                          .center(),
                    ),
                    10.height,
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
}
