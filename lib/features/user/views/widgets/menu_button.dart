import 'package:app.rynest.aasi/common/widgets/custom_ink_well.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/features/user/model/app_menu.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuButton extends ConsumerWidget {
  const MenuButton({
    super.key,
    required this.item,
    required this.iconPath,
    this.count = 0,
    this.onTap,
    this.color,
  });

  final String iconPath;
  final AppMenu item;
  final int count;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomInkWell(
      radius: 15,
      tooltip: item.tooltip,
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: 75,
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(iconPath, color: color),
                  ),
                ),
                2.height,
                Text(item.title.toUpperCase(), softWrap: true).center().size(11).bold(),
              ],
            ),
          ),
          if (count > 0)
            Positioned(
              right: 3,
              top: 0,
              child: Container(
                width: 25,
                height: 25,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: oRed, shape: BoxShape.circle),
                child: Center(child: Text('$count').clr(oWhite)),
              ),
            ),
        ],
      ),
    );
  }
}
