import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/certificate/certificate_view.dart';
import 'package:app.rynest.aasi/features/user/views/home/widgets/carousel_page.dart';
import 'package:app.rynest.aasi/features/user/views/home/widgets/custom_shape.dart';
import 'package:app.rynest.aasi/features/user/views/home/widgets/icon_certificate.dart';
import 'package:app.rynest.aasi/features/user/views/home/widgets/menu_list.dart';
import 'package:app.rynest.aasi/utils/gradient.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: LogoArtWork(
                  color: oGreen70,
                  width: context.screenWidth,
                ),
              ),
            ),
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: context.screenHeight * 0.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: gradientLinear,
                  // gradient: LinearGradient(colors: colors3),
                ),
              ),
            ),
            RefreshIndicator(
              onRefresh: () async {},
              child: SafeArea(
                child: ListView(
                  children: [
                    10.height,
                    // HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LogoApp(width: 150, onTap: () => launchUrl(Uri.parse('https://aasi.or.id/'))),
                          IconCertificate(
                            onTap: () async =>
                                await ref.read(authCtrlProvider).signInGoto(page: const CertificateView()),
                          ),
                        ],
                      ),
                    ),
                    20.height,
                    const CarouselPage(),
                    20.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Menu Utama').tsTitleM().bold(),
                              const Text('Hi, silahkan pilih menu dibawah ini !').tsBodyM(),
                            ],
                          ),
                        ),
                        10.height,
                        SizedBox(
                          height: 105.whenLandscape(105),
                          child: const MenuList(),
                        ),
                      ],
                    ),
                    10.height,
                    // NOTIFICATION UJIAN
                    // if (model.examService.exam?.examCompleted == false)
                    //   InkWell(
                    //     onTap: () async => await model.onPressedExam(),
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 10),
                    //       child: CardMee(
                    //         backgroundColor: Colors.red[300],
                    //         header: Text(
                    //           'Ujian Masih Berjalan !',
                    //           style: captionStyle(context).copyWith(color: Colors.white),
                    //         ),
                    //         body: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Text(
                    //               'Waktu yang tersisa tinggal ',
                    //               style: bodyStyle(context),
                    //             ),
                    //             Text(
                    //               model.timerInfo,
                    //               style: bodyStyle(context).copyWith(color: Colors.white),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
