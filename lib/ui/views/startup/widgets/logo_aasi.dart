import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';

class LogoAASI extends StatelessWidget {
  const LogoAASI({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? screenProp(context, s: 150, m: 150, l: 250),
      child: Image.asset('assets/images/logo_aasi.png'),
    );
  }
}
