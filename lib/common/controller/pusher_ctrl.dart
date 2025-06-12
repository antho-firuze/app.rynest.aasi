import 'dart:developer';

import 'package:app.rynest.aasi/common/services/device_service.dart';
import 'package:app.rynest.aasi/common/services/notification_service.dart';
import 'package:app.rynest.aasi/common/services/talker_service.dart';
import 'package:app.rynest.aasi/env/env.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pusher_webman/pusher_webman.dart';

final _kLogName = 'PUSHER_CTRL';
final pusherProvider = StateProvider<Pusher?>((ref) => null);

enum Type { subs, unsubs }

class PusherCtrl {
  Ref ref;
  PusherCtrl(this.ref);

  late Pusher _pusher;

  void initialize() async {
    log('Initialize Pusher !');

    connect();

    ref.listen(authUserProvider, (previous, next) async {
      if (next != null) {
        final user = next;
        _privateChannel(id: user.id, type: Type.subs);
        _pusher.subscribe('presence-channel', userId: user.id.toString(), userInfo: {"name": user.username});
      } else {
        if (previous != null) {
          final user = previous;
          _privateChannel(id: user.id, type: Type.unsubs);
          _pusher.unsubscribe('presence-channel');
        }
      }
    });

    if (ref.read(authUserProvider) != null) {
      final user = ref.read(authUserProvider);
      _privateChannel(id: user?.id, type: Type.subs);
      _pusher.subscribe('presence-channel', userId: user?.id.toString(), userInfo: {"name": user?.username});
    }
  }

  void connect() async {
    _pusher = Pusher(
      url: Env.pusherUrl,
      key: Env.pusherKey,
      auth: PusherAuth(Env.pusherAuthUrl),
      connectionState: (state) {
        if (state.name == 'connected') {
          final msg = "Pusher Connected to ${Env.pusherUrl}";
          log(msg, name: _kLogName);
          ref.read(talkerProvider).info(msg);
        }
      },
      onSubscribed: (channelName) {
        final msg = "Subscribed to [$channelName]";
        log(msg, name: _kLogName);
        ref.read(talkerProvider).info(msg);
      },
      onError: (data) {
        log("Error: $data", name: _kLogName);
      },
    );

    try {
      _pusher.connect();
      _publicChannel();
    } catch (e) {
      log("Error: $e", name: _kLogName);
    }
  }

  void _publicChannel({bool showLog = true}) {
    final channel = _pusher.subscribe('public-channel');
    channel.bind('message', (event) {
      if (showLog) log("public-channel:message: $event", name: _kLogName);

      if (event != null) {
        String? title = event['title'].toString().isEmpty ? null : event['title'];
        String? message = event['message'];
        if (message != null) {
          // if (showLog) log("$title | $message", name: _kLogName);
          NotificationService.show(title: title, message: message);
        }
      }
    });
    channel.bind('promotion', (event) {
      if (showLog) log("public-channel:promotion: $event", name: _kLogName);

      if (event != null) {
        String? title = event['title'].toString().isEmpty ? null : event['title'];
        String? message = event['message'];
        if (message != null) {
          // if (showLog) log("$title | $message", name: _kLogName);
          NotificationService.show(title: title, message: message);
        }
      }
    });
  }

  void _privateChannel({int? id, Type type = Type.subs, bool showLog = true}) {
    if (id == null) return;

    if (type == Type.unsubs) {
      _pusher.unsubscribe('private-user-$id');
      return;
    }

    final channel = _pusher.subscribe('private-user-$id');
    channel.bind('message', (event) {
      if (showLog) log("private-user-$id:message: $event", name: _kLogName);

      if (event != null) {
        String? title = event['title'].toString().isEmpty ? null : event['title'];
        String? message = event['message'];
        if (message != null) {
          // if (showLog) log("$title | $message", name: _kLogName);
          NotificationService.show(title: title, message: message);
        }
      }
    });
    channel.bind('intrusion', (event) {
      if (showLog) log("private-user-$id:intrusion: $event", name: _kLogName);

      final deviceId = ref.read(deviceIdProvider);
      final deviceIdX = event['device_id'];
      if (deviceId == deviceIdX) return;

      if (event != null) {
        String? title = event['title'].toString().isEmpty ? null : event['title'];
        String? message = event['message'];
        if (message != null) {
          // if (showLog) log("$title | $message", name: _kLogName);
          NotificationService.show(title: title, message: message);
        }
      }
    });
  }
}

final pusherCtrlProvider = Provider(PusherCtrl.new);
