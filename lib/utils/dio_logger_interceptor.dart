import 'dart:convert';
import 'dart:developer';
import 'dart:math' show Random;

import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:dio/dio.dart';

class DioLoggerInterceptor implements Interceptor {
  final _kLogName = 'DIO-LOGGER';
  final showLog = true;

  final stopwatches = <String, Stopwatch>{};
  final uniqueReqs = <String, int>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = '${options.baseUrl}${options.path}';
    final uniqueId = Random().nextInt(1000) + 77;
    uniqueReqs[url] = uniqueId;
    stopwatches[url] = Stopwatch()..start();
    if (showLog) log('🌍 Making request [$uniqueId] : $url', name: _kLogName);
    if (options.data != null) {
      if (showLog) log('🌍 Data request:', name: _kLogName);
      if (options.data is FormData) {
        if (showLog) log(options.data.toString(), name: _kLogName);
      } else {
        final obj = const JsonEncoder.withIndent('  ').convert(options.data);
        if (showLog) log(obj, name: _kLogName);
      }
    }
    if (options.queryParameters.isNotEmpty) {
      final params = const JsonEncoder.withIndent(' ').convert(options.queryParameters);
      if (showLog) log('🌍 Params request:', name: _kLogName);
      if (showLog) log(params, name: _kLogName);
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final url = '${err.requestOptions.uri}';
    _logMessageAndClearStopwatch(null, url, '❌ Received error', null);
    // if (showLog) log('❌ ${err.stackTrace}', name: _kLogName);
    if (err.response?.data != null) {
      if (showLog) log('❌ Response Error: ${err.response?.data}', name: _kLogName);
    }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final url = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    _logMessageAndClearStopwatch(response.statusCode, url, '⬅️ Received response', response.data);
    return handler.next(response);
  }

  void _logMessageAndClearStopwatch(int? statusCode, String url, String message, dynamic data) {
    final stopwatch = stopwatches[url];
    final uniqueId = uniqueReqs[url];
    if (stopwatch != null) {
      stopwatch.stop();
      _logResponse(statusCode, stopwatch.elapsedMilliseconds, url, "$message [$uniqueId]", data);
      if (stopwatch.elapsed > const Duration(seconds: 7)) {
        if (showLog) log('❌ Connection Timed Out', name: _kLogName);
        SnackBarService.show(message: '❌ Seems that the server is busy, please try again later !');
      }
      stopwatches.remove(url);
      uniqueReqs.remove(url);
    }
  }

  void _logResponse(int? statusCode, int milliseconds, String url, String message, dynamic data) {
    final emoji =
        switch (statusCode) { != null && >= 200 && < 300 => '✅', != null && >= 300 && < 400 => '🟠', _ => '❌' };
    if (statusCode != null) {
      if (showLog) log('$message | $emoji $statusCode $emoji | ${milliseconds}ms | $url', name: _kLogName);
      if (data != null) {
        final obj = const JsonEncoder.withIndent('  ').convert(data);
        if (showLog) log('🌍 Data response: $url \n$obj\n-------------------------', name: _kLogName);
      }
    } else {
      if (showLog) log('$message | $emoji | ${milliseconds}ms | $url', name: _kLogName);
    }
  }
}
