import 'package:flutter/material.dart';

class LogoBNSP extends StatelessWidget {
  const LogoBNSP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 100,
                child: Image.asset('assets/images/logo_bnsp.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
