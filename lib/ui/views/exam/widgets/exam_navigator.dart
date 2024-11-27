import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../services/exam_service.dart';
import '../../../shared/colors.dart';
import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/logos.dart';
import '../../../shared/widgets/show_bottom_slide.dart';
import '../../../shared/widgets/text_field_mee.dart';
import '../../startup/widgets/logo_aasi.dart';
import '../exam_viewmodel.dart';
import 'icon_button_mee.dart';
import 'text_button_mee.dart';

class ExamNavigator extends StatelessWidget {
  const ExamNavigator({
    super.key,
    required this.model,
  });

  final ExamViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // if (model.isMinimumAnswered)
        AnimatedPositioned(
          left: model.showNavigator ? 10 : -80,
          bottom: 90,
          duration: const Duration(milliseconds: 700),
          child: AnimatedOpacity(
            opacity: model.isMinimumAnswered ? 1 : 0,
            duration: const Duration(milliseconds: 700),
            child: Visibility(
              visible: model.isMinimumAnswered,
              child: TextButtonMee(
                text: 'Selesai',
                color: Colors.red,
                onPressed: () async => await model.onPressedFinish(),
              ),
            ),
          ),
        ),
        // if (model.isMinimumAnswered)
        AnimatedPositioned(
          right: model.showNavigator ? 10 : -120,
          bottom: 90,
          duration: const Duration(milliseconds: 700),
          child: AnimatedOpacity(
            opacity: model.isMinimumAnswered ? 1 : 0,
            duration: const Duration(milliseconds: 700),
            child: Visibility(
              visible: model.isMinimumAnswered,
              child: TextButtonMee(
                text: 'Cek Score (${model.exam?.numOfRepeat ?? 0})',
                onPressed: () async => await model.onPressedCheckScore(),
              ),
            ),
          ),
        ),
        // LEFT
        AnimatedPositioned(
          left: model.showNavigator ? 15 : -60,
          bottom: 10,
          duration: const Duration(milliseconds: 700),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: model.showInfo ? (model.showNavigator ? 1 : 0) : 0,
                child: Text(
                  'First/Prev',
                  style: bodyStyle(context),
                ),
              ),
              vSpace(5),
              IconButtonMee(
                size: 60,
                color: Colors.blue,
                icon: const Icon(FontAwesomeIcons.chevronLeft),
                onPressed: () async => await model.questionsMove(Go.previous),
                onLongPressed: () async => await model.questionsMove(Go.first),
              ),
            ],
          ),
        ),
        // SHOW INFO
        AnimatedPositioned(
          left: (screenWidth(context) / 3) - 20,
          bottom: model.showNavigator ? 10 : -40,
          duration: const Duration(milliseconds: 700),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: model.showInfo ? (model.showNavigator ? 1 : 0) : 0,
                child: Text(
                  'Info',
                  style: bodyStyle(context),
                ),
              ),
              vSpace(5),
              IconButtonMee(
                size: 40,
                color: Colors.green.shade400,
                icon: const Icon(
                  FontAwesomeIcons.info,
                  size: 15,
                ),
                onPressed: () async => showBottomSlide(
                  context: context,
                  title: 'INFORMASI SOAL',
                  maxSize: .4,
                  movable: true,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            vSpaceSmall,
                            TextFieldMee(
                              caption: 'Pertanyaan Dijawab',
                              value:
                                  '${model.examService.exam?.numAnsweredQuestion}',
                            ),
                            vSpace(5),
                            TextFieldMee(
                              caption: 'Pertanyaan Belum Dijawab',
                              value:
                                  '${model.examService.exam?.numRemainQuestion}',
                            ),
                            // Text('${model.examService.exam?.numAnsweredQuestion}'),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Center(
                            child: LogoArtWork(
                              color: kcPrimaryColor,
                              width: screenWidth(context),
                            ),
                          ),
                          const Positioned.fill(
                            child: Align(
                                alignment: Alignment.center, child: LogoAASI()),
                          ),
                        ],
                      ),
                      vSpaceSmall,
                    ],
                  ),
                ),
                // onPressed: () {
                //   model.showInfo = !model.showInfo;
                //   model.notifyListeners();
                // },
              ),
            ],
          ),
        ),
        // SHOW / HIDE
        AnimatedPositioned(
          right: (screenWidth(context) / 2) - 15,
          bottom: 10,
          duration: const Duration(milliseconds: 700),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: model.showInfo ? (model.showNavigator ? 1 : 0) : 0,
                child: Text(
                  model.showNavigator ? 'Hide' : 'Show',
                  style: bodyStyle(context),
                ),
              ),
              vSpace(5),
              IconButtonMee(
                size: 30,
                color: Colors.orange,
                icon: Icon(
                  model.showNavigator
                      ? FontAwesomeIcons.chevronDown
                      : FontAwesomeIcons.chevronUp,
                  size: 15,
                ),
                onPressed: () {
                  model.showNavigator = !model.showNavigator;
                  model.notifyListeners();
                },
              ),
            ],
          ),
        ),
        // SETTINGS
        AnimatedPositioned(
          right: (screenWidth(context) / 3) - 20,
          bottom: model.showNavigator ? 10 : -40,
          duration: const Duration(milliseconds: 700),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: model.showInfo ? (model.showNavigator ? 1 : 0) : 0,
                child: Text(
                  'Settings',
                  style: bodyStyle(context),
                ),
              ),
              vSpace(5),
              IconButtonMee(
                size: 40,
                color: Colors.green.shade400,
                icon: const Icon(
                  FontAwesomeIcons.gear,
                  size: 15,
                ),
                onPressed: () async => await model.showSetting(),
              ),
            ],
          ),
        ),
        // RIGHT
        AnimatedPositioned(
          right: model.showNavigator ? 15 : -60,
          bottom: 10,
          duration: const Duration(milliseconds: 700),
          child: Column(
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 700),
                opacity: model.showInfo ? (model.showNavigator ? 1 : 0) : 0,
                child: Text(
                  'Next/Last',
                  style: bodyStyle(context),
                ),
              ),
              vSpace(5),
              IconButtonMee(
                size: 60,
                color: Colors.blue,
                iconData: FontAwesomeIcons.chevronRight,
                onPressed: () async => await model.questionsMove(Go.next),
                onLongPressed: () async => await model.questionsMove(Go.last),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
