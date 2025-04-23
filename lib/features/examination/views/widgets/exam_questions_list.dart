import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExamQuestionsList extends ConsumerWidget {
  const ExamQuestionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exam = ref.watch(examProvider);
    final keys = exam?.answerKeys?.split(',');
    final cIdx = ref.read(questionNumProvider) - 1;

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('List Pertanyaan')),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              5.height,
              const LogoArtWork(child: LogoApp()),
              5.height,
              Center(
                child: SizedBox(
                  width: context.screenWidthRatio(.9, .8),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: exam?.qids.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7.whenLandscape(10)!.toInt()),
                    itemBuilder: (context, index) {
                      final key = keys?[index];
                      return GestureDetector(
                        onTap: () async {
                          if (context.mounted) context.pop();

                          if (index == cIdx) return;

                          final qid = exam?.qids[index];
                          ref.read(examProvider.notifier).state = exam?.copyWith(syncQuestion: qid);
                          ref.read(examCtrlProvider).loadQuestion();
                        },
                        child: Card(
                          color: key != 'X' ? secondaryLight : null,
                          shape: index == cIdx
                              ? RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: oRed),
                                )
                              : null,
                          child: Center(
                            child: Text("${index + 1}"),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              15.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Keterangan'),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 45, height: 45, child: Card(color: null)),
                        Text('Pertanyaan belum dijawab'),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 45, height: 45, child: Card(color: secondaryLight)),
                        Text('Pertanyaan sudah dijawab'),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 45,
                          height: 45,
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: oRed),
                            ),
                          ),
                        ),
                        Text('Posisi sekarang'),
                      ],
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
}
