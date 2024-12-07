import 'package:app.rynest.aasi/common/widgets/logo/logo.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  const BackCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = context.screenWidthRatio(.9, .65);
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        // side: BorderSide(width: 3),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: const DecorationImage(
            image: AssetImage('assets/images/certificate-back-text.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 13,
              left: 10,
              child: Logo(width: width * .2, src: 'assets/images/logo_aasi.png', color: oWhite),
            ),
            Positioned(
              bottom: 13,
              right: 10,
              child: Logo(width: width * .1, src: 'assets/images/logo_mari_berasuransi.png'),
            ),
          ],
        ),
      ),
    );
  }
}
