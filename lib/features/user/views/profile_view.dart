import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/views/about_view.dart';
import 'package:app.rynest.aasi/common/views/contact_us_view.dart';
import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_avatar.dart';
import 'package:app.rynest.aasi/common/widgets/forms/group_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/common/widgets/version_info.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/auth/views/pwd_change_view.dart';
import 'package:app.rynest.aasi/features/auth/views/signin_view.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_wrapper.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/account_view.dart';
import 'package:app.rynest.aasi/features/user/views/photo_card_view.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_photo_view.dart';
import 'package:app.rynest.aasi/utils/download_utils.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/string_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final selfieNameCache = ref.read(profileCtrlProvider).getSelfieNameCache();
    final fetchPhotoSelfie = ref.watch(fetchImageProvider(Reqs(url: profile?.photo, fileKey: selfieNameCache)));

    return MyUI(
      child: ExamWrapper(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Akun Saya"),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () async => ref.refresh(fetchProfileProvider),
                child: Text('Refresh').clr(oWhite),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async => ref.refresh(fetchProfileProvider),
            child: ListView(
              shrinkWrap: true,
              children: [
                if (profile == null) ...[
                  20.height,
                  LogoArtWork(
                    pressedOverflow: true,
                    child: Column(
                      children: [
                        const CustomAvatar(width: 115, height: 115),
                        15.height,
                        const Text("Anda belum login !").tsTitleM().bold(),
                        const Text("Silahkan login terlebih dahulu").tsLabelM(),
                      ],
                    ),
                  ),
                  20.height,
                ] else ...[
                  15.height,
                  LogoArtWork(
                    pressedOverflow: true,
                    child: Column(
                      children: [
                        fetchPhotoSelfie.when(
                          skipLoadingOnRefresh: false,
                          data: (data) => CustomAvatar(
                            image: profile.photo,
                            initial: profile.fullName?.toInitial(),
                            width: 115,
                            height: 115,
                            onTap: () => context.goto(page: const AccountView()),
                          ),
                          error: (error, stackTrace) => CustomAvatar(
                            initial: profile.fullName?.toInitial(),
                            width: 115,
                            height: 115,
                            onTap: () => context.goto(page: const AccountView()),
                          ),
                          loading: () => Center(child: CircularProgressIndicator()),
                        ),
                        15.height,
                        Text(profile.fullName ?? 'Unknown Profile').tsTitleM().bold(),
                        Text(profile.email?.toLowerCase() ?? '').tsLabelM(),
                      ],
                    ),
                  ),
                  15.height,
                ],
                if (profile != null)
                  Column(
                    children: [
                      GroupList(
                        children: [
                          ListTile(
                            leading: const Icon(SuperIcons.is_box_2_outline),
                            title: const Text('Profil').bold(),
                            onTap: () => context.goto(page: const AccountView()),
                          ),
                          ListTile(
                            leading: const Icon(SuperIcons.is_personalcard_outline),
                            title: const Text('Foto KTP').bold(),
                            onTap: () => context.goto(page: const PhotoCardView()),
                          ),
                          ListTile(
                            leading: const Icon(SuperIcons.is_cards_outline),
                            title: const Text('Foto Ujian').bold(),
                            onTap: () => context.goto(page: const ExamPhotoView()),
                          ),
                        ],
                      ),
                      10.height,
                      GroupList(
                        children: [
                          ListTile(
                            leading: const Icon(SuperIcons.is_password_check_outline),
                            title: const Text('Ubah Password').bold(),
                            onTap: () => context.goto(page: const PwdChangeView()),
                          ),
                        ],
                      ),
                    ],
                  ),
                10.height,
                GroupList(
                  children: [
                    ListTile(
                      leading: const Icon(SuperIcons.is_support_outline),
                      title: const Text('Hubungi Kami').bold(),
                      onTap: () => context.goto(page: const ContactUsView()),
                    ),
                    ListTile(
                      leading: const Icon(SuperIcons.is_lamp_1_outline),
                      title: const Text('Tentang Kami').bold(),
                      onTap: () => context.goto(page: const AboutView()),
                    ),
                    ListTile(
                      leading: const Icon(SuperIcons.is_security_safe_outline),
                      title: const Text('Kebijakan Privasi').bold(),
                      onTap: () => launchUrl(Uri.parse('https://aasi.or.id/privacy-policy')),
                    ),
                  ],
                ),
                10.height,
                VersionInfo(),
                20.height,
                if (profile == null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      child: const Text('Masuk / Login'),
                      onPressed: () => context.goto(page: const SignInView()),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      onPressed: () async => await ref.read(authCtrlProvider).signOut(),
                      child: const Text('Keluar / Logout'),
                    ),
                  ),
                ],
                60.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
