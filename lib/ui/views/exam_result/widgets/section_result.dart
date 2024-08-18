import 'package:flutter/material.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({
    super.key,
    required this.score,
  });

  final double score;

  @override
  Widget build(BuildContext context) {
    // IconData iconData = score < 60
    //     ? Icons.sentiment_dissatisfied_sharp
    //     : Icons.sentiment_satisfied_alt;
    String status = score < 60 ? 'GAGAL' : 'LULUS';
    String description = score < 60
        ? '• Minimum Jawaban Benar harus diatas 41 atau 60% dari Soal'
        : '• Nilai anda diatas 60% atau Jawaban Benar diatas 41 Soal';
    Color color = score < 60 ? Colors.red.shade400 : Colors.green.shade100;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 3.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dinyatakan : ',
                        style: captionStyle(context),
                      ),
                      Text(
                        status,
                        style: captionStyle(context).copyWith(
                          fontSize: 30,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                  divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 15),
                    child: Text(
                      description,
                      style: bodyStyle(context).copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
