import 'package:app.rynest.aasi/common/exceptions/warning_exeption.dart';
import 'package:app.rynest.aasi/common/services/alert_service.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/bottom_navigation.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/top_navigation.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ExamQuestionView extends ConsumerWidget {
  const ExamQuestionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fontSize = ref.watch(fontSizeProvider);

    debugPrint('Exam Question Re/Build');

    // CHECK #1: on start exam, examStillGoingProvider default is [false]. Then must check the exam state <> ON-GOING
    // CHECK #2: on going exam, when timer stop & hit examStillGoingProvider to false. Then check the exam state <> ON-GOING
    if (ref.watch(examStillGoingProvider) == false) {
      debugPrint('1Exam State : ${ref.read(examProvider)?.state}');
      if (ref.read(examProvider)?.state != 'ON-GOING') {
        if (context.mounted) context.popz();
      }
    }

    // CHECK #1: on going exam, when any interruption & exam state == ON-GOING, then force exam question to close.
    if (ref.watch(examInterruptionProvider) == true) {
      debugPrint('2Exam State : ${ref.read(examProvider)?.state}');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ref.read(examProvider)?.state == 'ON-GOING') {
          if (context.mounted) context.popz();
        }
      });
    }

    if (ref.watch(isRemainingTimeStillGoingProvider) == false) {
      debugPrint('3Exam State : ${ref.read(examProvider)?.state}');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.popz();
      });
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: MyUI(
        child: Scaffold(
          body: Stack(
            children: [
              const LogoArtWork(),
              Align(
                alignment: Alignment.centerRight,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: const Text('Ujian Sertifikasi').tsTitleL().clr(Colors.grey[400]).letterSpace(10),
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  // ignore: unused_result
                  ref.refresh(fetchExamInfoProvider);
                  // ignore: unused_result
                  ref.refresh(fetchQuestionProvider);
                },
                child: ListView(
                  children: [
                    // Header [PAGE | LOGO | TIMER]
                    5.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer(
                            builder: (context, ref, child) {
                              final exam = ref.watch(examProvider);
                              return Text("${ref.read(questionNumProvider)} / ${exam?.questionCount ?? 0}")
                                  .tsTitleL()
                                  .bold();
                            },
                          ),
                          const LogoApp(width: 100),
                          Consumer(
                            builder: (context, ref, child) {
                              return Text(ref.watch(remainingTimeStrProvider)).tsTitleL().bold();
                            },
                          ),
                        ],
                      ),
                    ),
                    // Navigation [CEK SCORE | ZOOM OUT | AUTO NEXT | ZOOM IN | SELESAI]
                    15.height,
                    TopNavigation(),
                    // QUESTION
                    20.height,
                    Consumer(
                      builder: (context, ref, child) {
                        return ref.watch(fetchQuestionProvider).when(
                              skipLoadingOnRefresh: false,
                              data: (data) {
                                if (data == null) {
                                  return WarningException(
                                    title: 'Gagal memuat pertanyaan !',
                                    onRefresh: () => ref.refresh(fetchQuestionProvider),
                                  );
                                }

                                final question = data;
                                final exam = ref.watch(examProvider);
                                int? index = exam?.qids.indexOf(question.id!);
                                String? aKey = exam?.keys[index ?? 0].toLowerCase();
                                final examCtrl = ref.read(examCtrlProvider);

                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Pertanyaan').bold().size(fontSize),
                                      divider(),
                                      5.height,
                                      HtmlWidget(
                                        question.question ?? '',
                                        textStyle: TextStyle(fontSize: fontSize, color: oBlack),
                                      ),
                                      10.height,
                                      15.height,
                                      const Text('Pilihan Jawaban').bold().size(fontSize),
                                      divider(),
                                      5.height,
                                      Column(
                                        spacing: 5,
                                        children: [
                                          ListTile(
                                            tileColor: question.optionA == aKey ? secondaryLight : Colors.grey[300],
                                            leading: const Text('A').family('Roboto').size(fontSize),
                                            title: Text("${question.shuffleOptionA}").size(fontSize),
                                            onTap: () async => await examCtrl.callAnswer(index!, question.optionA!),
                                          ),
                                          ListTile(
                                            tileColor: question.optionB == aKey ? secondaryLight : Colors.grey[300],
                                            leading: const Text('B').family('Roboto').size(fontSize),
                                            title: Text("${question.shuffleOptionB}").size(fontSize),
                                            onTap: () async => await examCtrl.callAnswer(index!, question.optionB!),
                                          ),
                                          ListTile(
                                            tileColor: question.optionC == aKey ? secondaryLight : Colors.grey[300],
                                            leading: const Text('C').family('Roboto').size(fontSize),
                                            title: Text("${question.shuffleOptionC}").size(fontSize),
                                            onTap: () async => await examCtrl.callAnswer(index!, question.optionC!),
                                          ),
                                          ListTile(
                                            tileColor: question.optionD == aKey ? secondaryLight : Colors.grey[300],
                                            leading: const Text('D').family('Roboto').size(fontSize),
                                            title: Text("${question.shuffleOptionD}").size(fontSize),
                                            onTap: () async => await examCtrl.callAnswer(index!, question.optionD!),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              error: (error, stackTrace) => Container(),
                              loading: () => Center(child: CircularProgressIndicator()),
                            );
                      },
                    ),
                    60.height,
                  ],
                ),
              ),
              // BOTTOM NAVIGATOR
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BottomNavigation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
