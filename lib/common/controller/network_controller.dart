import 'dart:developer';

import 'package:app.rynest.aasi/common/services/network_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isConnectedProvider = StateProvider<bool>((ref) => false);
final wifiIPv4Provider = StateProvider<String>((ref) => '*.*.*.*');
final wifiNameProvider = StateProvider<String>((ref) => '');
final wifiBSSIDProvider = StateProvider<String>((ref) => '');
final wifiGatewayIPProvider = StateProvider<String>((ref) => '');
final wifiBroadcastProvider = StateProvider<String>((ref) => '');
final wifiSubmaskProvider = StateProvider<String>((ref) => '');

final checkDataAvailableStreamProvider = StreamProvider<void>((ref) async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 5));

    ref.read(isConnectedProvider.notifier).state = await ref.read(networkServiceProvider).checkDataAvailable();
  }
});

class NetworkCtrl {
  Ref ref;
  NetworkCtrl(this.ref);

  void initialize() {
    log('Initialize Network Info & Connection !');
    networkConnectivityListen();
    // getNetworkInfo();
    // ref.watch(checkDataAvailableStreamProvider);
  }

  void networkConnectivityListen() async {
    Connectivity().onConnectivityChanged.listen((event) async {
      if (event.contains(ConnectivityResult.wifi) || event.contains(ConnectivityResult.mobile)) {
        ref.read(isConnectedProvider.notifier).state = await ref.read(networkServiceProvider).checkDataAvailable();
      } else if (event.contains(ConnectivityResult.none)) {
        ref.read(isConnectedProvider.notifier).state = false;
      }
    });
  }

  void getNetworkInfo() async {
    ref.read(wifiIPv4Provider.notifier).state = await ref.read(networkServiceProvider).getWifiIP();
    ref.read(wifiNameProvider.notifier).state = await ref.read(networkServiceProvider).getWifiName();
    ref.read(wifiBSSIDProvider.notifier).state = await ref.read(networkServiceProvider).getWifiBSSID();
    ref.read(wifiGatewayIPProvider.notifier).state = await ref.read(networkServiceProvider).getWifiGatewayIP();
    ref.read(wifiBroadcastProvider.notifier).state = await ref.read(networkServiceProvider).getWifiBroadcast();
    ref.read(wifiSubmaskProvider.notifier).state = await ref.read(networkServiceProvider).getWifiSubmask();
  }
}

final networkCtrlProvider = Provider(NetworkCtrl.new);
