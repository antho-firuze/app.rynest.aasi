import 'package:flutter/material.dart';

import '../../../../models/question.dart';
import '../exam_viewmodel.dart';
import 'option_card.dart';

class BuildOptions extends StatelessWidget {
  const BuildOptions({super.key, this.items, required this.model});

  final List<QuestionOption>? items;
  final ExamViewModel model;

  @override
  Widget build(BuildContext context) {
    return items == null
        ? const SizedBox()
        : Column(
            children: [
              ...List.generate(
                items!.length,
                (index) => OptionCard(
                  fontSize: model.fontSize,
                  text: items![index].textOption!,
                  questionID: items![index].questionId!,
                  optionKey: items![index].optionKey!,
                  answeredKey: items![index].answeredKey!,
                  onPressed: () async {
                    if (items![index].optionKey != items![index].answeredKey) {
                      await model.submitAnswer(items![index].optionKey!);
                    }
                  },
                ),
              ),
            ],
          );
  }
}
