import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'F.dart';

late FlutterLocalNotificationsPlugin localNotification;
bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }

  localNotification = FlutterLocalNotificationsPlugin();

  await NotificationHelper().requestPermission();
  await NotificationHelper().initializeSettings();

  isFlutterLocalNotificationsInitialized = true;
}

// void showFlutterNotification(RemoteMessage message) async {
//   RemoteNotification? notification = message.notification;
//   final details = await NotificationHelper().notificationDetails();
//   // AndroidNotification? android = message.notification?.android;
//   // IOSNotificationDetails? ios = const IOSNotificationDetails(
//   //   presentAlert: true,
//   //   presentBadge: true,
//   //   presentSound: true,
//   //   threadIdentifier: 'thread_id',
//   // );
//   // if (notification != null && android != null && !kIsWeb) {
//   if (notification != null) {
//     localNotification.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       details,
//     );
//   }
// }

class NotificationHelper {
  Future requestPermission() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await localNotification
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await localNotification
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          localNotification.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      await androidImplementation?.areNotificationsEnabled();
      // await androidImplementation?.requestPermission();
    }
  }

  Future initializeSettings() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification: (
              int id,
              String? title,
              String? body,
              String? payload,
            ) async {
              F.log.d('id $id');
              // didReceiveLocalNotificationSubject.add(
              //   ReceivedNotification(
              //     id: id,
              //     title: title,
              //     body: body,
              //     payload: payload,
              //   ),
              // );
            });

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await localNotification.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        F.log.i(details.payload);
      },
    );
  }

  Future<NotificationDetails> notificationDetails() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  static show({String? title, String? message}) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails();

    final details = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
    await localNotification.show(0, title, message, details);
  }
}
