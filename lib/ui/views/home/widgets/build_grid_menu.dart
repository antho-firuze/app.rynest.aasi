import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/menu_card.dart';
import '../../../shared/widgets/show_bottom_slide.dart';
import '../home_viewmodel.dart';
import 'build_schedule.dart';

class BuildGridMenu extends StatelessWidget {
  const BuildGridMenu({
    super.key,
    required this.model,
  });

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      childAspectRatio: screenProp(context, s: .75, m: .85, l: 1),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MenuCard(
          title: 'Ujian',
          imageSrc: 'assets/icons/exam-01.png',
          onTap: () async => await model.onPressedExam(),
        ),
        MenuCard(
          title: 'Hasil Ujian',
          imageSrc: 'assets/icons/exam-result-01.png',
          onTap: () async => await model.onPressedResult(),
        ),
        MenuCard(
          title: 'Jadwal Ujian',
          imageSrc: 'assets/icons/exam-schedule-01.png',
          onTap: () async => await model.onPressedSchedule() == true
              // ? showModalBottomSheet(
              //     context: context,
              //     isScrollControlled: true,
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(5.0),
              //       ),
              //     ),
              //     builder: (context) => BuildSchedule(model: model),
              //   )
              ? showBottomSlide(
                  context: context,
                  title: 'JADWAL UJIAN',
                  maxSize: 0.5,
                  movable: false,
                  child: BuildSchedule(model: model),
                )
              : null,
        ),
      ],
    );
  }
}
