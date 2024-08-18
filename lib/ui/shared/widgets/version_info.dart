import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({
    super.key,
    this.version,
  });

  final String? version;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.25,
      child: Align(
        child: Text(
          'versi : $version',
          // 'versi : ${AppService().appVersion}',
          style: bodyStyle(context),
        ),
      ),
    );
  }
}
