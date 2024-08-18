import 'package:app.rynest.aasi/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/F.dart';
import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/logos.dart';
import 'qrcode.dart';

class FrontCard extends StatelessWidget {
  const FrontCard({
    super.key,
    required this.width,
    required this.height,
    this.certNo,
    this.fullName,
    this.releaseDate,
    this.expiredDate,
    this.photoUrl,
    this.checkUrl,
    this.companyName,
  });

  final double width;
  final double height;
  final String? certNo;
  final String? fullName;
  final String? companyName;
  final DateTime? releaseDate;
  final DateTime? expiredDate;
  final String? photoUrl;
  final String? checkUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(screenWidth(context) < 700 ? 15.0 : 25.0),
        // side: BorderSide(width: 3),
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(screenWidth(context) < 700 ? 15.0 : 20.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/certificate-front.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LogoAppWhite(
                    width: screenProp(context, s: 80, m: 100, l: 120),
                  ),
                  Text(
                    'KARTU TENAGA PEMASAR ASURANSI SYARIAH',
                    style: captionStyle(context).copyWith(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  vSpaceSmall,
                  Text(
                    // 'YUSWANTINI SPECIAL PAKE TELOR SEPULUH',
                    fullName == null
                        ? ''
                        : fullName!.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    // 'PT. Amanah Asuransi',
                    companyName == null
                        ? ''
                        : companyName!.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                  ),
                  vSpaceXSmall,
                  Text(
                    // '3321 0120 3938 3120',
                    certNo == null
                        ? '0000 0000 0000 0000'
                        : certNo!.formatCardNumber(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  vSpaceXSmall,
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth(context) < 1000 ? 80 : 130,
                        child: Text(
                          'Diterbitkan : ',
                          style: TextStyle(
                            fontSize: screenWidth(context) < 1000 ? 10 : 14,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        // '07 Jun 2021',
                        releaseDate == null
                            ? '07 Jun 2021'
                            : releaseDate!.asStringShort(),
                        style: TextStyle(
                          fontSize: screenWidth(context) < 1000 ? 10 : 14,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth(context) < 1000 ? 80 : 130,
                        child: Text(
                          'Berlaku Hingga : ',
                          style: bodyStyle(context).copyWith(
                            fontSize: screenWidth(context) < 1000 ? 10 : 14,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        expiredDate == null
                            ? '07 Jun 2022'
                            : expiredDate!.asStringShort(),
                        style: TextStyle(
                          fontSize: screenWidth(context) < 1000 ? 10 : 14,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LogoMari(
                    width: screenProp(context, s: 30, m: 40, l: 50),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 10,
              right: 3,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'Asosiasi Asuransi Syariah Indonesia',
                  style: TextStyle(
                    fontSize: 8,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (!F.isNullOrEmpty(checkUrl))
              Positioned(
                left: screenWidth(context) / 2 - 15,
                bottom: 5,
                child: QRCode(checkUrl: checkUrl!),
              ),
          ],
        ),
      ),
    );
  }
}
