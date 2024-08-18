import 'package:flutter/material.dart';

import '../../../shared/ui_helper.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return (message != null && message!.isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                message ?? '',
                style: bodyStyle(context).copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
