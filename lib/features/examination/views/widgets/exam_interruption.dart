import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamInterruption extends ConsumerWidget {
  const ExamInterruption({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Exam Interruption Re/Build');

    if (ref.watch(examInterruptionProvider) == false) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.popz();
      });
    }

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Ujian')),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              5.height,
              const LogoArtWork(child: LogoApp()),
              5.height,
              CustomCard(
                title: const Text('Gangguan Terdeteksi').tsTitleL().center().clr(oWhite),
                subTitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text("""
Sepertinya ada usaha yang mencoba untuk meng-akses ujian anda di perangkat lain. 

Jika itu anda silahkan klik tombol 
[ Iya, itu perangkat Saya ] 

atau jika itu bukan anda silahkan anda klik tombol 
[ Lanjutkan Ujian ].
""").tsBodyM().center(),
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomButton(
                              onPressed: () => ref.read(examCtrlProvider).callThatsMe(),
                              child: Text('Iya, itu perangkat Saya').center(),
                            ),
                          ),
                          Flexible(
                            child: CustomButton(
                              onPressed: () async => await ref.read(examCtrlProvider).callStart(),
                              child: Text('Lanjutkan Ujian').center(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: const Text(
                    //           'Apabila ada pertanyaan mengenai Ujian Lisensi ini silahkan hubungi Customer Service AASI.')
                    //       .center(),
                    // ),
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
