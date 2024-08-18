import 'package:flutter/material.dart';

class LogoMARI extends StatelessWidget {
  const LogoMARI({
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
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 100,
                child: Image.asset('assets/images/logo_mari_berasuransi.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
