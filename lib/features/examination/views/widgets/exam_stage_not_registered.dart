import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamStageNotRegistered extends ConsumerWidget {
  const ExamStageNotRegistered({super.key});

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
                title: const Text('Belum Terdaftar').tsTitleL().center().clr(oWhite),
                subTitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('Mohon maaf, sepertinya Anda belum terdaftar sebagai peserta ujian.')
                      .tsBodyM()
                      .center(),
                ),
                child: Column(
                  children: [
                    20.height,
                    const Text('Silahkan Anda hubungi Customer Service AASI.'),
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
