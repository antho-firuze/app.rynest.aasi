import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    this.fontSize = 16,
    this.text = '',
    required this.questionID,
    required this.optionKey,
    required this.answeredKey,
    required this.onPressed,
  });

  final String text;
  final int questionID;
  final String optionKey;
  final String answeredKey;
  final int fontSize;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            // minimumSize: Size(width ?? 150, height), // Set this
            padding: const EdgeInsets.all(8), // and this
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: optionKey == answeredKey
                    ? kcSecondaryColor
                    : kcPrimaryColor,
              ),
            ),
            backgroundColor:
                optionKey == answeredKey ? kcPrimaryColor : Colors.transparent,
            // backgroundColor: optionKey == answeredKey
            //     ? Colors.orange.shade300
            //     : Colors.blue.shade300,
            // shadowColor: Colors.transparent,
            elevation: 0,
          ),
          child: Html(
            data: """<div>$text</div>""",
            style: {
              "div": Style(
                fontSize: FontSize(fontSize.toDouble()),
                color: optionKey == answeredKey ? Colors.white : Colors.black,
              )
            },
          ),
        ),
      ),
    );
  }
}
