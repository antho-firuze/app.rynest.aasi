import 'package:app.rynest.aasi/common/widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/common/widgets/forms/field_list.dart';
import 'package:app.rynest.aasi/common/widgets/forms/ordered_list.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/model/exam.dart';
import 'package:app.rynest.aasi/utils/datetime_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:super_icons/super_icons.dart';

class SectionResult extends StatelessWidget {
  const SectionResult({
    super.key,
    this.exam,
    this.onRefresh,
  });

  final Exam? exam;
  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    if (exam == null) {
      return CustomCard(
        title: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hasil Ujian').tsTitleL().clr(oWhite),
              CustomIcon(
                SuperIcons.hr_information_circle,
                foregroundColor: oWhite,
                backgroundColor: oRed,
              ),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.height,
            Text('Maaf terkendala koneksi, silahkan anda coba kembali !'),
            20.height,
            CustomButton(onPressed: onRefresh, child: Text('Refresh')),
            10.height,
          ],
        ),
      );
    }

    final score = exam!.score!;
    final passed = exam!.passedGrade!;

    Color? color = score < passed ? Colors.red[400]! : primaryLight;

    return CustomCard(
      color: color,
      title: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Hasil Ujian').tsTitleL().clr(oWhite),
            CustomIcon(
              SuperIcons.is_information_outline,
              foregroundColor: oWhite,
              onPressed: () async => await showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                ),
                builder: (context) => CustomBottomSheet(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CloseButton(onPressed: () => context.pop()),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                              child: Text('Detail Ujian').bold(),
                            ),
                          ),
                        ],
                      ),
                      divider(),
                      20.height,
                      CustomCard(
                        title: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text('Detail Ujian').tsTitleL().clr(oWhite),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            spacing: 10,
                            children: [
                              FieldList(
                                  caption: Text('Mulai Ujian'),
                                  value: Text(exam?.startAt?.custom('EEEE, d MMM yyyy - HH:mm') ?? '-')
                                      .bold()
                                      .clr(oBlack)),
                              FieldList(
                                  caption: Text('Selesai Ujian'),
                                  value: Text(exam?.finishAt?.custom('EEEE, d MMM yyyy - HH:mm') ?? '-')
                                      .bold()
                                      .clr(oBlack)),
                              FieldList(
                                  caption: Text('Lama Mengerjakan'),
                                  value: Text(exam?.realDuration ?? '-').bold().clr(oBlack)),
                              FieldList(
                                  caption: Text('Cek Score'),
                                  value: Text("${exam?.checkScore} kali").bold().clr(oBlack)),
                              FieldList(
                                  caption: Text('Restart'), value: Text("${exam?.restart} kali").bold().clr(oBlack)),
                              FieldList(caption: Text('Device'), value: Text(exam?.device ?? '-').bold().clr(oBlack)),
                              FieldList(caption: Text('Lokasi'), value: Text(exam?.location ?? '-').bold().clr(oBlack)),
                            ],
                          ),
                        ),
                      ),
                      20.height,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: Column(
        spacing: 10,
        children: [
          5.height,
          // LULUS / GAGAL
          Text("${exam?.desc1}").tsHeadlineDS().center().bold(),
          // KETERANGAN
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Keterangan : '),
                      divider(),
                      OrderedList(
                        type: OLType.bullet,
                        children: [
                          Text("${exam?.desc2}"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
