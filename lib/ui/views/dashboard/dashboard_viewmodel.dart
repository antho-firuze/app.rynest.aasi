import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../setting/setting_view.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  PageController pageController = PageController();
  final List<Widget> pages = [
    const HomeView(),
    const ProfileView(),
    const SettingView(),
  ];

  void onTap(int index) {
    setIndex(index);
    pageController.jumpToPage(index);
  }
}
