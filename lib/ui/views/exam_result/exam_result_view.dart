import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/exam_result/exam_result_viewmodel.dart';
import 'package:app.rynest.aasi/ui/views/exam_result/widgets/section_point.dart';
import 'package:app.rynest.aasi/ui/views/exam_result/widgets/section_result.dart';
import 'package:app.rynest.aasi/ui/views/exam_result/widgets/section_profile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../../../helpers/F.dart';
import '../../shared/appbar_mee.dart';
import 'widgets/navigator_button.dart';

class ExamResultView extends StatelessWidget {
  const ExamResultView({super.key, this.type});

  final String? type;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        Navigator.pop(context);
      },
      // onWillPop: () async {
      //   return true;
      // },
      child: ViewModelBuilder<ExamResultViewModel>.reactive(
        viewModelBuilder: () => ExamResultViewModel(),
        // onModelReady: (model) => model.type = type,
        builder: (context, model, child) => Container(
          decoration: bgBDecoration,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: Scaffold(
              appBar: AppBarMee(
                title: 'Hasil Ujian',
                centerTitle: true,
                showBack:
                    !(type == 'repeat' && model.exam!.examCompleted == false),
                onBackPressed: () => F.back(),
                titleColor: kcPrimaryColor,
                backgroundColor: Colors.transparent,
              ),
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () async => await model.refresh(),
                    child: Body(
                      model: model,
                      type: type,
                    ),
                  ),
                ],
              ),
            ),
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
    this.type,
  });

  final ExamResultViewModel model;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        vSpaceSmall,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectionProfile(
            name: model.profile?.fullName!,
            idCardNo: model.profile?.cardNo!.formatCardNumber(),
            photoUrl: model.photo,
            qrCode:
                'https://lsp-ps.id/check_hasil_ujian/validate/${model.profile?.idUser}',
          ),
        ),
        vSpaceSmall,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectionPoint(
            numOfQuestion: model.exam?.numOfQuestion ?? 0,
            numOfCorrect: model.exam?.numOfCorrect ?? 0,
          ),
        ),
        vSpaceSmall,
        if (type != 'repeat' && model.exam?.examCompleted == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SectionResult(score: model.exam?.score ?? 0),
          ),
        if (type == 'repeat' && model.exam!.examCompleted == false)
          NavigatorButton(
            onPressedBack: () => F.back(result: false),
            onPressedFinish: () => F.back(result: true),
          ),
      ],
    );
  }
}
