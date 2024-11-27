import 'dart:developer';

import 'package:app.rynest.aasi/common/model/resp.dart';
import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:dio/dio.dart';

class DioJsonRpcResponseInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final resp = Resp.fromJson(response.data);
    if (resp.hasError()) {
      final errCode = resp.error != null
          ? resp.error?.code != null
              ? "[${resp.error?.code}]"
              : ''
          : '';
      final errMessage = resp.error != null && resp.error!.message != null ? resp.error!.message : resp.message;
      final message = "$errCode $errMessage";

      DioException err = DioException(requestOptions: response.requestOptions, error: resp.error, message: message);
      SnackBarService.show(message: message);
      log('❌ With error');
      log('❌ $message');
      return handler.reject(err);
    } else {
      return handler.next(response);
    }
  }
}
