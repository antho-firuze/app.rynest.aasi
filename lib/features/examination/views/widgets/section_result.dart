import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({
    super.key,
    required this.score,
    required this.passed,
  });

  final double score;
  final double passed;

  @override
  Widget build(BuildContext context) {
    String status = score < passed ? 'GAGAL' : 'LULUS';
    String description = score < passed
        ? '• Minimum Jawaban Benar harus diatas 41 atau 60% dari soal.'
        : '• Jawaban Benar > 41 atau diatas 60% dari soal.';
    Color color = score < passed ? Colors.red[400]! : Colors.green[400]!;
    return CustomCard(
      color: color,
      title: const Text('NILAI ANDA DINYATAKAN').tsTitleL().center().bold().clr(score < passed ? oWhite : null),
      child: Column(
        children: [
          20.height,
          Text(status).tsHeadlineDS().center().bold(),
          10.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Keterangan : '),
                      5.height,
                      divider(),
                      5.height,
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 15),
                        child: Text(description),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          10.height,
        ],
      ),
    );
  }
}
