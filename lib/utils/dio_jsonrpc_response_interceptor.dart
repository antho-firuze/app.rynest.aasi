import 'dart:developer';

import 'package:app.rynest.aasi/common/model/resp.dart';
import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioJsonRpcResponseInterceptor implements Interceptor {
  final Ref ref;
  DioJsonRpcResponseInterceptor(this.ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final resp = response.data != null ? Resp.fromJson(response.data) : null;
    if (resp != null && resp.hasError()) {
      final errCode = resp.error != null
          ? resp.error?.code != null
              ? "[${resp.error?.code}]"
              : ''
          : '';
      final errMessage = resp.error != null && resp.error!.message != null ? resp.error!.message : resp.message;
      final message = "$errCode $errMessage";

      DioException err = DioException(requestOptions: response.requestOptions, error: resp.error, message: message);
      SnackBarService.show(message: message);
      log('❌ With error', name: 'DIO-JSONRPC');
      log('❌ $message', name: 'DIO-JSONRPC');

      // IF ERROR = 9000 : DUPLICATE LOGIN/SIGNIN
      if (resp.error?.code == 9000) {
        await ref.read(authCtrlProvider).signOut(silence: true);
      }

      return handler.reject(err);
    } else {
      return handler.next(response);
    }
  }
}
