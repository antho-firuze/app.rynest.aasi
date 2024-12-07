import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_result_view.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_view.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_schedule_view.dart';
import 'package:app.rynest.aasi/features/user/model/app_menu.dart';
import 'package:app.rynest.aasi/features/user/service/menu_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuCtrl {
  Ref ref;
  MenuCtrl(this.ref);

  List<AppMenu> getHomeAppMenus() {
    List<Map<String, Object>> appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // NOT SIGNIN
    // if (ref.read(authUserProvider) == null) {
    //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes"];
    //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    //   return appMenus;
    // }

    // AFTER SIGNIN
    // appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE DEFAULT == TRUE
    appMenus.removeWhere((element) => element.isDefault == false);

    return appMenus;
  }

  List<AppMenu> getAllAppMenus() {
    final appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // NOT SIGNIN
    // if (ref.read(authUserProvider) == null) {
    //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes", "exchangeRate", "qibla"];
    //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    //   return appMenus;
    // }

    // AFTER SIGNIN
    // appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE SHOW == TRUE
    appMenus.where((element) => element.isShow == true).toList();

    return appMenus;
  }

  List<AppMenu> _filterMenuByRole(List<AppMenu> menus) {
    // Role 1 => Jama'ah
    // if (ref.read(authUserProvider)?.roleId == 1) {
    //   menus.removeWhere((element) => element.code == 'liveLocation');
    //   menus.removeWhere((element) => element.code == 'presenter');
    //   menus.removeWhere((element) => element.code == 'agenda');
    // }
    // Role 2 => Muthowwif
    // if (ref.read(authUserProvider)?.roleId == 2) {
    //   menus.removeWhere((element) => element.code == 'listener');
    // }
    return menus;
  }

  String getIconPath(String code) {
    return switch (code) {
      "exam-01.png" => "assets/icons/exam-01.png",
      "exam-result-01.png" => "assets/icons/exam-result-01.png",
      "exam-schedule-01.png" => "assets/icons/exam-schedule-01.png",
      String() => '',
    };
  }

  Future goto(String code) async {
    return switch (code) {
      "exam-01.png" => await ref.read(authCtrlProvider).signInGoto(page: const ExamView()),
      "exam-result-01.png" => await ref.read(authCtrlProvider).signInGoto(page: const ExamResultView()),
      "exam-schedule-01.png" => await ref.read(authCtrlProvider).signInGoto(page: const ExamScheduleView()),
      String() => '',
    };
  }
}

final menuCtrlProvider = Provider(MenuCtrl.new);
