import 'dart:convert';
import 'dart:developer';

import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:dio/dio.dart';

class DioLoggerInterceptor implements Interceptor {
  final stopwatches = <String, Stopwatch>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = '${options.baseUrl}${options.path}';
    stopwatches[url] = Stopwatch()..start();
    log('🌍 Making request: $url', name: 'DIO');
    if (options.data != null) {
      log('🌍 Data request:', name: 'DIO');
      if (options.data is FormData) {
        log(options.data.toString(), name: 'DIO');
      } else {
        final obj = const JsonEncoder.withIndent('  ').convert(options.data);
        log(obj, name: 'DIO');
      }
    }
    if (options.queryParameters.isNotEmpty) {
      final params = const JsonEncoder.withIndent(' ').convert(options.queryParameters);
      log('🌍 Params request:', name: 'DIO');
      log(params, name: 'DIO');
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final url = '${err.requestOptions.uri}';
    _logMessageAndClearStopwatch(null, url, '❌ Received error');
    // log('❌ ${err.stackTrace}', name: 'DIO');
    if (err.response?.data != null) {
      log('❌ Response Error: ${err.response?.data}', name: 'DIO');
    }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final url = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    _logMessageAndClearStopwatch(response.statusCode, url, '⬅️ Received response');
    if (response.data != null) {
      final obj = const JsonEncoder.withIndent('  ').convert(response.data);
      log('🌍 Data response:\n $obj', name: 'DIO');
      // log(obj, name: 'DIO');
    }
    log('-------------------------', name: 'DIO');
    return handler.next(response);
  }

  void _logMessageAndClearStopwatch(int? statusCode, String url, String message) {
    final stopwatch = stopwatches[url];
    if (stopwatch != null) {
      stopwatch.stop();
      _logResponse(statusCode, stopwatch.elapsedMilliseconds, url, message);
      if (stopwatch.elapsed > const Duration(seconds: 7)) {
        log('❌ Connection Timed Out', name: 'DIO');
        SnackBarService.show(message: '❌ Seems that the server is busy, please try again later !');
      }
      stopwatches.remove(url);
    } else {
      log(message, name: 'DIO');
    }
  }

  void _logResponse(int? statusCode, int milliseconds, String url, String message) {
    final emoji =
        switch (statusCode) { != null && >= 200 && < 300 => '✅', != null && >= 300 && < 400 => '🟠', _ => '❌' };
    log(message, name: 'DIO');
    if (statusCode != null) {
      log('$emoji $statusCode $emoji | ${milliseconds}ms | $url', name: 'DIO');
    } else {
      log('$emoji | ${milliseconds}ms | $url', name: 'DIO');
    }
  }
}
