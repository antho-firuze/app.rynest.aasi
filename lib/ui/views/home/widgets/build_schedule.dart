import 'package:app.rynest.aasi/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/logos.dart';
import '../../../shared/widgets/text_field_mee.dart';
import '../home_viewmodel.dart';

class BuildSchedule extends StatelessWidget {
  const BuildSchedule({super.key, required this.model});

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    var statusText = model.profile?.status == 2
        ? 'CANCEL'
        : model.examService.exam?.examCompleted == null
            ? 'READY'
            : model.examService.exam?.examCompleted == true
                ? 'COMPLETED'
                : 'STILL ON GOING';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              vSpaceSmall,
              TextFieldMee(
                caption: 'Tanggal Mulai',
                value: model.schedule!.openRegistration == null
                    ? '-'
                    : model.schedule!.openRegistration!
                        .format('dd MMM yyyy • HH:mm'),
              ),
              vSpaceXSmall,
              TextFieldMee(
                caption: 'Tanggal Berakhir',
                value: model.schedule!.closeRegistration == null
                    ? '-'
                    : model.schedule!.closeRegistration!
                        .format('dd MMM yyyy • HH:mm'),
              ),
              vSpaceXSmall,
              TextFieldMee(
                caption: 'Durasi Ujian',
                value: '${model.schedule!.duration?.toString()} Menit',
              ),
              vSpaceSmall,
              TextFieldMee(
                caption: 'Status Ujian',
                value: statusText,
                valueColor: statusText == 'READY'
                    ? Colors.green
                    : statusText == 'COMPLETED'
                        ? Colors.blue
                        : statusText == 'STILL ON GOING'
                            ? Colors.orange
                            : Colors.red,
              ),
              if (model.examService.exam?.examStart != null) ...[
                vSpaceXSmall,
                TextFieldMee(
                  caption: 'Mulai Ujian',
                  value: model.examService.exam!.examStart!
                      .format('dd MMM yyyy • HH:mm'),
                ),
              ],
              if (model.examService.exam?.examEnd != null) ...[
                vSpaceXSmall,
                TextFieldMee(
                  caption: 'Selesai Ujian',
                  value: model.examService.exam!.examEnd!
                      .format('dd MMM yyyy • HH:mm'),
                ),
              ],
            ],
          ),
        ),
        const LogoSignature(),
        vSpaceSmall,
      ],
    );
  }
}
