import 'dart:developer';

import 'package:app.rynest.aasi/common/widgets/forms/group_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/features/user/model/profile.dart';
import 'package:app.rynest.aasi/features/user/views/photo/widgets/image_card.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/orientation_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoExamView extends ConsumerWidget {
  const PhotoExamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Foto Ujian')),
        body: RefreshIndicator(
          onRefresh: () async {
            log("$profile");
          },
          child: context.isLandscape() == false ? viewPortrait(profile) : viewLandscape(context, profile),
        ),
      ),
    );
  }

  Widget viewLandscape(BuildContext context, Profile? profile) {
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
                  child: ImageCard(image: profile!.photos?.examStart),
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
                  child: ImageCard(image: profile.photos?.examFinish),
                ),
              ],
            ),
          ],
        ),
        20.height,
      ],
    );
  }

  Widget viewPortrait(Profile? profile) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      // shrinkWrap: true,
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
              child: ImageCard(image: profile!.photos?.examStart),
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
              child: ImageCard(image: profile.photos?.examFinish),
            ),
          ],
        ),
        20.height,
      ],
    );
  }
}
