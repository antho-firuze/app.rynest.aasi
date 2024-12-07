import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class SectionPoint extends StatelessWidget {
  const SectionPoint({
    super.key,
    required this.numOfQuestion,
    required this.numAnsweredQuestion,
    required this.numOfCorrect,
    required this.numOfWrong,
  });

  final int numOfQuestion;
  final int numAnsweredQuestion;
  final int numOfCorrect;
  final int numOfWrong;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenWidthRatio(.9, .6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueCard(
              title: 'Soal',
              value: numOfQuestion,
              color: secondaryLight,
            ),
            ValueCard(
              title: 'Jawab',
              value: numAnsweredQuestion,
              color: Colors.blue[200],
            ),
            ValueCard(
              title: 'Benar',
              value: numOfCorrect,
              color: Colors.green[200],
            ),
            ValueCard(
              title: 'Salah',
              value: numOfWrong,
              color: Colors.red[200],
            ),
          ],
        ),
      ),
    );
  }
}

class ValueCard extends StatelessWidget {
  const ValueCard({
    super.key,
    required this.value,
    required this.title,
    this.color,
  });

  final String title;
  final int value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: color ?? Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(title).tsTitleL().center(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(value.toString()).tsHeadlineDS().bold(),
            ),
          ],
        ),
      ),
    );
  }
}
