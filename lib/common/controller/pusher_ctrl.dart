import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pusher_webman/pusher_webman.dart';

final pusherProvider = StateProvider<Pusher?>((ref) => null);

void init() async {
  Pusher _pusher = Pusher(
    url: 'ws://192.168.18.234:3131',
    key: "ac824d4958a5fe8a9553b90c28560f91",
    auth: PusherAuth('http://192.168.18.234/api/v1/pusher/auth'),
    connectionState: (state) {
      log(state.name);
    },
    onSubscribed: (channelName) {
      log("Subscribed to [$channelName]");
    },
    onError: (data) {
      log("Error: $data");
    },
  );
  _pusher.connect();
}
