import 'package:flutter/material.dart';

import '../../../shared/widgets/button_mee.dart';

class NavigatorButton extends StatelessWidget {
  const NavigatorButton({
    super.key,
    this.onPressedBack,
    this.onPressedFinish,
  });

  final Function()? onPressedBack;
  final Function()? onPressedFinish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonMee(
            title: 'Kembali ke Ujian',
            onPressed: onPressedBack,
          ),
          ButtonMee(
            title: 'Selesai Ujian',
            color: Colors.red,
            onPressed: onPressedFinish,
          ),
        ],
      ),
    );
  }
}
