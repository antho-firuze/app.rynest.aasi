import 'package:app.rynest.aasi/utils/number_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';

enum OLType { number, letterUpper, letterLower, romanUpper, romanLower, bullet, dashed, arrow }

class OrderedList extends StatelessWidget {
  const OrderedList({
    super.key,
    this.title,
    this.type = OLType.number,
    this.children,
  });

  final Widget? title;
  final OLType type;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) title!,
        if (children != null)
          ...List.generate(children!.length, (index) {
            String ordered = switch (type) {
              OLType.number => '${index + 1}.',
              OLType.letterUpper => '${String.fromCharCode(index + 65)}.',
              OLType.letterLower => '${String.fromCharCode(index + 65).toLowerCase()}.',
              OLType.romanUpper => '${(index + 1).toRomanNumberString()}.',
              OLType.romanLower => '${(index + 1).toRomanNumberString().toLowerCase()}.',
              OLType.bullet => '•',
              OLType.dashed => '-',
              OLType.arrow => '➤',
            };
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20, child: Text(ordered).maxLn(1).ellipsis()),
                Expanded(child: children![index]),
              ],
            );
          }),
      ],
    );
  }
}
