import 'dart:developer';

import 'package:app.rynest.aasi/common/services/notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allowNotificationProvider = StateProvider<bool>((ref) => false);

class NotificationCtrl {
  Ref ref;
  NotificationCtrl(this.ref);

  void initialize() async {
    log('Initialize Notification !');

    final result = await NotificationService().requestPermission();
    ref.read(allowNotificationProvider.notifier).state = result ?? false;
  }
}

final notificationCtrlProvider = Provider(NotificationCtrl.new);
