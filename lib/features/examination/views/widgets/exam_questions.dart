import 'dart:developer';

import 'package:app.rynest.aasi/common/services/alert_service.dart';
import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/model/question.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_result_view.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/exam_questions_list.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:super_icons/super_icons.dart';

class ExamQuestions extends ConsumerWidget {
  const ExamQuestions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exam = ref.watch(examProvider);
    final questions = ref.watch(questionsProvider);
    final fontSize = ref.watch(fontSizeProvider);

    int index = exam?.syncQuestion ?? 0;
    final question = ref.watch(questionProvider);
    // if (question != null) {
    //   page = (questions?.indexOf(question) ?? 0) + 1;
    // }
    int page = index + 1;

    log("questionId : ${question?.questionId}", name: 'ExamQuestions');

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
                onRefresh: () async => await ref.read(examCtrlProvider).loadQuestion(),
                child: ListView(
                  children: [
                    5.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$page / ${questions?.length ?? 0}").tsTitleL().bold(),
                          const LogoApp(width: 100),
                          Consumer(
                            builder: (context, ref, child) => Text(ref.watch(remainingTimeProvider)).tsTitleL().bold(),
                          ),
                        ],
                      ),
                    ),
                    15.height,
                    Center(
                      child: SizedBox(
                        height: 35,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            20.width,
                            CustomButton(
                              tooltip: "Lihat score/nilai sementara",
                              color: secondaryLight,
                              onPressed: (exam?.numOfRepeat ?? 0) < 1
                                  ? null
                                  : () async {
                                      await AlertService.confirm(
                                        body:
                                            'Anda masih memiliki ${exam?.numOfRepeat} kali kesempatan untuk Cek Score, apakah anda ingin menggunakannya sekarang?',
                                        onYes: () async {
                                          bool result = await ref.read(examCtrlProvider).fetchCheckScore();
                                          if (result == true) {
                                            await context.goto(page: const ExamResultView());
                                          }
                                        },
                                      );
                                    },
                              child: Text("Cek Score ( ${exam?.numOfRepeat} )"),
                            ),
                            5.width,
                            CustomIcon(
                              SuperIcons.bx_zoom_out,
                              tooltip: "Kecilkan ukuran huruf",
                              backgroundColor: oGrey70,
                              size: 38,
                              onPressed: () => ref.read(examCtrlProvider).setFontSize(FontSize.decrease),
                            ),
                            5.width,
                            CustomIcon(
                              SuperIcons.is_next_outline,
                              tooltip: "Otomatis lanjut ke soal berikutnya setelah menjawab.",
                              backgroundColor: ref.watch(autoNextQuestionProvider) ? oGrey70 : null,
                              size: 38,
                              onPressed: () => ref.read(examCtrlProvider).setAutoNext(),
                            ),
                            5.width,
                            CustomIcon(
                              SuperIcons.bx_zoom_in,
                              tooltip: "Besarkan ukuran huruf",
                              backgroundColor: oGrey70,
                              size: 38,
                              onPressed: () => ref.read(examCtrlProvider).setFontSize(FontSize.increase),
                            ),
                            5.width,
                            CustomButton(
                              color: secondaryLight,
                              child: const Text('Selesai'),
                              onPressed: () async {
                                await AlertService.confirm(
                                  body: 'Anda sudah yakin ingin menyelesaikan ujian ini ?',
                                  onYes: () async => await ref.read(examCtrlProvider).fetchFinish(),
                                );
                              },
                            ),
                            20.width,
                          ],
                        ),
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Pertanyaan').bold().size(fontSize),
                          divider(),
                          5.height,
                          HtmlWidget(
                            question?.question ?? '',
                            textStyle: TextStyle(fontSize: fontSize, color: oBlack),
                          ),
                        ],
                      ),
                    ),
                    10.height,
                    // divider(),
                    15.height,
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text('Pilihan Jawaban').bold().size(fontSize),
                            ),
                            divider(padding: const EdgeInsets.only(left: 10)),
                            5.height,
                            ListTile(
                              tileColor:
                                  question?.shuffledA == question?.answeredKey ? secondaryLight : Colors.grey[300],
                              leading: const Text('A').family('Roboto').size(fontSize),
                              title: Text(question?.shuffledOptionA ?? '').size(fontSize),
                              onTap: () async => await ref.read(examCtrlProvider).fetchAnswer(question?.shuffledA),
                            ),
                            5.height,
                            ListTile(
                              tileColor:
                                  question?.shuffledB == question?.answeredKey ? secondaryLight : Colors.grey[300],
                              leading: const Text('B').family('Roboto').size(fontSize),
                              title: Text(question?.shuffledOptionB ?? '').size(fontSize),
                              onTap: () async => await ref.read(examCtrlProvider).fetchAnswer(question?.shuffledB),
                            ),
                            5.height,
                            ListTile(
                              tileColor:
                                  question?.shuffledC == question?.answeredKey ? secondaryLight : Colors.grey[300],
                              leading: const Text('C').family('Roboto').size(fontSize),
                              title: Text(question?.shuffledOptionC ?? '').size(fontSize),
                              onTap: () async => await ref.read(examCtrlProvider).fetchAnswer(question?.shuffledC),
                            ),
                            5.height,
                            ListTile(
                              tileColor:
                                  question?.shuffledD == question?.answeredKey ? secondaryLight : Colors.grey[300],
                              leading: const Text('D').family('Roboto').size(fontSize),
                              title: Text(question?.shuffledOptionD ?? '').size(fontSize),
                              onTap: () async => await ref.read(examCtrlProvider).fetchAnswer(question?.shuffledD),
                            ),
                          ],
                        ),
                      ),
                    ),
                    60.height,
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    height: 38,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        CustomButton(
                          tooltip: "Pertanyaan awal",
                          child: const Text('First'),
                          onPressed: () async => await ref.read(examCtrlProvider).loadQuestion(Go.first),
                        ),
                        10.width,
                        CustomButton(
                          tooltip: "Pertanyaan sebelumnya",
                          child: const Text('Prev'),
                          onPressed: () async => await ref.read(examCtrlProvider).loadQuestion(Go.previous),
                        ),
                        10.width,
                        CustomIcon(
                          // SuperIcons.is_grid_1_outline,
                          SuperIcons.bx_grid_solid,
                          // SuperIcons.cl_list_line,
                          // SuperIcons.mg_list_ordered_line,
                          tooltip: "List Pertanyaan",
                          backgroundColor: oGrey70,
                          // foregroundColor: oWhite,
                          size: 38,
                          onPressed: () => context.goto(page: const ExamQuestionsList()),
                        ),
                        10.width,
                        CustomButton(
                          tooltip: "Pertanyaan selanjutnya",
                          child: const Text('Next'),
                          onPressed: () async => await ref.read(examCtrlProvider).loadQuestion(Go.next),
                        ),
                        10.width,
                        CustomButton(
                          tooltip: "Pertanyaan terakhir",
                          child: const Text('Last'),
                          onPressed: () async => await ref.read(examCtrlProvider).loadQuestion(Go.last),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
