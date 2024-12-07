import 'dart:developer';

import 'package:app.rynest.aasi/common/exceptions/warning_exeption.dart';
import 'package:app.rynest.aasi/common/widgets/custom_avatar.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/datetime_utils.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamScheduleView extends ConsumerWidget {
  const ExamScheduleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stage = ref.watch(examStageProvider);
    final profile = ref.watch(profileProvider);
    final examSchedule = ref.watch(examScheduleProvider);
    final examCategory = examSchedule?.category;

    log(stage.toString());

    if ([ExamStage.notRegistered, ExamStage.cancel].contains(stage)) {
      return MyUI(
        child: Scaffold(
          appBar: AppBar(title: const Text('Jadwal Ujian')),
          body: RefreshIndicator(
            onRefresh: () async => await ref.read(examCtrlProvider).fetchSchedule(),
            child: ListView(
              children: [
                5.height,
                const LogoArtWork(
                  child: LogoApp(),
                ),
                10.height,
                const WarningException(
                  title: 'Jadwal ujian Anda belum tersedia.',
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Jadwal & Status Ujian')),
        body: RefreshIndicator(
          onRefresh: () async => await ref.read(examCtrlProvider).fetchSchedule(),
          child: ListView(
            children: [
              5.height,
              LogoArtWork(
                child: CustomAvatar(
                  width: 120,
                  height: 120,
                  image: profile?.photo,
                  initial: profile?.fullName,
                ),
              ),
              10.height,
              CustomCard(
                title: const Text('Profil').tsTitleL().center().clr(oWhite),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Text('Nama Lengkap').tsBodyM().center(),
                          Text(profile?.fullName ?? '').tsTitleL().center(),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('No Identitas').tsBodyM().center(),
                              Text(profile?.cardNo ?? '').tsTitleL().center(),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Code').tsBodyM().center(),
                              Text(profile?.memberId ?? '').tsTitleL().center(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Text('Perusahaan').tsBodyM().center(),
                          Text(profile?.company?.name ?? '').tsTitleL().center(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.height,
              CustomCard(
                title: const Text('Jadwal & Status Ujian').tsTitleL().center().clr(oWhite),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Text('Kategori').tsBodyM().center(),
                          Text(examCategory?.name ?? '').tsTitleL().center(),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('Sesi').tsBodyM().center(),
                              Text(examSchedule?.name ?? '').tsTitleL().center(),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Durasi').tsBodyM().center(),
                              Text("${examCategory?.duration} menit").tsTitleL().center(),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Minimal Point').tsBodyM().center(),
                              Text("${examCategory?.passedGrade}%").tsTitleL().center(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('Tanggal mulai').tsBodyM().center(),
                              Text(examSchedule!.openRegistration!.custom('E, d MMM yyyy - HH:mm')).tsTitleM().center(),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Tanggal berakhir').tsBodyM().center(),
                              Text(examSchedule.closeRegistration!.custom('E, d MMM yyyy - HH:mm')).tsTitleM().center(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Text('Status').tsBodyM().center(),
                          Text(ref.watch(examStatusProvider)).tsTitleL().center(),
                        ],
                      ),
                    ),
                  ],
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
