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
    log('🌍 Making request: $url');
    if (options.data != null) {
      final obj = const JsonEncoder.withIndent('  ').convert(options.data);
      log('🌍 Data:');
      log(obj);
    }
    if (options.queryParameters.isNotEmpty) {
      final params = const JsonEncoder.withIndent(' ').convert(options.queryParameters);
      log('🌍 Params:');
      log(params);
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final url = '${err.requestOptions.uri}';
    _logMessageAndClearStopwatch(null, url, '❌ Received error');
    log('❌ ${err.stackTrace}');
    if (err.response?.data != null) {
      log('❌ Response Error: ${err.response?.data}');
    }
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final url = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    _logMessageAndClearStopwatch(response.statusCode, url, '⬅️ Received response');
    log("${response.data}");
    log('-------------------------');
    return handler.next(response);
  }

  void _logMessageAndClearStopwatch(int? statusCode, String url, String message) {
    final stopwatch = stopwatches[url];
    if (stopwatch != null) {
      stopwatch.stop();
      _logResponse(statusCode, stopwatch.elapsedMilliseconds, url, message);
      if (stopwatch.elapsed > const Duration(seconds: 7)) {
        log('❌ Connection Timed Out');
        SnackBarService.show(message: '❌ Seems that the server is busy, please try again later !');
      }
      stopwatches.remove(url);
    } else {
      log(message);
    }
  }

  void _logResponse(int? statusCode, int milliseconds, String url, String message) {
    final emoji =
        switch (statusCode) { != null && >= 200 && < 300 => '✅', != null && >= 300 && < 400 => '🟠', _ => '❌' };
    log(message);
    if (statusCode != null) {
      log('$emoji $statusCode $emoji | ${milliseconds}ms | $url');
    } else {
      log('$emoji | ${milliseconds}ms | $url');
    }
  }
}
