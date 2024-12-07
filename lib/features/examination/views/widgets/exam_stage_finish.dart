import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/features/examination/views/camera_exam_finish_view.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ExamStageFinish extends ConsumerWidget {
  const ExamStageFinish({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(examPhotosProvider);

    bool? photoExamFinish = photos?.examFinish != null;

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
              20.height,
              if (photoExamFinish == true) ...[
                CustomCard(
                  title: const Text('Ujian Selesai').tsTitleL().center().clr(oWhite),
                  subTitle: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text('Terima kasih atas waktu anda dalam mengikuti Ujian Lisensi AASI.')
                        .tsBodyM()
                        .center(),
                  ),
                  child: Column(
                    children: [
                      20.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                                'Apabila ada pertanyaan mengenai Ujian Lisensi ini silahkan hubungi Customer Service AASI.')
                            .center(),
                      ),
                      10.height,
                    ],
                  ),
                ),
              ],
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
