import 'package:app.rynest.aasi/common/controller/location_ctrl.dart';
import 'package:app.rynest.aasi/common/exceptions/warning_exeption.dart';
import 'package:app.rynest.aasi/common/exceptions/warning_layout.dart';
import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/common/widgets/custom_image.dart';
import 'package:app.rynest.aasi/common/widgets/forms/field_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/core/app_string.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/camera_exam_start_view.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/camera_idcard_view.dart';
import 'package:app.rynest.aasi/features/user/views/camera_selfie_view.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ExamStageStart extends ConsumerWidget {
  const ExamStageStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    bool? photo = profile?.photo != null;
    bool? idcard = profile?.photoIdCard != null;

    if (!ref.watch(isGpsEnableProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Ujian')),
          body: ListView(
            children: [
              WarningLayout(
                title: PermissionString2.gpsDeviceTitle,
                subTitle: PermissionString2.gpsDeviceSubTitle,
                child: ElevatedButton(
                  onPressed: () async => await ref.read(locationCtrlProvider).openLocationSettings(),
                  child: Text('Aktifkan GPS'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!ref.watch(allowGpsProvider)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: Text('Ujian')),
          body: ListView(
            children: [
              WarningLayout(
                title: PermissionString2.gpsPermissionTitle,
                subTitle: PermissionString2.gpsPermissionSubTitle,
                child: ElevatedButton(
                  onPressed: () async => await ref.read(locationCtrlProvider).requestGpsPermission(),
                  child: Text('Izinkan Akses'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ujian'),
          actions: [
            TextButton(
              onPressed: () async => ref.refresh(fetchExamScheduleProvider),
              child: Text('Refresh').clr(oWhite),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async => ref.refresh(fetchExamScheduleProvider),
          child: ref.watch(fetchExamScheduleProvider).when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  if (data == null) {
                    return WarningException(
                      title: 'Gagal memuat jadwal ujian !',
                      onRefresh: () => ref.refresh(fetchExamScheduleProvider),
                    );
                  }

                  final examSchedule = data;
                  bool photoExamStart = examSchedule.photoStart;

                  return ListView(
                    children: [
                      5.height,
                      const LogoArtWork(child: LogoApp()),
                      5.height,
                      if (photo == false || idcard == false || photoExamStart == false) ...[
                        CustomCard(
                          title: const Text('Persiapan').tsTitleL().center().clr(oWhite),
                          subTitle:
                              const Text('Mohon lengkapi terlebih dahulu point-point berikut ini:').tsBodyM().center(),
                          child: Column(
                            children: [
                              if (photo == false)
                                ListTile(
                                  leading: const Icon(SuperIcons.mg_photo_album_2_line),
                                  title: const Text('Foto Profil').bold(),
                                  subtitle: const Text('Harap Foto Profil di update terlebih dahulu.'),
                                  trailing: Icon(photo == true ? SuperIcons.bx_check : SuperIcons.cl_warning_line,
                                      color: photo == true ? oGreen : oRed),
                                  onTap: photo == true
                                      ? null
                                      : () async => await context.goto(page: const CameraSelfieView()),
                                ),
                              if (idcard == false)
                                ListTile(
                                  leading: const Icon(SuperIcons.mg_IDcard_line),
                                  title: const Text('Foto KTP').bold(),
                                  subtitle: const Text('Harap Foto KTP di update terlebih dahulu.'),
                                  trailing: Icon(idcard == true ? SuperIcons.bx_check : SuperIcons.cl_warning_line,
                                      color: idcard == true ? oGreen : oRed),
                                  onTap: idcard == true
                                      ? null
                                      : () async => await context.goto(page: const CameraIdCardView()),
                                ),
                              ListTile(
                                leading: const Icon(SuperIcons.mg_IDcard_line),
                                title: const Text('Foto Mulai Ujian').bold(),
                                subtitle: const Text('Silahkan anda ambil foto sebelum memulai ujian.'),
                                trailing: Icon(
                                    photoExamStart == true ? SuperIcons.bx_check : SuperIcons.cl_warning_line,
                                    color: photoExamStart == true ? oGreen : oRed),
                                onTap: photoExamStart == true
                                    ? null
                                    : () async => await context.goto(page: const CameraExamStartView()),
                              ),
                            ],
                          ),
                        ),
                        20.height,
                      ] else ...[
                        CustomCard(
                          title: const Text("Mekanisme / Aturan Ujian").tsTitleL().center().clr(oWhite),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              spacing: 10,
                              children: [
                                FieldList(
                                  caption: const Text('Waktu Ujian'),
                                  value: Text("${examSchedule.category?.duration} menit").bold().clr(oBlack),
                                ),
                                FieldList(
                                  caption: const Text('Cek Score'),
                                  value: const Text("2 kali kesempatan.").bold().clr(oBlack),
                                ),
                                FieldList(
                                  caption: const Text('Jumlah soal'),
                                  value: Text("${examSchedule.category?.numOfQuestion} butir.").bold().clr(oBlack),
                                ),
                                FieldList(
                                  caption: const Text('Minimal Point'),
                                  value: Text(
                                          "${examSchedule.category?.minPoint} atau ${examSchedule.category?.passedGrade}% jawaban benar dari Jumlah Soal.")
                                      .bold(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        20.height,
                        CustomCard(
                          title: const Text("Do'a").tsTitleL().center().clr(oWhite),
                          subTitle: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: examSchedule.state == 'IN-SCHEDULE'
                                ? const Text(
                                        'Sebelum memulai ujian diharapkan berdoa terlebih dahulu, dan tidak lupa membaca ')
                                    .tsBodyM()
                                    .center()
                                : const Text('Sebelum melanjutkan ujian diharapkan berdoa, dan tidak lupa membaca ')
                                    .tsBodyM()
                                    .center(),
                          ),
                          child: Column(
                            children: [
                              10.height,
                              const SizedBox(
                                width: 250,
                                child: CustomImage(src: 'assets/images/ic_bismillah.png'),
                              ),
                              20.height,
                            ],
                          ),
                        ),
                        20.height,
                      ],
                      Center(
                        child: CustomButton(
                          onPressed: (photo == true && idcard == true && photoExamStart == true)
                              ? () async => await ref.read(examCtrlProvider).callStart()
                              : null,
                          child: examSchedule.state == 'IN-SCHEDULE'
                              ? const Text('Mulai Ujian')
                              : const Text('Lanjutkan Ujian'),
                        ),
                      ),
                      // Center(child: Text("${ref.read(deviceIdProvider)} - ${ref.read(deviceNameProvider)}")),
                      // Center(child: Text(ref.watch(wifiIPv4Provider))),
                      // Center(child: Text(ref.watch(locationProvider))),
                      60.height,
                    ],
                  );
                },
                error: (error, stackTrace) => Container(),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
        ),
      ),
    );
  }
}
