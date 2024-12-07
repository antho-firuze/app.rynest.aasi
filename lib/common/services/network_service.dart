import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkService {
  final Ref ref;
  NetworkService(this.ref);

  final NetworkInfo _networkInfo = NetworkInfo();

  Future<bool> checkDataAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log(':: checkDataAvailable => true', name: 'NETWORK-SERVICE');
        return true;
      }

      log(':: checkDataAvailable => false', name: 'NETWORK-SERVICE');
      return false;
    } catch (e) {
      log(':: checkDataAvailable => false', name: 'NETWORK-SERVICE');
      return false;
    }
  }

  Future<String> getWifiIP() async {
    try {
      var result = await _networkInfo.getWifiIP() ?? '*.*.*.*';
      log(':: getWifiIP => $result', name: 'NETWORK-SERVICE');
      return result;
    } on PlatformException catch (e) {
      log(':: getWifiIP => Failed to get Wifi Name', error: e, name: 'NETWORK-SERVICE');
      return e.toString();
    }
  }

  Future<String> getWifiName() async {
    try {
      var result = await _networkInfo.getWifiName() ?? '';
      log(':: getWifiName => $result', name: 'NETWORK-SERVICE');
      return result;
    } on PlatformException catch (e) {
      log(':: getWifiName => Failed to get Wifi Name', error: e, name: 'NETWORK-SERVICE');
      return e.toString();
    }
  }

  Future<String> getWifiBSSID() async {
    try {
      var result = await _networkInfo.getWifiBSSID() ?? '';
      log(':: getWifiBSSID => $result', name: 'NETWORK-SERVICE');
      return result;
    } on PlatformException catch (e) {
      log(':: getWifiBSSID => Failed to get Wifi BSSID', error: e, name: 'NETWORK-SERVICE');
      return e.toString();
    }
  }

  Future<String> getWifiSubmask() async {
    try {
      var result = await _networkInfo.getWifiSubmask() ?? '';
      log(':: getWifiSubmask => $result', name: 'NETWORK-SERVICE');
      return result;
    } on PlatformException catch (e) {
      log(':: getWifiSubmask => Failed to get Wifi Submask', error: e, name: 'NETWORK-SERVICE');
      return e.toString();
    }
  }

  Future<String> getWifiBroadcast() async {
    try {
      var result = await _networkInfo.getWifiBroadcast() ?? '';
      log(':: getWifiBroadcast => $result', name: 'NETWORK-SERVICE');
      return result;
    } on PlatformException catch (e) {
      log(':: getWifiBroadcast => Failed to get Wifi Broadcast', error: e, name: 'NETWORK-SERVICE');
      return e.toString();
    }
  }

  Future<String> getWifiGatewayIP() async {
    try {
      var result = await _networkInfo.getWifiGatewayIP() ?? '';
      log(':: getWifiGatewayIP => $result', name: 'NETWORK-SERVICE');
      return result;
    } on PlatformException catch (e) {
      log(':: getWifiGatewayIP => Failed to get Wifi Gateway IP', error: e, name: 'NETWORK-SERVICE');
      return e.toString();
    }
  }

  // Future<InternetAddress> retrieveIPAddress() async {
  //   int code = Random().nextInt(255);
  //   var dgSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  //   dgSocket.readEventsEnabled = true;
  //   dgSocket.broadcastEnabled = true;
  //   Future<InternetAddress> ret =
  //       dgSocket.timeout(const Duration(milliseconds: 100), onTimeout: (sink) {
  //     sink.close();
  //   }).expand<InternetAddress>((event) {
  //     if (event == RawSocketEvent.read) {
  //       Datagram? dg = dgSocket.receive();
  //       if (dg != null && dg.data.length == 1 && dg.data[0] == code) {
  //         dgSocket.close();
  //         return [dg.address];
  //       }
  //     }
  //     return [];
  //   }).firstWhere((InternetAddress a) => a != null);

  //   dgSocket.send([code], InternetAddress("255.255.255.255"), dgSocket.port);
  //   // log('IP Address = ${ret}');
  //   ret.then((value) {
  //     log(value.address);
  //   });
  //   log('Port = ${dgSocket.port}');
  //   return ret;
  // }
}

final networkServiceProvider = Provider(NetworkService.new);
