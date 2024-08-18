import 'package:app.rynest.aasi/ui/shared/widgets/logos.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';

class BackCard extends StatelessWidget {
  const BackCard({
    super.key,
    required this.width,
    required this.height,
    required this.certType,
  });

  final double width;
  final double height;
  final String? certType;

  @override
  Widget build(BuildContext context) {
    // var type = 20;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        // side: BorderSide(width: 3),
      ),
      child: Container(
        width: width,
        height: height,
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
              child: LogoAppWhite(
                width: screenProp(context, s: 80, m: 100, l: 120),
              ),
            ),
            Positioned(
              bottom: 13,
              right: 10,
              child: LogoMari(
                width: screenProp(context, s: 30, m: 40, l: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
