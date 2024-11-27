import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/photos/photo_exam_viewmodel.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/button_mee.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/appbar_mee.dart';
import '../../shared/colors.dart';
import 'widgets/image_card.dart';

class PhotoExamView extends StatelessWidget {
  const PhotoExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotoExamViewModel>.reactive(
      viewModelBuilder: () => PhotoExamViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: Scaffold(
          appBar: const AppBarMee(
            title: 'Photo Ujian',
            titleColor: kcPrimaryColor,
            backgroundColor: Colors.transparent,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async => await model.refresh(),
                child: Body(model: model),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.model,
  });

  final PhotoExamViewModel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // const LogoSignature(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenProp(context, s: 180, m: 180, l: 280),
                          height: screenProp(context, s: 220, m: 220, l: 320),
                          child: ImageCard(
                            image: model.photoExamStart,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ButtonMee(title: 'Mulai Ujian', onPressed: () {})
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenProp(context, s: 180, m: 180, l: 280),
                          height: screenProp(context, s: 220, m: 220, l: 320),
                          child: ImageCard(
                            image: model.photoExamFinish,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ButtonMee(title: 'Selesai Ujian', onPressed: () {})
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
