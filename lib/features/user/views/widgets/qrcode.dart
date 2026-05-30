import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
        eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.white),
        dataModuleStyle: const QrDataModuleStyle(color: Colors.white),
        size: 62.whenLandscape(90),
      ),
    );
  }
}
