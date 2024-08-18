import 'package:flutter/material.dart';

class LogoOJK extends StatelessWidget {
  const LogoOJK({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 100,
                child: Image.asset('assets/images/logo_ojk.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
