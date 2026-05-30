import 'dart:async';
import 'dart:developer';

import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:app.rynest.aasi/common/views/dev_info_view.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final devModeProvider = StateProvider<bool>((ref) => false);

class DeveloperCtrl {
  Ref ref;
  DeveloperCtrl(this.ref);

  final _kLogName = "DEVELOPER-CTRL";

  final _devKey = "COOKIE_DEVELOPER";
  int _pressedCount = 0;
  Timer? _timer;

  initialize() {
    log('Initialize Developer Mode !');

    _loadPreference();
  }

  void _loadPreference() {
    final data = ref.read(sharedPrefProvider).getBool(_devKey);
    ref.read(devModeProvider.notifier).state = data ?? false;
  }

  void _savePreference({bool devMode = false}) {
    ref.read(sharedPrefProvider).setBool(_devKey, devMode);
  }

  void devModeProcess({bool showLog = true}) {
    if (ref.read(devModeProvider)) {
      ref.read(pageUtilsProvider).goto(page: DevInfoView());
      return;
    }

    _timer ??= Timer(Duration(seconds: 10), () {
      _pressedCount = 0;
      if (showLog) log("Dev Mode Count : $_pressedCount", name: _kLogName);
      _timer?.cancel();
      _timer = null;
      return;
    });
    _pressedCount++;
    if (showLog) log("Dev Mode Count : $_pressedCount", name: _kLogName);
    if (_pressedCount > 3) {
      if (_pressedCount > 6) {
        ref.read(devModeProvider.notifier).state = true;
        _savePreference(devMode: true);
        SnackBarService(message: Text("Your are in Dev Mode").center()).shown(bottom: 30);
      } else {
        SnackBarService(message: Text("Dev Mode Count : $_pressedCount").center()).shown(bottom: 30);
      }
    }
  }

  void devModeOnOff(bool value) {
    ref.read(devModeProvider.notifier).state = value;
    ref.read(sharedPrefProvider).setBool(_devKey, value);
  }
}

final developerCtrlProvider = Provider(DeveloperCtrl.new);
