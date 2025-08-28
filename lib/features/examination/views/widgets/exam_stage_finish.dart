import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/features/examination/views/camera_exam_finish_view.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ExamStageFinish extends ConsumerWidget {
  const ExamStageFinish({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(examPhotosProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ujian'),
        actions: [
          TextButton(
            onPressed: () async => ref.refresh(checkAfterExamFinishProvider),
            child: Text('Refresh').clr(oWhite),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(checkAfterExamFinishProvider),
        child: ref.watch(checkAfterExamFinishProvider).when(
              skipLoadingOnRefresh: false,
              data: (data) {
                bool photoExamFinish = data[0];

                return ListView(
                  children: [
                    5.height,
                    const LogoArtWork(child: LogoApp()),
                    5.height,
                    if (photoExamFinish == false) ...[
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
                    ] else ...[
                      CustomCard(
                        title: const Text('Ujian Selesai').tsTitleL().center().clr(oWhite),
                        subTitle: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text('Terima kasih, Anda telah selesai mengikuti Ujian Lisensi AASI.')
                              .tsBodyM()
                              .center(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              20.height,
                              const Text(
                                      'Apabila ada pertanyaan mengenai Ujian Lisensi ini silahkan hubungi Customer Service AASI.')
                                  .center(),
                              10.height,
                            ],
                          ),
                        ),
                      ),
                    ],
                    60.height,
                  ],
                );
              },
              error: (error, stackTrace) => Text("$error"),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}
