import 'dart:developer';

import 'package:app.rynest.aasi/common/model/latlong.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

final _kLogName = 'LOCATION-CTRL';
final _showLog = false;

final allowGpsProvider = StateProvider<bool>((ref) => false);
final isGpsEnableProvider = StateProvider<bool>((ref) => false);
final latLongProvider = StateProvider<LatLong?>((ref) => null);
final locationProvider = StateProvider<String>((ref) => '');
final placemarkProvider = StateProvider<Placemark?>((ref) => null);

final checkGpsEnabledProvider = FutureProvider<bool>((ref) async {
  bool result = await Geolocator.isLocationServiceEnabled();
  if (_showLog) log('checkGpsEnabled : $result', name: _kLogName);
  ref.read(isGpsEnableProvider.notifier).state = result;
  return result;
});

final checkGpsPermissionProvider = FutureProvider<bool>((ref) async {
  bool result = await Permission.location.isGranted;
  if (_showLog) log('checkGpsPermission : $result', name: _kLogName);
  ref.read(allowGpsProvider.notifier).state = result;
  return result;
});

final fetchPositionProvider = FutureProvider<LatLong?>((ref) async {
  if (!ref.read(isGpsEnableProvider) || !ref.read(allowGpsProvider)) return null;

  Position? position = await Geolocator.getLastKnownPosition(forceAndroidLocationManager: false);
  position ??= await Geolocator.getCurrentPosition(
    locationSettings: ref.read(locationCtrlProvider).getLocationSettings,
    // desiredAccuracy: LocationAccuracy.high,
    // forceAndroidLocationManager: false,
    // timeLimit: const Duration(seconds: 10),
  );
  final latLng = LatLong(position.latitude, position.longitude);

  if (_showLog) log('fetchPositionProvider (latlong) : $latLng', name: _kLogName);
  ref.read(latLongProvider.notifier).state = latLng;
  return latLng;
});

final fetchPlacemarkProvider = FutureProvider<Placemark?>((ref) async {
  LatLong? latLong = ref.read(latLongProvider);
  if (latLong == null) return null;

  List<Placemark> result = await placemarkFromCoordinates(latLong.lat, latLong.lng);

  Placemark? placemark = result[0];
  String location = [placemark.subAdministrativeArea, placemark.administrativeArea].join(', ');
  if (_showLog) log('fetchPlacemarkProvider (location) : $location', name: _kLogName);
  ref.read(placemarkProvider.notifier).state = placemark;
  ref.read(locationProvider.notifier).state = location;
  return placemark;
});

class LocationCtrl {
  Ref ref;
  LocationCtrl(this.ref);

  Future<void> initialize() async {
    log('Initialize GPS Location !');

    // ignore: unused_result
    ref.refresh(checkGpsEnabledProvider);

    // LISTEN GPS Status
    ref.listen(isGpsEnableProvider, (previous, next) async {
      if (next) {
        if (ref.read(allowGpsProvider)) {
          // ignore: unused_result
          ref.refresh(fetchPositionProvider);
        } else {
          // ignore: unused_result
          ref.refresh(checkGpsPermissionProvider);
        }
      }
    });

    // LISTEN GPS Permission
    ref.listen(allowGpsProvider, (previous, next) async {
      if (next) {
        if (ref.read(isGpsEnableProvider)) {
          // ignore: unused_result
          ref.refresh(fetchPositionProvider);
        }
      }
    });

    // LISTEN Position
    ref.listen(latLongProvider, (previous, next) async {
      if (next != null && next != previous) {
        // ignore: unused_result
        ref.refresh(fetchPlacemarkProvider);
      }
    });

    if (ref.read(isGpsEnableProvider) && ref.read(allowGpsProvider)) {
      // ignore: unused_result
      ref.refresh(fetchPositionProvider);
    }
  }

  LocationSettings? get getLocationSettings {
    late LocationSettings locationSettings;
    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          // distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        activityType: ActivityType.fitness,
        // distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
      );
    }

    return locationSettings;
  }

  /// Used for open GPS/Location Setting
  Future<bool> openLocationSettings() async => await Geolocator.openLocationSettings();

  Future<void> requestGpsPermission() async {
    if (await Permission.location.isPermanentlyDenied) {
      await openAppSettings();
      return;
    }

    final result = await Permission.location.request();
    bool isAllow = result == PermissionStatus.granted;
    if (_showLog) log('requestGpsPermission : $isAllow', name: _kLogName);
    ref.read(allowGpsProvider.notifier).state = isAllow;
  }
}

final locationCtrlProvider = Provider(LocationCtrl.new);
