import 'dart:developer';

import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_avatar.dart';
import 'package:app.rynest.aasi/common/widgets/custom_image.dart';
import 'package:app.rynest.aasi/common/widgets/custom_input.dart';
import 'package:app.rynest.aasi/common/widgets/custom_interactive_viewer.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/camera_selfie_view.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/string_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Profil Member')),
        body: RefreshIndicator(
          onRefresh: () async {
            log("$profile");
          },
          child: ListView(
            children: [
              20.height,
              LogoArtWork(
                child: CustomAvatar(
                  image: profile?.photo,
                  initial: profile?.fullName?.toInitial(),
                  width: 115,
                  height: 115,
                  onTap: () => context.goto(page: CustomInteractiveViewer(child: CustomImage(src: profile?.photo))),
                  onTapUpdate: () async => await context.goto(page: const CameraSelfieView()),
                ),
              ),
              15.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomInput(
                      readOnly: true,
                      hintText: 'Perusahaan',
                      prefixIcon: const Icon(SuperIcons.is_building_outline),
                      initialValue: profile?.company!.name?.toUpperCase(),
                    ),
                    15.height,
                    CustomInput(
                      readOnly: true,
                      hintText: 'Kode Agen',
                      prefixIcon: const Icon(SuperIcons.is_user_tag_outline),
                      initialValue: profile?.memberId,
                    ),
                    15.height,
                    CustomInput(
                      readOnly: true,
                      hintText: 'Nama Lengkap',
                      prefixIcon: const Icon(SuperIcons.is_user_octagon_outline),
                      initialValue: profile?.fullName?.toUpperCase(),
                    ),
                    15.height,
                    CustomInput(
                      readOnly: true,
                      hintText: 'Jenis Kelamin',
                      prefixIcon: const Icon(SuperIcons.bs_gender_ambiguous),
                      initialValue: profile?.gender == 'F' ? 'Wanita' : 'Pria',
                    ),
                    15.height,
                    CustomInput(
                      readOnly: true,
                      hintText: 'Email',
                      prefixIcon: const Icon(SuperIcons.is_card_send_outline),
                      initialValue: profile?.email?.toLowerCase(),
                    ),
                    15.height,
                    CustomInput(
                      readOnly: true,
                      hintText: 'Telepon',
                      prefixIcon: const Icon(SuperIcons.is_call_outline),
                      initialValue: profile?.phone,
                    ),
                    15.height,
                    CustomInput(
                      readOnly: true,
                      hintText: 'Tempat Lahir',
                      prefixIcon: const Icon(SuperIcons.is_location_outline),
                      initialValue: profile?.placeOfBirth,
                    ),
                    15.height,
                    CustomInput(
                      readOnly: true,
                      hintText: 'Tanggal Lahir',
                      prefixIcon: const Icon(SuperIcons.is_calendar_outline),
                      initialValue: profile?.dateOfBirth,
                    ),
                  ],
                ),
              ),
              30.height,
              Center(
                child: CustomButton(
                  color: oRed,
                  child: const Text('Hapus Akun'),
                  onPressed: () async => await ref.read(authCtrlProvider).removeAccount(),
                ),
              ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
