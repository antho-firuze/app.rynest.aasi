import 'package:app.rynest.aasi/common/controller/package_info_controller.dart';
import 'package:app.rynest.aasi/common/views/about_view.dart';
import 'package:app.rynest.aasi/common/views/contact_us_view.dart';
import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_avatar.dart';
import 'package:app.rynest.aasi/common/widgets/forms/group_list.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/auth/views/pwd_change_view.dart';
import 'package:app.rynest.aasi/features/auth/views/signin_view.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/account/account_view.dart';
import 'package:app.rynest.aasi/features/user/views/photo/photo_card_view.dart';
import 'package:app.rynest.aasi/features/user/views/photo/photo_exam_view.dart';
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
    return MyUI(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Akun Saya"),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async => await ref.read(profileCtrlProvider).fetchProfile(),
          child: ListView(
            children: [
              if (ref.watch(authTokenProvider) == null) ...[
                20.height,
                LogoArtWork(
                  pressedOverflow: true,
                  child: Column(
                    children: [
                      const CustomAvatar(
                        width: 115,
                        height: 115,
                      ),
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
                      CustomAvatar(
                        width: 115,
                        height: 115,
                        image: profile?.photo,
                        initial: profile?.fullName.toInitial(),
                        onTap: () => context.goto(page: const AccountView()),
                      ),
                      15.height,
                      Text(profile?.fullName ?? 'Unknown Profile').tsTitleM().bold(),
                      Text(profile?.email.toLowerCase() ?? '').tsLabelM(),
                    ],
                  ),
                ),
                15.height,
              ],
              Column(
                children: [
                  if (ref.watch(authTokenProvider) != null) ...[
                    GroupList(
                      children: [
                        10.height,
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
                          onTap: () => context.goto(page: const PhotoExamView()),
                        ),
                      ],
                    ),
                    10.height,
                    GroupList(
                      children: [
                        10.height,
                        ListTile(
                          leading: const Icon(SuperIcons.is_password_check_outline),
                          title: const Text('Ubah Password').bold(),
                          onTap: () => context.goto(page: const PwdChangeView()),
                        ),
                      ],
                    ),
                  ],
                  10.height,
                  GroupList(
                    children: [
                      10.height,
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
                  Text("Versi: ${ref.watch(versionInfoProvider)}").center(),
                  20.height,
                  if (ref.watch(authTokenProvider) == null) ...[
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
                        onPressed: () => ref.read(authCtrlProvider).signOut(),
                        child: const Text('Keluar / Logout'),
                      ),
                    ),
                  ],
                ],
              ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
