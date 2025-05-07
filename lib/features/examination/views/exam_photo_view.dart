import 'package:app.rynest.aasi/common/exceptions/warning_exeption.dart';
import 'package:app.rynest.aasi/common/widgets/forms/group_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/image_card.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamPhotoView extends ConsumerWidget {
  const ExamPhotoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Foto Ujian')),
        body: RefreshIndicator(
          onRefresh: () async => await ref.refresh(fetchExamPhotosProvider),
          // child: context.isLandscape() == false ? viewPortrait(photos) : viewLandscape(context, photos),
          child: ListView(
            children: [
              5.height,
              const LogoArtWork(child: LogoApp()),
              5.height,
              ref.watch(fetchExamPhotosProvider).when(
                    skipLoadingOnRefresh: false,
                    data: (data) {
                      // debugPrint("data: ${data?.length}");
                      // return context.isLandscape() == false ? viewPortrait(data) : viewLandscape(context, data);
                      if (data == null) {
                        return ListView(
                          children: [
                            10.height,
                            const WarningException(title: 'Foto Ujian Anda belum tersedia.'),
                            60.height,
                          ],
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          if (item.type == 'exam_start') {
                            return GroupList(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                child: Text('Foto mulai ujian'),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 250,
                                    child: ImageCard(image: item.imageUrl),
                                  ),
                                ),
                              ],
                            );
                          } else if (item.type == 'exam_finish') {
                            return GroupList(
                              title: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 10),
                                child: Text('Foto selesai ujian'),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 250,
                                    child: ImageCard(image: item.imageUrl),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                        separatorBuilder: (context, index) => 5.height,
                        itemCount: data.length,
                      );
                    },
                    error: (error, stackTrace) => Container(),
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
              60.height,
            ],
          ),
        ),
      ),
    );
  }

  // Widget viewLandscape(BuildContext context, ExamPhoto? photos) {
  //   return ListView(
  //     children: [
  //       5.height,
  //       const LogoArtWork(child: LogoApp()),
  //       10.height,
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Column(
  //             children: [
  //               const Text('Foto mulai ujian').bold(),
  //               10.height,
  //               SizedBox(
  //                 width: context.screenWidthRatio(1, .4),
  //                 height: 250,
  //                 child: ImageCard(image: photos?.examStart),
  //               ),
  //             ],
  //           ),
  //           Column(
  //             children: [
  //               const Text('Foto selesai ujian').bold(),
  //               10.height,
  //               SizedBox(
  //                 width: context.screenWidthRatio(1, .4),
  //                 height: 250,
  //                 child: ImageCard(image: photos?.examFinish),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //       60.height,
  //     ],
  //   );
  // }

  // Widget viewPortrait(ExamPhotos? photos) {
  //   return ListView(
  //     children: [
  //       5.height,
  //       const LogoArtWork(child: LogoApp()),
  //       10.height,
  //       GroupList(
  //         title: Text('Foto mulai ujian'),
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
  //             child: SizedBox(
  //               width: double.infinity,
  //               height: 250,
  //               child: ImageCard(image: photos?.examStart),
  //             ),
  //           ),
  //         ],
  //       ),
  //       20.height,
  //       GroupList(
  //         title: Text('Foto selesai ujian'),
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
  //             child: SizedBox(
  //               width: double.infinity,
  //               height: 250,
  //               child: ImageCard(image: photos?.examFinish),
  //             ),
  //           ),
  //         ],
  //       ),
  //       60.height,
  //     ],
  //   );
  // }
}
