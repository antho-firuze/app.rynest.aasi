import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/profile/profile_edit_view.dart';
import 'package:app.rynest.aasi/ui/views/profile/profile_viewmodel.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/list_menu.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/avatar_mee.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/show_bottom_slide.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/version_info.dart';
import 'package:app.rynest.aasi/ui/views/profile/widgets/remove_account.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/F.dart';
import '../../shared/appbar_mee.dart';
import '../../shared/widgets/image_view.dart';
import '../../shared/widgets/logos.dart';
import '../about/about_view.dart';
import '../auth/change_pwd_view.dart';
import '../photos/photo_card_view.dart';
import '../photos/photo_exam_view.dart';
import 'widgets/about_app.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => locator<ProfileViewModel>(),
      onViewModelReady: (viewModel) async => await viewModel.futureToRun(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            appBar: const AppBarMee(
              title: 'Akun',
              titleColor: kcPrimaryColor,
              backgroundColor: Colors.transparent,
              forBottomNavigationBar: true,
            ),
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: LogoArtWork(
                    color: kcPrimaryColor,
                    width: screenWidth(context),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async => await model.onRefresh(),
                  child: Body(model: model),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.model,
  });

  final ProfileViewModel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        vSpaceSmall,
        AvatarMee(
          image: model.photo,
          initial: F.getInitial(model.profile?.fullName),
          width: 115,
          height: 115,
          onTap: () {
            if (model.photo != null) {
              return F.navigate(ImageView(src: model.photo!));
            }
          },
          onTapCamera: () async => await model.getSelfie(),
        ),
        vSpaceXSmall,
        Column(
          children: [
            Text(
              model.profile?.fullName?.toUpperCase() ?? '',
              style: captionStyle(context).clr(Colors.black54),
            ),
            Text(
              model.profile?.email?.toLowerCase() ?? '',
              style: bodyStyle(context).clr(kcPrimaryColor),
            ),
          ],
        ),
        // Text(
        //   model.profile?.memberId?.toUpperCase() ?? '',
        //   style: captionStyle(context).clr(Colors.black54),
        // ),
        vSpaceSmall,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListMenu(
                text: 'Profil',
                iconData: Icons.account_circle_outlined,
                onPressed: () => F.navigate(const ProfileEditView()),
              ),
              vSpaceSmall,
              ListMenu(
                text: 'Foto KTP',
                iconData: Icons.credit_card,
                onPressed: () => F.navigate(const PhotoCardView()),
              ),
              vSpaceSmall,
              ListMenu(
                text: 'Foto Ujian',
                iconData: Icons.photo,
                onPressed: () => F.navigate(const PhotoExamView()),
              ),
              vSpaceSmall,
              ListMenu(
                text: 'Ubah Password',
                iconData: Icons.vpn_key,
                onPressed: () => F.navigate(const ChangePwdView()),
              ),
              // ProfileMenu(
              //   text: 'Ubah Bahasa',
              //   icon: Icons.flag_outlined,
              //   onPressed: () {},
              // ),
              vSpaceSmall,
              ListMenu(
                text: 'Hubungi Kami',
                iconData: Icons.contact_support,
                onPressed: () => F.navigate(const AboutView()),
              ),
              // ProfileMenu(
              //   text: 'Lapor',
              //   icon: Icons.report,
              //   onPressed: () {},
              // ),
              vSpaceSmall,
              ListMenu(
                text: 'Tentang Aplikasi',
                iconData: Icons.apps,
                onPressed: () async => showBottomSlide(
                  context: context,
                  title: 'Tentang Aplikasi',
                  maxSize: 1,
                  movable: true,
                  child: const AboutApp(),
                ),
              ),
              vSpaceSmall,
              ListMenu(
                text: 'Kebijakan Privasi',
                iconData: Icons.security,
                onPressed: () => launchUrl(
                    Uri.parse('https://aasi.or.id/id/privacy-policy')),
              ),
              vSpaceSmall,
              ListMenu(
                text: 'Keluar / Logout',
                iconData: Icons.logout,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () => model.logout(),
              ),
              vSpaceMedium,
              ListMenu(
                text: 'Hapus Akun',
                iconData: Icons.warning_amber_rounded,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: () async => showBottomSlide(
                  context: context,
                  title: 'Hapus Akun',
                  maxSize: 1,
                  movable: true,
                  child: RemoveAccount(
                    onPressedRemove: () async => await model.removeAccount(),
                  ),
                ),
                // onPressed: () => model.logout(),
              ),
            ],
          ),
        ),
        vSpaceSmall,
        VersionInfo(version: model.appService.appVersion),
        vSpaceLarge,
      ],
    );
  }
}
