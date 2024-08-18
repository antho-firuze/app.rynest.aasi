import 'package:flutter/material.dart';

class CardMee extends StatelessWidget {
  const CardMee({
    super.key,
    this.body,
    this.header,
    this.footer,
    this.padding, this.backgroundColor,
  });

  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 3.0,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      child: Column(
        children: [
          header ?? const SizedBox(),
          body ?? const SizedBox(),
          footer ?? const SizedBox(),
        ],
      ),
    );
  }
}
