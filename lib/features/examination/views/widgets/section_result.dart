import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/model/exam.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({
    super.key,
    this.exam,
    // required this.score,
    // required this.passed,
    this.onRefresh,
  });

  final Exam? exam;
  // final double score;
  // final double passed;
  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    if (exam == null) {
      return CustomCard(
        title: const Text('NILAI ANDA DINYATAKAN').tsTitleL().center().bold().clr(oWhite),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.height,
            Text('Maaf terkendala koneksi, silahkan anda coba kembali !'),
            20.height,
            CustomButton(onPressed: onRefresh, child: Text('Refresh')),
            10.height,
          ],
        ),
      );
    }

    final score = exam!.score!;
    final passed = exam!.passedGrade!;

    String status = score < passed ? 'GAGAL' : 'LULUS';
    String description = score < passed
        ? '• Minimum Jawaban Benar adalah 42 dari total soal yang diujikan.'
        : '• Jawaban Benar >= 42 dari total soal yang diujikan.';
    Color color = score < passed ? Colors.red[400]! : Colors.green[400]!;

    return CustomCard(
      color: color,
      title: const Text('NILAI ANDA DINYATAKAN').tsTitleL().center().bold().clr(oWhite),
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
