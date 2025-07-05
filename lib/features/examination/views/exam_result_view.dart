import 'package:app.rynest.aasi/common/exceptions/warning_exeption.dart';
import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/widgets/custom_avatar.dart';
import 'package:app.rynest.aasi/common/widgets/custom_card.dart';
import 'package:app.rynest.aasi/common/widgets/forms/field_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/camera_exam_finish_view.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/section_point.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/section_result.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/utils/download_utils.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/string_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ExamResultView extends ConsumerWidget {
  const ExamResultView({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final fetchPhotoSelfie = ref.watch(fetchImageProvider(Reqs(url: profile?.photo, fileKey: "${profile?.id}-selfie")));

    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          title: Text(type == 1 ? 'Hasil Ujian Sementara' : 'Hasil Ujian'),
          actions: [
            TextButton(
              onPressed: () async {
                await ref.read(downloadUtilsProvider).deleteImageOndisk("${profile?.id}-selfie");
                return ref.refresh(fetchExamResultProvider);
              },
              child: Text('Refresh').clr(oWhite),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await ref.read(downloadUtilsProvider).deleteImageOndisk("${profile?.id}-selfie");
            return ref.refresh(fetchExamResultProvider);
          },
          child: ref.watch(fetchExamResultProvider).when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  if (data == null) {
                    return Column(
                      children: [
                        5.height,
                        const LogoArtWork(child: LogoApp()),
                        10.height,
                        const WarningException(title: 'Hasil ujian Anda belum tersedia.'),
                      ],
                    );
                  }

                  final exam = data;

                  if (exam.state == 'COMPLETED' && exam.photoFinish == false) {
                    return ListView(
                      children: [
                        5.height,
                        const LogoArtWork(child: LogoApp()),
                        10.height,
                        CustomCard(
                          title: const Text('Pasca Ujian').tsTitleL().center().clr(oWhite),
                          subTitle: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                                    'Mohon lengkapi terlebih dahulu data dibawah ini, sebagai syarat untuk dapat melihat Hasil Ujian :')
                                .tsBodyM()
                                .center(),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(SuperIcons.mg_IDcard_line),
                                title: const Text('Foto Selesai Ujian').bold(),
                                subtitle: const Text('Silahkan anda ambil foto setelah ujian.'),
                                trailing: Icon(
                                    exam.photoFinish == true ? SuperIcons.bx_check : SuperIcons.cl_warning_line,
                                    color: exam.photoFinish == true ? oGreen : oRed),
                                onTap: exam.photoFinish == true
                                    ? null
                                    : () async => await context.goto(page: const CameraExamFinishView()),
                              ),
                            ],
                          ),
                        ),
                        60.height,
                      ],
                    );
                  }

                  return ListView(
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
                              FieldList(
                                caption: Text('Nama Lengkap'),
                                value: Text(profile?.fullName ?? '').bold().clr(oBlack),
                              ),
                              FieldList(
                                caption: Text('No Identitas'),
                                value: Text(profile?.cardNo ?? '').bold().clr(oBlack),
                              ),
                              FieldList(
                                caption: Text('Code'),
                                value: Text(profile?.memberId ?? '').bold().clr(oBlack),
                              ),
                              FieldList(
                                caption: Text('Perusahaan'),
                                value: Text(profile?.company?.name ?? '').bold().clr(oBlack),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.height,
                      // SECTION POINT
                      SectionPoint(
                        numOfQuestion: exam.questionCount ?? 60,
                        numAnsweredQuestion: exam.answeredCount ?? 0,
                        numOfCorrect: exam.correctCount ?? 0,
                        numOfWrong: exam.wrongCount ?? 0,
                      ),
                      20.height,
                      if (exam.state?.toUpperCase() == 'COMPLETED') ...[
                        SectionResult(
                          exam: exam,
                          onRefresh: () async {},
                        ),
                      ],
                      20.height,
                      Column(
                        children: [
                          const Text('Powered By:').tsCaption(),
                          const LogoApp(width: 100),
                        ],
                      ),
                      60.height,
                    ],
                  );
                },
                error: (error, stackTrace) => Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      5.height,
                      const LogoArtWork(child: LogoApp()),
                      10.height,
                      WarningException(
                        title: 'Hasil ujian Anda belum tersedia.',
                        subTitle: error.toString(),
                        onRefresh: () async => ref.refresh(fetchExamResultProvider),
                      ),
                    ],
                  ),
                ),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
        ),
      ),
    );
  }
}
