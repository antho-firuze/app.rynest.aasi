// import 'package:app.rynest.aasi/app/app.locator.dart';
// import 'package:app.rynest.aasi/helpers/api_helper.dart';
// import 'package:app.rynest.aasi/models/result.dart';
// import 'package:app.rynest.aasi/services/app_service.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:logger/logger.dart';
// import 'package:http/http.dart';

// import '../constants/backend.dart';
// import '../helpers/F.dart';

// class FcmService {
//   final Logger log = Logger();

//   final appService = locator<AppService>();

//   late FirebaseMessaging _fcm;
//   AccessCredentials? accessCredentials;

//   NotificationSettings? settings;

//   Map<String, dynamic> serviceAccount = {
//     "type": "service_account",
//     "project_id": "lsp-ps",
//     "private_key_id": "19bb1299134fe7ea3abb94c6704baa20dcc6207a",
//     "private_key":
//         "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC11iijCBpSxGb0\ndt6TCkxbH824/rMA3rj8nwksRqJYZ06T63UblnEV4hXnHii1bNN6TwzyVfZQi9qb\nl1E8uarU8799ZJXEm8X+5sO1Ny96ZWiOLY0cZ1Ju9l3N2XAzSnSClZYFvEXfw9d+\nMa/dj9bMFUovpGP39Tz2TmdzO6riNjRJ9nQTBowvxi+rmdViZzDvgsBUAOFP1ac2\niUsxQW3BSAqp3ajzYX1cv2+wquH4DCFrkl1DbTI6LznfGmZ4gJ0LRW7cc0owKai2\n2SmIEhApgMz/g3XQVg/3e459Q61H9VFS6ch9iGBv6bP0UV1A5QmO7BtktnYfNEsy\n1hzd2y9pAgMBAAECggEAQ8rTvLCNK9VocvUMVzKsM/7/8lwW/ZiLzDc4ssakySO+\n0nwi3YWxpJB1TQTb9YPctklZkNHGstHpTz/TfDnWfG1hs4y4H6RZ5YZAacPo0g+T\nswo9hVzqCU+VumS6JY05MeQ2Ge5O+LVplnVM1WRGlzDKx0dZM/083LFvdTFGLO6a\nL9Mmj2+33tm4Ops+sIyT09W72aSSXA5Z+KUe3rGTYL/3UatZw6i/77ye1V1FaeUk\nG10LBvJZN7yUGALUAnczdRxoahYBhMrTW2RHieENsF6TuF/KnsBXbuF078/GczwP\ng0UiOZMbgqBzGEepFIugjO7wJRVoYDFiW6Z93dvNhwKBgQDoTLczI/0DYpq5oZwW\nvc3Bof1rXrY/oyqOxvoU65EaenGbUG4sSoQmGDxl3A2RnRPT0fnjYuyEmAxV99vh\n6j1COVvuhAHVHsjSnAm0rZHJt29dEFWGUPHsFtA5kBEhqAEZldv8PrZS+YU0P/X4\n/N+qrZGgX3+JuF11HZks7IRMawKBgQDIY24IAk66sbZ205/HtUV4VHzX3USDQICk\nAsAe1LjI+gN7XZPZep38+S8SVp4B+i8oWktyfugkGxmn+2Siacyq2TSv4bAPC8+n\niRrPj2MzGuYAjfr1LQoAQIc/2ojx16g06qZsJPLDH2uBg8PqdVStrikwT5fbD38p\nIxiTQX1oewKBgD+95TssMd3+7ZPoS4tV86KhT4dpyrp1jFT3NmINLZjFZm0GyeRv\nYgmN9uzAUBzXrDwgTuBdIadUjXX9eCFqg/qrAJXXNSWEt/hKhsNEKU/ffLhdpgog\nJfHxZJuW84x3rC2YGHADyUXFYA6xSk5THRCZZe9KpRVmOIbNY12XXMoXAoGAOxUt\n7QiZI+yf6tssohptWDQ49wCTYcuT4ke5U53OudsVSbtmi1ne2SazXUnSnqygWNp+\nokyOr46Z+vBhVI2zPbB7G1yEp3sJB9Gh6Q7S5c+JfyJdmwpjh31/IzGQ7RVzz95b\noUknlqZd8Trjee6MQAU4ubjOAlXIXV2uskQ98J8CgYEAuM6J/UrGd7pTLhBt/yhY\nSvZkrfzbDevxdjxfBY5ucS5EpmpKHvex3Lx1E5QMGKOboA626Zq9uJokdCAmivX6\nvZLGJgkNvoQMLJe9sBGCfjZAbysVGlmd+mFgBKPCLDTTu32Vg9AkCQvs+7wbCzAd\n2cUP20nLsk6LkgobZZhgZmE=\n-----END PRIVATE KEY-----\n",
//     "client_email": "firebase-adminsdk-yxqsk@lsp-ps.iam.gserviceaccount.com",
//     "client_id": "109699629748404407577",
//     "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//     "token_uri": "https://oauth2.googleapis.com/token",
//     "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//     "client_x509_cert_url":
//         "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-yxqsk%40lsp-ps.iam.gserviceaccount.com",
//   };

//   Future init() async {
//     _fcm = FirebaseMessaging.instance;

//     NotificationSettings settings = await _fcm.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       log.i('User granted permission');

//       // For handling the received notifications
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         log.i('onMessage.listen :');
//         log.i(message.toMap());
//         switch (message.data['category']) {
//           case 'authentication':
//             String? token = message.data['token'];
//             if (apiHelper.token != token) {
//               // showFlutterNotification(message);
//               F.signInConfirm(
//                   message: 'Error: Duplikasi Login !\n\n'
//                       'Akun anda telah digunakan pada\n'
//                       'perangkat ${message.data['platform']}\n\n'
//                       '${message.data['device'].toUpperCase()}\n\n'
//                       'Apakah ingin login ulang ?');
//             }
//             break;
//         }
//       });

//       // Kalou Aplikasi dibuka melalui Notification Message
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         log.i('onMessageOpenedApp.listen :');
//         log.i(message.toMap());
//         switch (message.data['category']) {
//           case 'authentication':
//             String? token = F.isNullOrEmpty(message.data['token'])
//                 ? ''
//                 : message.data['token'];
//             String? platform = F.isNullOrEmpty(message.data['platform'])
//                 ? 'Unknown'
//                 : message.data['platform']!.toUpperCase();
//             String? device = F.isNullOrEmpty(message.data['device'])
//                 ? 'Unknown'
//                 : message.data['device']!.toUpperCase();
//             if (apiHelper.token != token) {
//               // showFlutterNotification(message);
//               F.signInConfirm(
//                   message: 'Error: Duplikasi Login !\n\n'
//                       'Akun anda telah digunakan pada\n'
//                       'perangkat $platform\n\n'
//                       '$device\n\n'
//                       'Apakah ingin login ulang ?');
//             }
//             break;
//         }
//       });
//     } else {
//       log.e('User declined or has not accepted permission');
//     }
//   }

//   Future getAccessToken() async {
//     final Client client = Client();
//     AccessCredentials cred = await obtainAccessCredentialsViaServiceAccount(
//       ServiceAccountCredentials.fromJson(serviceAccount),
//       [
//         'https://www.googleapis.com/auth/firebase.messaging',
//       ],
//       client,
//     );
//     client.close();

//     accessCredentials = cred;
//   }

//   Future deviceToken() async {
//     String? token = await _fcm.getToken();
//     debugPrint('deviceToken : $token');
//   }

//   Future subscribe({required String topic}) async {
//     await _fcm.subscribeToTopic(topic);
//     log.d('subscribed to topic : $topic');
//   }

//   Future unSubscribe({required String topic}) async {
//     if (topic.isNotEmpty) {
//       await _fcm.unsubscribeFromTopic(topic);
//     }
//   }

//   Future publishV0({required Map<String, dynamic> params}) async {
//     // params: {
//     //   'topic': await F.session.topicSignIn(),
//     //   'title': 'Apakah Anda Login di perangkat lain ?',
//     //   'message': 'Perangkat nya adalah [${appService.getPhoneInfo()}]',
//     //   'data': {
//     //     'category': 'authentication',
//     //   },
//     // }
//     Map<String, dynamic> dataDef = {
//       'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//       'token': apiHelper.token,
//       'device': appService.getPhoneInfo(),
//       'platform': F.platform,
//     };
//     if (params['data'] != null && params['data'].isNotEmpty) {
//       dataDef.addAll(params['data']);
//     }

//     Result result = await apiHelper.callAPIToFCM(
//       endPoint: fcmEndNodeLegacy,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'key=$fcmServerKey',
//       },
//       params: {
//         'priority': 'high',
//         'to': "/topics/${params['topic']}",
//         'notification': {
//           'title': params['title'],
//           'body': params['message'],
//           'icon': '@mipmap/ic_launcher',
//         },
//         'data': dataDef,
//       },
//     );

//     if (result.status) {
//       return Result.success(data: result.data, message: result.message);
//     } else {
//       return Result.error(message: result.message, errCode: result.errCode);
//     }
//   }

//   Future publishV1({required Map<String, dynamic> params}) async {
//     if (accessCredentials == null ||
//         DateTime.now().isAfter(accessCredentials!.accessToken.expiry)) {
//       /// perform access token request
//       await getAccessToken();
//     }
//     log.d(accessCredentials!.accessToken.data);

//     Map<String, dynamic> dataDef = {
//       'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//       'token': apiHelper.token,
//       'device': appService.getPhoneInfo(),
//     };
//     if (params['data'] != null && params['data'].isNotEmpty) {
//       dataDef.addAll(params['data']);
//     }

//     Result result = await apiHelper.callAPIToFCM(
//       endPoint: fcmEndNodeV1,
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer ${accessCredentials!.accessToken.data}',
//       },
//       params: {
//         "message": {
//           "topic": params['topic'],
//           "notification": {
//             'title': params['title'],
//             'body': params['message'],
//           },
//           "data": dataDef,
//           "android": {
//             "notification": {
//               "click_action": "TOP_STORY_ACTIVITY",
//             }
//           },
//           "apns": {
//             "payload": {
//               "aps": {"category": "NEW_MESSAGE_CATEGORY"}
//             }
//           }
//         }
//       },
//     );

//     if (result.status) {
//       return Result.success(data: result.data, message: result.message);
//     } else {
//       return Result.error(message: result.message, errCode: result.errCode);
//     }
//   }
// }
