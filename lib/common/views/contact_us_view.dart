import 'package:app.rynest.aasi/common/widgets/custom_icon.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/common/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: OneUINestedScrollView(
          foregroundColor: oWhite,
          expandedWidget: Text(''.hardcoded).tsHeadlineL().center().clr(oWhite),
          collapsedWidget: Text('Kontak Kami'.hardcoded).tsTitleL().ellipsis().clr(oWhite).maxLn(1),
          background: Center(
            child: LogoArtWork(
              color: oWhite,
              child: Logo(width: context.screenWidthRatio(.6, .5), src: 'assets/images/logo_aasi_2.png'),
            ),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.more_vert),
          //   ),
          //   // IconButton(
          //   //   onPressed: () {},
          //   //   icon: const Icon(Icons.search),
          //   // ),
          // ],
          sliverList: SliverList.list(
            children: [
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Hubungi Kami'.hardcoded).tsHeadlineL().bold(),
              ),
              10.height,
              ListTile(
                title: Text('Alamat'.hardcoded),
                subtitle: Text(
                        'GRAHA AASI, Jalan Jatinegara Timur II No. 4, Rawa Bunga | Jakarta Timur, 13550 Indonesia'
                            .hardcoded)
                    .tsBodyM()
                    .bold(),
                trailing: CustomIcon(
                  SuperIcons.is_map_outline,
                  onPressed: () => launchUrl(
                    mode: LaunchMode.externalApplication,
                    Uri.parse(
                        'https://www.google.com/maps/place/Asosiasi+Asuransi+Syariah+Indonesia+(AASI)/@-6.218618,106.868608,13z/data=!4m5!3m4!1s0x0:0x58b6d89760534396!8m2!3d-6.2186254!4d106.868608?hl=id'),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_support_outline),
                title: Text('Customer Service'.hardcoded),
                subtitle: Text('+628891254788'.hardcoded).tsBodyM().bold(),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIcon(
                      SuperIcons.ev_phone_call_outline,
                      onPressed: () => launchUrl(Uri.parse('tel:+628891254788')),
                    ),
                    10.width,
                    CustomIcon(
                      SuperIcons.is_whatsapp_outline,
                      onPressed: () => launchUrl(
                        Uri.parse('https://wa.me/+628891254788/?text=${Uri.encodeComponent("Assalamu'alaikum AASI,")}'),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_support_outline),
                title: Text('Keagenan'.hardcoded),
                subtitle: Text('+6281290569098'.hardcoded).tsBodyM().bold(),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIcon(
                      SuperIcons.ev_phone_call_outline,
                      onPressed: () => launchUrl(Uri.parse('tel:+6281290569098')),
                    ),
                    10.width,
                    CustomIcon(
                      SuperIcons.is_whatsapp_outline,
                      onPressed: () => launchUrl(
                        Uri.parse(
                            'https://wa.me/+6281290569098/?text=${Uri.encodeComponent("Assalamu'alaikum AASI,")}'),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_building_outline),
                title: Text('Office #1'.hardcoded),
                subtitle: Text('+628111754451'.hardcoded).tsBodyM().bold(),
                trailing: CustomIcon(
                  SuperIcons.ev_phone_call_outline,
                  onPressed: () => launchUrl(Uri.parse('tel:+628111754451')),
                ),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_building_outline),
                title: Text('Office #2'.hardcoded),
                subtitle: Text('+622122898450'.hardcoded).tsBodyM().bold(),
                trailing: CustomIcon(
                  SuperIcons.ev_phone_call_outline,
                  onPressed: () => launchUrl(Uri.parse('tel:+622122898450')),
                ),
              ),
              ListTile(
                leading: const Icon(SuperIcons.bs_envelope_open),
                title: Text('Email'.hardcoded),
                subtitle: Text('info@aasi.or.id'.hardcoded).tsBodyM().bold(),
                trailing: CustomIcon(
                  SuperIcons.is_send_2_outline,
                  onPressed: () => launchUrl(Uri.parse('mailto:info@aasi.or.id')),
                ),
              ),
              // MAPS
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Peta Lokasi'.hardcoded).tsHeadlineL().bold(),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () => launchUrl(Uri.parse(
                      'https://www.google.com/maps/place/Asosiasi+Asuransi+Syariah+Indonesia+(AASI)/@-6.218618,106.868608,13z/data=!4m5!3m4!1s0x0:0x58b6d89760534396!8m2!3d-6.2186254!4d106.868608?hl=id')),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/images/maps.png'),
                  ),
                ),
              ),
              // FOLLOW
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Follow Akun Sosial Media Kami'.hardcoded).tsHeadlineS().bold(),
              ),
              10.height,
              ListTile(
                leading: const Icon(SuperIcons.mg_youtube_line),
                title: Text('Youtube'.hardcoded).bold(),
                onTap: () => launchUrl(Uri.parse('https://www.youtube.com/channel/UC_TvFxrwhOZ0QgDbZyOGgVg')),
              ),
              ListTile(
                leading: const Icon(SuperIcons.is_instagram_outline),
                title: Text('Instagram'.hardcoded).bold(),
                onTap: () => launchUrl(Uri.parse('https://www.instagram.com/aasi_id/')),
              ),
              ListTile(
                leading: const Icon(SuperIcons.mg_linkedin_line),
                title: Text('LinkedIn'.hardcoded).bold(),
                onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/company/71656469')),
              ),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
