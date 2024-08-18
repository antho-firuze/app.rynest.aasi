import 'dart:io';
import 'dart:math';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/ui/shared/dialog_mee.dart';
import 'package:app.rynest.aasi/ui/views/auth/login_view.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart' hide Response;

import '../constants/picture_type.dart';
import '../constants/status_code.dart';
import '../models/result.dart';
import '../services/sharedpreferences_service.dart';
import '../ui/views/startup/startup_view.dart';

class FF {
  final session = locator<SharedPreferencesService>();
  // final session = locator<SessionService>();
  // final fcmService = locator<FcmService>();

  int rndNum() => Random().nextInt(99999);
  String currDT() => DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  String currDate() => DateFormat('yyyy-MM-dd').format(DateTime.now());
  String currTime() => DateFormat('HH:mm:ss').format(DateTime.now());

  String platform = Platform.isAndroid
      ? 'android'
      : Platform.isIOS
          ? 'ios'
          : 'web';

  final log = Logger();

  bool isNullOrEmpty(String? string) => [null, ''].contains(string);

  int toInt(dynamic val) => val == null
      ? 0
      : val is String
          ? int.tryParse(val) ?? 0
          : val is double
              ? val.toInt()
              : val;

  double toDouble(dynamic amnt) => amnt == null
      ? 0.0
      : amnt is String
          ? double.tryParse(amnt) ?? 0.0
          : amnt is int
              ? amnt.toDouble()
              : amnt;

  bool toBool(dynamic val) => val is String
      ? val == 'true'
          ? true
          : val == '1'
              ? true
              : false
      : val;

  dynamic toDateTime(dynamic date) => date == null
      ? null
      : date is String
          ? date.isEmpty
              ? null
              : DateTime.parse(date)
          : date;

  String? toGender(dynamic val) => [1, '1', 'P', 'M'].contains(val)
      ? 'Pria'
      : [2, '2', 'W', 'F'].contains(val)
          ? 'Wanita'
          : 'Belum Tahu';

  String? fromGender(dynamic val) => ['Pria'].contains(val)
      ? 'M'
      : ['Wanita'].contains(val)
          ? 'F'
          : 'X';

  String getPictureTypeVal(PictureType type) => type == PictureType.start
      ? 'exam_start'
      : type == PictureType.finish
          ? 'exam_finish'
          : type == PictureType.selfie
              ? 'selfie'
              : 'idcard';

  dynamic toFormatISODate(DateTime? date) =>
      date == null ? null : DateFormat('yyyy-MM-dd').format(date);

  String sanitize(String string) =>
      string.trim().replaceAll(RegExp(r'[!@#$%^&*(),.?":{}|<>]'), '');

  Future wait({int s = 0, int ms = 0}) async =>
      await Future.delayed(Duration(microseconds: ms, seconds: s));

  String getInitial(String? name) {
    return (name ?? '').isEmpty
        ? ''
        : name!.trim().split(' ').map((e) => e[0]).take(2).join();
  }

  // Convert List<int> to String of Decimal 10 digits
  String lintToString(List<int> lint) {
    return hexToInt(lintToHex(lint)).toString().padLeft(10, '0');
  }

  // Convert List<int> to Hexadecimal value
  String lintToHex(List<int> lint) {
    return lint.reversed
        .map((e) => e.toRadixString(16).padLeft(2, '0'))
        .join('');
  }

  // Convert Hexadecimal to Integer/Decimal value
  int hexToInt(String hex) {
    int val = 0;
    int len = hex.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = hex.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException("Invalid hexadecimal value");
      }
    }
    return val;
  }

  void exxit() {
    SystemNavigator.pop();
    exit(0);
  }

  // Base Sign Out
  signOut() async {
    // await fcmService.unSubscribe(topic: await F.session.topicSignIn());
    await F.session.removeAll();
  }

  // For API Error
  Future<bool> isErrorNetwork(Result result, {bool checkToken = false}) async {
    if (result.errCode == errNetwork) {
      if (await DialogMee.showRetry(result.message!) == true) {
        return true;
      } else {
        return false;
      }
    }
    if (checkToken) {
      return await isErrorToken(result);
    }
    return false;
  }

  // For API Error
  Future<bool> isErrorToken(Result result) async {
    if (mustLogin.contains(result.errCode)) {
      await signOut();
      await DialogMee.show(result.message!);
      if (await F.navigate(const LoginView(), force: true)) {
        return true;
      }
    }
    return false;
  }

  // For deleted Account
  signOutExitApp() async {
    await signOut();
    exxit();
  }

  // For confirmation Sign Out
  signOutConfirm({String? message}) async {
    if (await DialogMee.confirm(message) == true) {
      await signOut();
      return F.replaceWithTransition(const StartUpView());
    }
  }

  // For duplicated signIn
  signInConfirm({String? message}) async {
    await signOut();
    if (await DialogMee.confirm(message) == true) {
      return F.navigate(const LoginView());
    }
  }

  Future<bool> onWillPop() async {
    if (await DialogMee.confirm('do-you-want-quit'.tr) == true) {
      exxit();
    }

    return false;
  }

  int compareVersionName({required String currVer, required String lastVer}) {
    List<String> cVer = currVer.split(".");
    List<String> rVer = lastVer.split(".");
    int maxIndex = max(rVer.length, cVer.length);

    var result = 0;
    for (var i = 0; i < maxIndex; i++) {
      if (int.parse(cVer[i]) < int.parse(rVer[i])) {
        result = -1;
        break;
      } else if (int.parse(cVer[i]) > int.parse(rVer[i])) {
        result = 1;
        break;
      }
    }

    if (result == 0 && cVer.length != rVer.length) {
      result = cVer.length > rVer.length ? 1 : -1;
    }
    return result;
  }

  // NAVIGATION SECTION =============

  Future<T> replaceWithTransition<T>(Widget page, {Transition? trans}) async =>
      await Get.offAll(page, transition: trans ?? Transition.rightToLeft);

  Future<T> navigate<T>(Widget page,
          {bool force = false, Transition? trans}) async =>
      force == false
          ? await Get.to(() => page,
              transition: trans ?? Transition.rightToLeft)
          : await Get.to(page, transition: trans ?? Transition.rightToLeft);

  Future<T> clearTillFirstAndShowView<T>(Widget page,
      {Transition? trans}) async {
    Get.until((route) => route.isFirst);

    return await navigate(page, trans: trans);
  }

  Future? clearStackAndShow(String routeName, {dynamic arguments, int? id}) {
    return Get.offAllNamed(routeName, arguments: arguments, id: id);
  }

  bool back<T>({T? result, int? id}) {
    Get.back<T>(result: result, id: id);
    return Get.key.currentState?.canPop() ?? false;
  }

  void close(int? times) => Get.close(times ?? 1);

  Future<bool> isPhysicalDevice() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
      return deviceInfo.isPhysicalDevice;
    } else {
      IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
      return deviceInfo.isPhysicalDevice;
    }
  }

  Future<bool> isURLValid(String? url) async {
    try {
      log.i('url => [$url]');
      if ([null, ''].contains(url)) return false;

      await Dio().get(url!);
      // log.i(true);
      return true;
    } on Exception {
      // log.e(false);
      return false;
    }
  }
}

final F = FF();
