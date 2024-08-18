import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../services/app_service.dart';
import '../../../shared/colors.dart';
import '../../../shared/ui_helper.dart';
import '../../../shared/widgets/icon_mask.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: BottomNavigationBar(
              key: globalKey,
              // type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: onTap,
              showUnselectedLabels: false,
              // elevation: 3,
              backgroundColor: const Color(0xFFDFDFDF),
              // fixedColor: Colors.black,
              selectedLabelStyle: bodyStyle(context),
              selectedItemColor: kcPrimaryColor,
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    FontAwesomeIcons.house,
                    size: screenProp(context, s: 25, m: 25, l: 45),
                  ),
                  activeIcon: IconMask(
                    FontAwesomeIcons.houseFlag,
                    size: screenProp(context, s: 25, m: 25, l: 35),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Akun',
                  icon: Icon(
                    FontAwesomeIcons.solidUser,
                    size: screenProp(context, s: 25, m: 25, l: 45),
                  ),
                  activeIcon: IconMask(
                    FontAwesomeIcons.userGear,
                    size: screenProp(context, s: 25, m: 25, l: 35),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Setting',
                  icon: Icon(
                    FontAwesomeIcons.gear,
                    size: screenProp(context, s: 25, m: 25, l: 45),
                  ),
                  activeIcon: IconMask(
                    FontAwesomeIcons.gears,
                    size: screenProp(context, s: 25, m: 25, l: 35),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
