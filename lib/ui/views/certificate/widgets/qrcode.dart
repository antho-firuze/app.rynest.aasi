import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/ui_helper.dart';

class QRCode extends StatelessWidget {
  const QRCode({
    super.key,
    required this.checkUrl,
  });

  final String checkUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(checkUrl)),
      child: QrImageView(
        data: checkUrl,
        version: QrVersions.auto,
        eyeStyle: const QrEyeStyle(color: Colors.white),
        size: screenProp(context, s: 62, m: 90, l: 120),
      ),
    );
  }
}
