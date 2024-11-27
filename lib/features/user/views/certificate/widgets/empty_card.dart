import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(SuperIcons.is_warning_2_outline, size: 50, color: secondaryLight),
          Text(
            'Sertifikat belum tersedia !',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
