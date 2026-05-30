import 'package:app.rynest.aasi/features/user/controller/menu_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/widgets/menu_button.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuList extends ConsumerWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appMenus = ref.read(menuCtrlProvider).getHomeAppMenus();

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16),
      separatorBuilder: (context, index) => 12.width,
      itemCount: appMenus.length,
      itemBuilder: (context, index) {
        final item = appMenus[index];
        return MenuButton(
          item: item,
          iconPath: ref.read(menuCtrlProvider).getIconPath(item.code),
          onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
        );
      },
    );
  }
}
