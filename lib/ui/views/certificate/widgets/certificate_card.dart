import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'back_card.dart';
import 'empty_card.dart';
import 'front_card.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
    this.certNo,
    this.fullName,
    this.releaseDate,
    this.expiredDate,
    this.checkUrl,
    this.certType,
    this.photoUrl,
    this.showPhoto = true,
    this.companyName,
  });

  final String? certNo;
  final String? fullName;
  final String? companyName;
  final DateTime? releaseDate;
  final DateTime? expiredDate;
  final String? checkUrl;
  final String? certType;
  final String? photoUrl;
  final bool showPhoto;

  @override
  Widget build(BuildContext context) {
    double width =
        screenWidth(context) * (screenWidth(context) < 800 ? .9 : .65);
    double height =
        screenWidth(context) * (screenWidth(context) < 800 ? .55 : .4);
    String? pCertType = certType == '10'
        ? '20'
        : certType == '11'
            ? '21'
            : certType;
    return certNo == null
        ? EmptyCard(width: width, height: height)
        : FlipCard(
            front: FrontCard(
                width: width,
                height: height,
                certNo: certNo,
                fullName: fullName,
                companyName: companyName,
                releaseDate: releaseDate,
                expiredDate: expiredDate,
                photoUrl: photoUrl,
                checkUrl: checkUrl),
            back: BackCard(width: width, height: height, certType: pCertType),
          );
  }
}
