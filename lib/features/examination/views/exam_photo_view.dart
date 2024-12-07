import 'package:app.rynest.aasi/common/widgets/forms/group_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/model/exam_photo.dart';
import 'package:app.rynest.aasi/features/examination/views/widgets/image_card.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/orientation_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExamPhotoView extends ConsumerWidget {
  const ExamPhotoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photos = ref.watch(examPhotosProvider);

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Foto Ujian')),
        body: RefreshIndicator(
          onRefresh: () async => await ref.read(examCtrlProvider).fetchPhotos(),
          child: context.isLandscape() == false ? viewPortrait(photos) : viewLandscape(context, photos),
        ),
      ),
    );
  }

  Widget viewLandscape(BuildContext context, ExamPhotos? photos) {
    return ListView(
      children: [
        5.height,
        const LogoArtWork(child: LogoApp()),
        10.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text('Foto mulai ujian').bold(),
                10.height,
                SizedBox(
                  width: context.screenWidthRatio(1, .4),
                  height: 250,
                  child: ImageCard(image: photos?.examStart),
                ),
              ],
            ),
            Column(
              children: [
                const Text('Foto selesai ujian').bold(),
                10.height,
                SizedBox(
                  width: context.screenWidthRatio(1, .4),
                  height: 250,
                  child: ImageCard(image: photos?.examFinish),
                ),
              ],
            ),
          ],
        ),
        20.height,
      ],
    );
  }

  Widget viewPortrait(ExamPhotos? photos) {
    return ListView(
      children: [
        5.height,
        const LogoArtWork(child: LogoApp()),
        10.height,
        GroupList(
          title: 'Foto mulai ujian',
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: ImageCard(image: photos?.examStart),
            ),
          ],
        ),
        20.height,
        GroupList(
          title: 'Foto selesai ujian',
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: ImageCard(image: photos?.examFinish),
            ),
          ],
        ),
        20.height,
      ],
    );
  }
}
