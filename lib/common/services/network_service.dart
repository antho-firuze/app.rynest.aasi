import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkService {
  final Ref ref;
  NetworkService(this.ref);

  final _kLogName = 'NETWORK-SERVICE';
  final _showLog = false;

  final NetworkInfo _networkInfo = NetworkInfo();

  Future<bool> checkDataAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (_showLog) log(':: checkDataAvailable => true', name: _kLogName);
        return true;
      }

      if (_showLog) log(':: checkDataAvailable => false', name: _kLogName);
      return false;
    } catch (e) {
      if (_showLog) log(':: checkDataAvailable => false', name: _kLogName);
      return false;
    }
  }

  Future<String> getWifiIP() async {
    try {
      var result = await _networkInfo.getWifiIP() ?? '*.*.*.*';
      if (_showLog) log(':: getWifiIP => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      if (_showLog) log(':: getWifiIP => Failed to get Wifi Name', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiName() async {
    try {
      var result = await _networkInfo.getWifiName() ?? '';
      if (_showLog) log(':: getWifiName => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      if (_showLog) log(':: getWifiName => Failed to get Wifi Name', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiBSSID() async {
    try {
      var result = await _networkInfo.getWifiBSSID() ?? '';
      if (_showLog) log(':: getWifiBSSID => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      if (_showLog) log(':: getWifiBSSID => Failed to get Wifi BSSID', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiSubmask() async {
    try {
      var result = await _networkInfo.getWifiSubmask() ?? '';
      if (_showLog) log(':: getWifiSubmask => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      if (_showLog) log(':: getWifiSubmask => Failed to get Wifi Submask', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiBroadcast() async {
    try {
      var result = await _networkInfo.getWifiBroadcast() ?? '';
      if (_showLog) log(':: getWifiBroadcast => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      if (_showLog) log(':: getWifiBroadcast => Failed to get Wifi Broadcast', error: e, name: _kLogName);
      return e.toString();
    }
  }

  Future<String> getWifiGatewayIP() async {
    try {
      var result = await _networkInfo.getWifiGatewayIP() ?? '';
      if (_showLog) log(':: getWifiGatewayIP => $result', name: _kLogName);
      return result;
    } on PlatformException catch (e) {
      if (_showLog) log(':: getWifiGatewayIP => Failed to get Wifi Gateway IP', error: e, name: _kLogName);
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
  //   // if (_showLog) log('IP Address = ${ret}');
  //   ret.then((value) {
  //     if (_showLog) log(value.address);
  //   });
  //   if (_showLog) log('Port = ${dgSocket.port}');
  //   return ret;
  // }
}

final networkServiceProvider = Provider(NetworkService.new);
