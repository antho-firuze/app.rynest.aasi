import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/certificate/widgets/certificate_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/appbar_mee.dart';
import '../../shared/colors.dart';
import 'certificate_viewmodel.dart';

class CertificateView extends StatelessWidget {
  const CertificateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CertificateViewModel>.reactive(
      viewModelBuilder: () => CertificateViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgDDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            appBar: const AppBarMee(
              title: 'Kartu Lisensi',
              titleColor: kcPrimaryColor,
              showBack: true,
              backgroundColor: Colors.transparent,
              // onBackPressed:
              //     showBack ? () => Navigator.of(context).pop(false) : null,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async => await model.refresh(),
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

  final CertificateViewModel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        vSpaceXSmall,
        // const LogoSignature(),
        vSpaceXSmall,
        Align(
          alignment: Alignment.topCenter,
          child: CertificateCard(
            certNo: model.certificate?.certNo,
            certType: model.certType,
            fullName: model.profile?.fullName,
            companyName: model.profile?.company?.name,
            releaseDate: model.certificate?.releaseDate,
            expiredDate: model.certificate?.expiredDate,
            checkUrl:
                'https://lsp-ps.id/check_sertifikat/validate/${model.certificate?.certNo}',
            photoUrl: model.profile?.photo,
          ),
        ),
      ],
    );
  }
}
