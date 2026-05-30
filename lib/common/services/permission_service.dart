import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  final Ref ref;
  PermissionService(this.ref);

  /// Used for open App Setting, and granted permission manually
  Future<bool> openAppSettingz() async => await openAppSettings();

  /// Used for open GPS/Location Setting
  Future<bool> openLocationSettings() async => await Geolocator.openLocationSettings();

  Future<bool> checkGpsPermission() async {
    bool result = await Permission.location.isGranted;
    log('checkGpsPermission | $result', name: 'PERMISSION-SVC');
    return result;
  }

  Future<bool> checkGpsEnabled() async {
    bool result = await Geolocator.isLocationServiceEnabled();
    log('checkGpsEnabled | $result', name: 'PERMISSION-SVC');
    return result;
  }

  Future<bool?> requestGpsPermission() async {
    if (await Permission.location.isPermanentlyDenied) {
      await openAppSettings();
      return null;
    }

    final result = await Permission.location.request();
    log('requestGpsPermission | ${result == PermissionStatus.granted}', name: 'PERMISSION-SVC');
    return result == PermissionStatus.granted;
  }

  // Future<bool> checkIsBatteryOptimizationDisabled() async {
  //   if (Platform.isAndroid) {
  //     return await DisableBatteryOptimization.isBatteryOptimizationDisabled ?? false;
  //   } else {
  //     return true;
  //   }
  // }

  // Future<bool> checkIsAutoStartEnabled() async {
  //   if (Platform.isAndroid) {
  //     return await DisableBatteryOptimization.isAutoStartEnabled ?? false;
  //   } else {
  //     return true;
  //   }
  // }

  // Future<void> showBatterySetting() async {
  //   if (Platform.isAndroid) {
  //     await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
  //   }
  // }

  // Future<void> showAutoStart() async {
  //   if (Platform.isAndroid) {
  //     await DisableBatteryOptimization.showEnableAutoStartSettings(
  //         'Enable Auto Start', 'Follow the steps and enable the auto start of this app');
  //   }
  // }

  Future<bool> checkMicrophonePermission() async {
    var result = await Permission.microphone.isGranted;
    log('checkMicrophonePermission | $result', name: 'PERMISSION-SVC');
    return result;
  }

  Future<bool> requestMicrophonePermission() async {
    if (await Permission.microphone.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    final result = await Permission.microphone.request();
    log('requestMicrophonePermission | ${result == PermissionStatus.granted}', name: 'PERMISSION-SVC');
    return result == PermissionStatus.granted;
  }

  Future<bool> checkNotificationPermission() async {
    var result = await Permission.notification.isGranted;
    log('checkNotificationPermission | $result', name: 'PERMISSION-SVC');
    return result;
  }

  Future<bool> requestNotificationPermission() async {
    final result = await Permission.notification.request();
    log('requestNotificationPermission | ${result == PermissionStatus.granted}', name: 'PERMISSION-SVC');
    return result == PermissionStatus.granted;
  }

  Future<bool> requestCameraAndMediaPermission() async {
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.manageExternalStorage,
      ].request();

      log('requestCameraAndMediaPermission | ${statuses[Permission.camera]!.isGranted} | ${statuses[Permission.manageExternalStorage]!.isGranted}',
          name: 'PERMISSION-SVC');

      return statuses[Permission.camera]!.isGranted && statuses[Permission.manageExternalStorage]!.isGranted;
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.photos,
        Permission.storage,
      ].request();

      log('requestCameraAndMediaPermission | ${statuses[Permission.camera]!.isGranted} | ${statuses[Permission.photos]!.isGranted} | ${statuses[Permission.storage]!.isGranted}',
          name: 'PERMISSION-SVC');

      return statuses[Permission.camera]!.isGranted &&
          statuses[Permission.photos]!.isGranted &&
          statuses[Permission.storage]!.isGranted;
    }
  }

  Future<bool> checkCameraAndMediaPermission() async => Platform.isAndroid
      ? await Permission.camera.isGranted && await Permission.manageExternalStorage.isGranted
      : await Permission.camera.isGranted && await Permission.photos.isGranted && await Permission.storage.isGranted;
}

final permissionServiceProvider = Provider(PermissionService.new);
