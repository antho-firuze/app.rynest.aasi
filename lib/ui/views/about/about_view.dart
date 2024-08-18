import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/logos.dart';
import 'package:app.rynest.aasi/ui/views/about/about_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../../shared/widgets/appbar_delegate.dart';
import 'widgets/label_mee.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<AboutViewModel>.reactive(
      viewModelBuilder: () => AboutViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgEDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            // appBar: AppBarMee(title: 'Hubungi Kami'),
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: AppBarDelegate(
                    title: 'Hubungi Kami',
                    maxExtended: size.height * 0.3,
                    minExtended: kToolbarHeight * 1.25,
                    size: size,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      // Center(
                      //   child: LogoArtWork(
                      //     color: kcPrimaryColor,
                      //     width: screenWidth(context),
                      //   ),
                      // ),
                      Body(),
                    ],
                  ),
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
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          vSpaceXSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LabelMee(
              image: 'assets/icons/ic_location.png',
              text:
                  'GRAHA AASI, Jalan Jatinegara Timur II No. 4, Rawa Bunga | Jakarta Timur, 13550 Indonesia',
              onTap: () => launchUrl(Uri.parse(
                  'https://www.google.com/maps/place/Asosiasi+Asuransi+Syariah+Indonesia+(AASI)/@-6.218618,106.868608,13z/data=!4m5!3m4!1s0x0:0x58b6d89760534396!8m2!3d-6.2186254!4d106.868608?hl=id')),
            ),
          ),
          vSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LabelMee(
              image: 'assets/icons/ic_phone-old.png',
              text: '+628111714451',
              // text: '+628111784451',
              onTap: () => launchUrl(Uri.parse('tel:+628111714451')),
            ),
          ),
          vSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LabelMee(
              image: 'assets/icons/ic_mail.png',
              text: 'info@aasi.or.id',
              onTap: () => launchUrl(Uri.parse('mailto:info@aasi.or.id')),
            ),
          ),
          vSpaceSmall,
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
          vSpaceSmall,
          // TextLink('www.lsp-ps.id',
          //     onPressed: () => launchUrl(Uri.parse('http://www.lsp-ps.id'))),
          // const SizedBox(height: 10),
          // const Text(
          //   'LSP PERASURANSIAN SYARIAH',
          //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          // ),
          // const Text(
          //   'GRAHA AASI',
          //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          // ),
          // const SizedBox(height: 10),
          // const Text(
          //   'Jl. Jatinegara Timur II No. 4, Rawa Bunga,\n Jakarta Timur 13350',
          //   style: TextStyle(fontWeight: FontWeight.w700),
          //   textAlign: TextAlign.center,
          // ),
          // const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextLink('+622185908049'.formatPSTNNumber(),
          //         onPressed: () => launchUrl(Uri.parse('tel:+622185908049'))),
          //     const Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 5),
          //       child: Text('&'),
          //     ),
          //     TextLink('+622185908520'.formatPSTNNumber(),
          //         onPressed: () => launchUrl(Uri.parse('tel:+622185908520'))),
          //   ],
          // ),
          // const SizedBox(width: 5),
          // Text(
          //   'Ext.111',
          //   style: oStyle.copyWith(
          //     fontFamily: 'Roboto',
          //     fontSize: 16,
          //   ),
          // ),
          // const SizedBox(height: 20),
          const ContactSupport(
            title: 'Customer Service',
            phone: '+628891254788',
          ),
          const ContactSupport(
            title: 'Keagenan',
            phone: '+6281290569098',
          ),
          // const ContactSupport(
          //   title: 'Media',
          //   phone: '+628111814451',
          // ),
          vSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LogoYoutube(
                  color: Colors.orange,
                  onTap: () => launchUrl(Uri.parse(
                      'https://www.youtube.com/channel/UC_TvFxrwhOZ0QgDbZyOGgVg')),
                ),
                LogoInstagram(
                  color: Colors.orange,
                  onTap: () => launchUrl(
                      Uri.parse('https://www.instagram.com/aasi_id/')),
                ),
                LogoLinkedln(
                  color: Colors.orange,
                  onTap: () => launchUrl(
                      Uri.parse('https://www.linkedin.com/company/71656469')),
                ),
              ],
            ),
          ),
          vSpaceSmall,
        ],
      ),
    );
  }
}

class ContactSupport extends StatelessWidget {
  const ContactSupport({
    super.key,
    required this.title,
    required this.phone,
  });

  final String title;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () => launchUrl(Uri.parse('tel:$phone')),
                    child: ListTile(
                      leading: const Column(
                        children: [
                          Spacer(),
                          Icon(
                            Icons.phone,
                            color: kcPrimaryColor,
                          ),
                          Spacer(),
                        ],
                      ),
                      title: Text(
                        title,
                        style: captionStyle(context),
                      ),
                      subtitle: Text(
                        phone.formatPhoneNumber(),
                        style: bodyStyle(context),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  icon: Image.asset(
                    'assets/icons/whatsapp.png',
                    height: 50,
                    color: kcPrimaryColor,
                  ),
                  onPressed: () => launchUrl(Uri.parse('https://wa.me/$phone')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
