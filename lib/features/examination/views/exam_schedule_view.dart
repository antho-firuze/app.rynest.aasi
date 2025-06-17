import 'package:app.rynest.aasi/common/exceptions/warning_exeption.dart';
import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/widgets/custom_avatar.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/common/widgets/forms/field_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/common/widgets/skelton.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/datetime_utils.dart';
import 'package:app.rynest.aasi/utils/download_utils.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/string_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamScheduleView extends ConsumerWidget {
  const ExamScheduleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final fetchPhotoSelfie = ref.watch(fetchImageProvider(Reqs(url: profile?.photo, fileKey: "${profile?.id}-selfie")));

    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal & Status Ujian'),
          actions: [
            TextButton(
              onPressed: () async => ref.refresh(fetchExamScheduleProvider),
              child: Text('Refresh').clr(oWhite),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async => ref.refresh(fetchExamScheduleProvider),
          child: ListView(
            children: [
              5.height,
              LogoArtWork(
                child: fetchPhotoSelfie.when(
                  skipLoadingOnRefresh: false,
                  data: (data) => CustomAvatar(
                    image: data,
                    initial: profile?.fullName?.toInitial(),
                    width: 120,
                    height: 120,
                  ),
                  error: (error, stackTrace) => CustomAvatar(
                    initial: profile?.fullName?.toInitial(),
                    width: 120,
                    height: 120,
                  ),
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              ),
              10.height,
              CustomCard(
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text('Profil').tsTitleL().clr(oWhite),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    spacing: 10,
                    children: [
                      FieldList(caption: Text('Nama Lengkap'), value: Text(profile?.fullName ?? '').bold().clr(oBlack)),
                      FieldList(caption: Text('No Identitas'), value: Text(profile?.cardNo ?? '').bold().clr(oBlack)),
                      FieldList(caption: Text('Code'), value: Text(profile?.memberId ?? '').bold().clr(oBlack)),
                      FieldList(
                          caption: Text('Perusahaan'), value: Text(profile?.company?.name ?? '').bold().clr(oBlack)),
                    ],
                  ),
                ),
              ),
              20.height,
              CustomCard(
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text('Jadwal & Status Ujian').tsTitleL().clr(oWhite),
                ),
                child: ref.watch(fetchExamScheduleProvider).when(
                      skipLoadingOnRefresh: false,
                      data: (data) {
                        if (data == null) {
                          return WarningException(title: 'Jadwal ujian Anda belum tersedia.');
                        }

                        final examSchedule = data;
                        final examCategory = examSchedule.category;

                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            spacing: 10,
                            children: [
                              FieldList(
                                  caption: Text('Kategori'), value: Text(examCategory?.name ?? '').bold().clr(oBlack)),
                              FieldList(caption: Text('Sesi'), value: Text(examSchedule.name ?? '').bold().clr(oBlack)),
                              FieldList(
                                  caption: Text('Durasi'),
                                  value: Text("${examCategory?.duration} menit").bold().clr(oBlack)),
                              FieldList(
                                  caption: Text('Nilai Lulus'),
                                  value: Text("${examCategory?.passedGrade}%").bold().clr(oBlack)),
                              5.height,
                              FieldList(
                                  caption: Text('Tanggal Mulai'),
                                  value: Text(examSchedule.openRegistration!.custom('EEEE, d MMM yyyy - HH:mm'))
                                      .bold()
                                      .clr(oBlack)),
                              FieldList(
                                  caption: Text('Tanggal Berakhir'),
                                  value: Text(examSchedule.closeRegistration!.custom('EEEE, d MMM yyyy - HH:mm'))
                                      .bold()
                                      .clr(oBlack)),
                              5.height,
                              FieldList(
                                  caption: Text('Status Ujian'),
                                  value: Text("${examSchedule.state}").bold().clr(oBlack)),
                            ],
                          ),
                        );
                      },
                      error: (error, stackTrace) => Container(),
                      loading: () => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(spacing: 20, children: List.generate(3, (index) => Skelton(height: 20))),
                      ),
                    ),
              ),
              20.height,
              Column(
                children: [
                  const Text('Powered By:').tsCaption(),
                  const LogoApp(width: 100),
                ],
              ),
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
