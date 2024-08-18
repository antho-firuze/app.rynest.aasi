import 'package:flutter/material.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';

class SectionPoint extends StatelessWidget {
  const SectionPoint({
    super.key,
    required this.numOfQuestion,
    required this.numOfCorrect,
  });

  final int numOfQuestion;
  final int numOfCorrect;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ValueCard(title: 'Soal', value: numOfQuestion),
        ValueCard(
          title: 'Benar',
          value: numOfCorrect,
          color: Colors.green.shade100,
        ),
        ValueCard(
          title: 'Salah',
          value: numOfQuestion - numOfCorrect,
          color: Colors.red.shade100,
        ),
      ],
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: (screenWidth(context) / 3.8),
      height: 100,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 3.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Column(
        children: [
          vSpaceXSmall,
          Expanded(
              child: Center(
                  child: Text(
            value.toString(),
            style: oStyle
                .size(screenWidth(context) < 800
                    ? 25
                    : screenWidth(context) < 1050
                        ? 40
                        : 50)
                .bold,
          ))),
          // vSpaceXSmall,
          Text(
            title,
            style: oStyle.size(screenWidth(context) < 800
                ? 16
                : screenWidth(context) < 1050
                    ? 18
                    : 22),
          ),
          vSpaceXSmall,
        ],
      ),
    );
  }
}
