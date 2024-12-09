import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/widgets/image_card.dart';
import 'package:app.rynest.aasi/features/user/views/camera_idcard_view.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhotoCardView extends ConsumerWidget {
  const PhotoCardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    return MyUI(
      onlyPortrait: true,
      child: Scaffold(
        appBar: AppBar(title: const Text('Foto KTP')),
        body: RefreshIndicator(
          onRefresh: () async => await ref.read(profileCtrlProvider).fetchProfile(),
          child: ListView(
            children: [
              5.height,
              const LogoArtWork(child: LogoApp()),
              5.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: ImageCard(image: profile?.photoIdCard),
                ),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: CustomButton(
                    child: profile?.photoIdCard == null ? const Text('Ambil Foto KTP') : const Text('Update Foto KTP'),
                    onPressed: () => context.goto(page: const CameraIdCardView()),
                  ),
                ),
              ),
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
