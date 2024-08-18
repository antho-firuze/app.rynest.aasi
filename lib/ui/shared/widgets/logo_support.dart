import 'package:app.rynest.aasi/ui/shared/widgets/gradient_mask.dart';
import 'package:flutter/material.dart';

import '../../../helpers/F.dart';
import '../../views/about/about_view.dart';
import 'circle_button.dart';

class LogoSupport extends StatelessWidget {
  const LogoSupport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 55,
                height: 55,
                child: CircleButton(
                  child: GradientMask(
                    // child: Icon(
                    //   FontAwesomeIcons.handshakeAngle,
                    //   color: Colors.white,
                    // ),
                    // child: Image.asset(
                    //   'assets/images/builder-23.png',
                    //   color: Colors.white,
                    // ),
                    child: Image.asset(
                      'assets/images/ic_help.png',
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async => await F.navigate(const AboutView()),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
