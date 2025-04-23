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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ujian'),
        actions: [
          TextButton(
            onPressed: () async => ref.refresh(fetchExamScheduleProvider),
            child: Text('Refresh').clr(oWhite),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(fetchExamScheduleProvider),
        child: ref.watch(fetchExamScheduleProvider).when(
              skipLoadingOnRefresh: false,
              data: (data) {
                if (data == null) {
                  return Container();
                }

                final examSchedule = data;

                return ListView(
                  children: [
                    5.height,
                    const LogoArtWork(child: LogoApp()),
                    5.height,
                    if (examSchedule.photoFinish == false) ...[
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
                              trailing: Icon(
                                  examSchedule.photoFinish == true ? SuperIcons.bx_check : SuperIcons.cl_warning_line,
                                  color: examSchedule.photoFinish == true ? oGreen : oRed),
                              onTap: examSchedule.photoFinish == true
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
                              Text('Note: Untuk melihat hasil ujian silahkan anda cek di Menu Hasil Ujian').center(),
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
              error: (error, stackTrace) => Container(),
              loading: () => Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}
