import 'dart:io';
import 'dart:ui';

import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/helpers/api_helper.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../models/app_banner.dart';

GlobalKey globalKey = GlobalKey();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class AppService {
  String appVersion = '';
  String lastVersion = '';

  List<Map<String, dynamic>> fontSizes = [
    {'text': 'Kecil', 'value': 14},
    {'text': 'Sedang', 'value': 16},
    {'text': 'Besar', 'value': 18},
    {'text': 'Super Besar', 'value': 20},
    {'text': 'Besar Sekali', 'value': 24},
  ];
  int fontSize = 16;
  bool autoNextQuestion = false;

  Map<String, dynamic> deviceInfoMap = {};
  Map<String, dynamic>? osInfoMap = {};

  String? ipAddress;

  List<AppBanner>? appBanners;

  Future init() async {
    // await getLatestVersion();
    // await getIPAddress();
    await loadData();
  }

  Future loadData() async {
    fontSize = await F.session.fontSize();
    autoNextQuestion = await F.session.autoNextQuestion();

    final deviceInfo = await DeviceInfoPlugin().deviceInfo;
    deviceInfoMap = deviceInfo.toMap();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    osInfoMap = {
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
      'operatingSystem': Platform.operatingSystem,
      'operatingSystemVersion': Platform.operatingSystemVersion,
      'screenResolution':
          '${window.physicalSize.width} x ${window.physicalSize.height}',
      'ipAddress': ipAddress,
    };
  }

  String getPhoneInfo() {
    if (Platform.isAndroid) {
      return '${deviceInfoMap['manufacturer']} - ${deviceInfoMap['model']}';
    } else if (Platform.isIOS) {
      return '${deviceInfoMap['name']} - ${deviceInfoMap['model']}';
    } else {
      // kIsWeb
      return '${deviceInfoMap['manufacturer']} - ${deviceInfoMap['model']}';
    }
  }

  String getOSInfo() {
    if (Platform.isAndroid) {
      return '${osInfoMap?['operatingSystem']} - ${deviceInfoMap['version']['release']} - sdk: ${deviceInfoMap['version']['sdkInt']}';
    } else if (Platform.isIOS) {
      return '${deviceInfoMap['systemName']} - ${deviceInfoMap['systemVersion']}';
    } else {
      // kIsWeb
      return '${osInfoMap?['operatingSystem']} - ${deviceInfoMap['version']['release']}';
    }
  }

  Future getIPAddress() async {
    try {
      Response response = await Dio().get('https://api.ipify.org/');
      F.log.i(response.data);

      ipAddress = response.data;
    } catch (e) {
      F.log.e(e);
    }
  }

  Future getThisVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      appVersion = packageInfo.version;
    } on PlatformException {
      return 'Failed to get app name.';
    }
  }

  Future getLatestVersion() async {
    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.appCheckVersion);

    if (result.status) {
      lastVersion = result.data['app_version'];
    }
  }

  Future checkIsVersionOK() async {
    int res = F.compareVersionName(currVer: appVersion, lastVer: lastVersion);
    return res >= 0;
    // if (res < 0) {
    //   DialogMee.show(
    //     'Aplikasi ini membutuhkan versi yg lebih baru !',
    //     okTitle: 'Tutup Aplikasi',
    //   );
    //   if (Platform.isAndroid) {
    //     launch(
    //         'https://play.google.com/store/apps/details?id=com.rynest.aasi');
    //   }
    //   SystemNavigator.pop();
    // }
  }

  Future updateDeviceInfo() async {
    Map<String, dynamic> deviceInfoSummary = {
      'App Name': osInfoMap?['appName'],
      'Version':
          "${osInfoMap?['version']} / Build: ${osInfoMap?['buildNumber']}",
      'Perangkat': getPhoneInfo(),
      'Operating System': getOSInfo(),
      'Screen Resolution (w x h)': osInfoMap?['screenResolution'],
      'IP Address (public)': osInfoMap?['ipAddress'] ?? '0.0.0.0',
    };
    await apiHelper.callAPIJsonRPC(
      method: apiMethod.appUpdateDeviceInfo,
      params: {'device_info': deviceInfoSummary},
    );
  }

  Future sendNotification({Map<String, dynamic>? params}) async {
    await apiHelper.callAPIJsonRPC(
      method: apiMethod.appSendNotification,
      params: params,
    );
  }

  Future loadBanners() async {
    appBanners = [
      AppBanner(imageUrl: 'assets/images/carousel_1.png'),
      AppBanner(imageUrl: 'assets/images/carousel_2.png'),
      AppBanner(imageUrl: 'assets/images/carousel_3.png'),
    ];
  }
}
