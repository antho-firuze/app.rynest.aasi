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
    final questions = ref.watch(questionsProvider);

    final keys = exam?.answerKeys?.split(',');

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('List Pertanyaan')),
        body: RefreshIndicator(
          onRefresh: () async {
            // log("$photos");
          },
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
                    itemCount: questions?.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7.whenLandscape(10)!.toInt()),
                    itemBuilder: (context, index) {
                      final key = keys?[index];
                      return GestureDetector(
                        onTap: () async {
                          ref.read(examProvider.notifier).state = ref.read(examProvider)?.copyWith(syncQuestion: index);
                          await ref.read(examCtrlProvider).loadQuestion();

                          if (context.mounted) context.pop();
                        },
                        child: Card(
                          color: key != 'X' ? secondaryLight : null,
                          child: Center(
                            child: Text("${index + 1}"),
                          ),
                        ),
                      );
                    },
                  ),
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
