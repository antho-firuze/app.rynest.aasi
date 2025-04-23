import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamStageExpired extends ConsumerWidget {
  const ExamStageExpired({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Ujian')),
        body: RefreshIndicator(
          onRefresh: () async {
            // ref.refresh(fetchProfileProvider);
            // ref.refresh(fetchExamScheduleProvider);
            // ref.refresh(fetchExamPhotosProvider);
          },
          child: ListView(
            children: [
              5.height,
              const LogoArtWork(child: LogoApp()),
              5.height,
              CustomCard(
                title: const Text('Ujian Kadaluarsa').tsTitleL().center().clr(oWhite),
                subTitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                          'Mohon maaf, jadwal yang telah ditentukan untuk Anda dalam mengikuti Ujian Lisensi AASI telah kadaluarsa. Sedangkan anda belum melakukan Ujian Lisensi tersebut.')
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
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
