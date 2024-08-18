import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../models/question.dart';
import '../../../shared/ui_helper.dart';
import '../exam_viewmodel.dart';
import 'build_options.dart';

class BuildQuestion extends StatelessWidget {
  const BuildQuestion({
    super.key,
    this.question,
    this.onImageTap,
    this.options,
    this.fontSize = 16,
    required this.model,
  });

  final Question? question;
  final List<QuestionOption>? options;
  final Function(String?)? onImageTap;
  final int fontSize;
  final ExamViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // if (question != null)
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            border: Border.all(color: kcPrimaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Html(
            data: question != null
                ? """<div>${question?.question ?? ''}</div>"""
                : '',
            style: {"div": Style(fontSize: FontSize(fontSize.toDouble()))},
            // onImageTap: (url, context, attributes, element) => onImageTap!(url),
            onAnchorTap: (url, attributes, element) => onImageTap!(url),
          ),
        ),
        vSpaceXSmall,
        Stack(
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                color: Colors.grey,
              ),
            )),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: Text(
                  'Pilihan Jawaban',
                  style: bodyStyle(context),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        vSpaceXSmall,
        BuildOptions(
          items: options!,
          model: model,
        ),
      ],
    );
  }
}
