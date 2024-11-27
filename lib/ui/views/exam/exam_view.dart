import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/exam/exam_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/widgets/logos.dart';
import 'widgets/build_question.dart';
import 'widgets/exam_navigator.dart';
import 'widgets/header.dart';

ScrollController _scrollController = ScrollController();

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      // onWillPop: () async {
      //   return false;
      // },
      child: ViewModelBuilder<ExamViewModel>.reactive(
        viewModelBuilder: () => ExamViewModel(),
        builder: (context, model, child) {
          return Container(
            decoration: bgBDecoration,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: LogoArtWork(
                        color: kcPrimaryColor,
                        width: screenWidth(context),
                      ),
                    ),
                    Body(model: model),
                    ExamNavigator(model: model),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.model,
  });

  final ExamViewModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          vSpaceSmall,
          Header(model: model),
          vSpaceXSmall,
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: model.question == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: BuildQuestion(
                          fontSize: model.fontSize,
                          question: model.question,
                          options: model.question!.options!,
                          model: model,
                          onImageTap: (url) => model.showImage(url),
                        ),
                      ),
              ),
            ),
          ),
          vSpaceSmall,
        ],
      ),
    );
  }
}
