import 'dart:developer';
import 'dart:io';

import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/auth/model/jwt_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioAuthInterceptor implements Interceptor {
  final Ref ref;
  DioAuthInterceptor(this.ref);

  final _kLogName = 'DIO-AUTH';
  final showLog = false;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    JwtToken? token = ref.read(authTokenProvider);
    if (showLog) log("token : $token", name: _kLogName);
    if (token != null) {
      if (token.refreshToken != null && token.hasExpired()) {
        if (showLog) log("token has expired", name: _kLogName);
        token = await ref.read(authCtrlProvider).refreshToken();
      }

      if (showLog) log("new token : ${token?.accessToken}", name: _kLogName);

      options.headers.putIfAbsent(HttpHeaders.authorizationHeader, () => "Bearer ${token?.accessToken}");
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
