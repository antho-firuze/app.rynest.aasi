import 'package:flutter/material.dart';

class LogoLSP extends StatelessWidget {
  const LogoLSP({
    super.key,
    this.width,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150,
      child: Image.asset(
        'assets/images/logo_lsp.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
