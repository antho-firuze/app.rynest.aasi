// import 'package:adhan/adhan.dart';
// import 'package:app.rynest.aasi/app/app.locator.dart';
// import 'package:app.rynest.aasi/services/gps_service.dart';
// import 'package:logger/logger.dart';

// import '../models/gps.dart';

// class AdhanService {
//   Logger log = Logger();

//   final gpsService = locator<GpsService>();
//   PrayerTimes? prayerTimes;
//   Prayer? currPrayer;

//   Future init() async {
//     await gpsService.init();
//     await getPrayerTime();
//   }

//   Future getPrayerTime({Gps? gps}) async {
//     try {
//       gps = gps ?? gpsService.gps;
//       Coordinates coordinates = Coordinates(gps.lat, gps.lng);

//       CalculationParameters params = CalculationMethod.other.getParameters();
//       params.fajrAngle = 20.0;
//       params.ishaAngle = 18.0;
//       params.madhab = Madhab.shafi;

//       // log.i('GPS => lng: ${gps.lng} - lat: ${gps.lat}\n'
//       //     'DateTime => ${DateTime.now()}');

//       prayerTimes = PrayerTimes.today(
//         coordinates,
//         params,
//       );

//       currPrayer = prayerTimes?.currentPrayer();
//     } catch (e) {
//       log.e(e);
//     }
//   }
// }
