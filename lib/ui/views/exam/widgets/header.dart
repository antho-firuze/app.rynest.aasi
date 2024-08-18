import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';
import '../exam_viewmodel.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.model,
  });

  final ExamViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenProp(context, s: 50, m: 50, l: 65),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: screenProp(context, s: 85, m: 85, l: 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.questionsInfo, // '1 / 70',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenProp(context, s: 16, m: 16, l: 19),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  vSpace(5),
                  Text(
                    model.currTime,
                    style: bodyStyle(context).copyWith(
                      fontSize: screenProp(context, s: 13, m: 16, l: 19),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/ic_bismillah.png',
              height: screenProp(context, s: 35, m: 35, l: 65),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: screenProp(context, s: 90, m: 90, l: 120),
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.timerInfo,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: screenProp(context, s: 16, m: 16, l: 19),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: Colors.red[400]),
                  ),
                  vSpace(5),
                  Text(
                    model.currDate,
                    style: bodyStyle(context).copyWith(
                      fontSize: screenProp(context, s: 13, m: 16, l: 19),
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
