import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/card_mee.dart';
import 'package:app.rynest.aasi/ui/views/certificate/certificate_view.dart';
import 'package:app.rynest.aasi/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:app.rynest.aasi/ui/views/home/home_viewmodel.dart';
import 'package:app.rynest.aasi/ui/views/home/widgets/carousel_mee.dart';
import 'package:app.rynest.aasi/ui/views/startup/widgets/logo_aasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/colors.dart';
import '../../shared/widgets/logos.dart';
import 'widgets/build_grid_menu.dart';
import 'widgets/custom_shape.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => locator<HomeViewModel>(),
      onViewModelReady: (model) async => await model.futureToRun(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: LogoArtWork(
                      color: kcPrimaryColor,
                      width: screenWidth(context),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: screenHeight(context) * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: gradientLinear,
                      // gradient: LinearGradient(colors: colors3),
                    ),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async => await model.refresh(),
                  child: Body(model: model),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
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

  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    final dashboard = locator<DashboardViewModel>();
    return SafeArea(
      child: ListView(
        children: [
          vSpaceXSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => launchUrl(Uri.parse('https://aasi.or.id/')),
                  child: const LogoAASI(),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: LogoAppBar(
                          width: screenProp(context, s: 60, m: 60, l: 110),
                          height: screenProp(context, s: 40, m: 40, l: 70),
                          image: 'assets/images/ic_certificate.png',
                          initial: F.getInitial(
                              model.accountService.profile?.fullName),
                          onTap: () async =>
                              await F.navigate(const CertificateView()),
                        ),
                      ),
                    ),
                    hSpaceXSmall,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: LogoAppBar(
                          width: screenProp(context, s: 40, m: 50, l: 70),
                          height: screenProp(context, s: 40, m: 50, l: 70),
                          image: model.photo,
                          initial: F.getInitial(
                              model.accountService.profile?.fullName),
                          onTap: () => dashboard.onTap(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          vSpaceXSmall,
          CarouselMee(appBanners: model.appService.appBanners),
          vSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Menu Utama', style: captionStyle(context)),
                Text(
                  'Hi, silahkan pilih menu dibawah ini !',
                  style: bodyStyle(context),
                ),
              ],
            ),
          ),
          BuildGridMenu(model: model),
          vSpaceSmall,
          // NOTIFICATION UJIAN
          if (model.examService.exam?.examCompleted == false)
            InkWell(
              onTap: () async => await model.onPressedExam(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CardMee(
                  backgroundColor: Colors.red[300],
                  header: Text(
                    'Ujian Masih Berjalan !',
                    style: captionStyle(context).copyWith(color: Colors.white),
                  ),
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Waktu yang tersisa tinggal ',
                        style: bodyStyle(context),
                      ),
                      Text(
                        model.timerInfo,
                        style: bodyStyle(context).copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
