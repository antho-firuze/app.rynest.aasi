// import 'package:app.rynest.aasi/helpers/F.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:logger/logger.dart';

// import '../models/gps.dart';

// class GpsService {
//   Logger log = Logger();

//   Gps gps = Gps.defaultValue();
//   String city = 'Kota Depok';

//   Future init() async {
//     if (F.platform == 'ios') return;
//     await getGPSLocation();
//   }

//   Future checkGPSEnabled() async {
//     debugPrint('checkGPSEnabled');
//     return await Geolocator.isLocationServiceEnabled();
//   }

//   Future<bool> checkGPSPermission() async {
//     debugPrint('checkGPSPermission');
//     LocationPermission permissionStatus = await Geolocator.checkPermission();

//     debugPrint(permissionStatus.toString());
//     if (permissionStatus == LocationPermission.denied ||
//         permissionStatus == LocationPermission.deniedForever) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   Future requestGPSPermission() async {
//     debugPrint('requestGPSPermission');
//     LocationPermission permissionStatus = await Geolocator.requestPermission();

//     debugPrint(permissionStatus.toString());
//   }

//   Future getGPSLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//         forceAndroidLocationManager: false,
//         timeLimit: const Duration(seconds: 10),
//       );

//       log.d('lng : ${position.longitude.toString()} - '
//           'lat : ${position.latitude.toString()}');

//       gps = Gps(lng: position.longitude, lat: position.latitude);
//     } catch (e) {
//       gps = Gps.defaultValue();

//       log.e('$e \n\nGPS Default => lng: ${gps.lng} - lat: ${gps.lat}');
//     }
//   }

//   Future getAddress() async {
//     if (F.platform == 'ios') return;

//     try {
//       List<Placemark> placemark = await placemarkFromCoordinates(
//         gps.lat,
//         gps.lng,
//         localeIdentifier: 'id_ID',
//       );
//       log.d(placemark[0].subAdministrativeArea);

//       city = placemark[0].subAdministrativeArea ?? city;
//     } catch (e) {
//       log.e(e);
//     }
//   }
// }
