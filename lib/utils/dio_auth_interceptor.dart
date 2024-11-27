
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioAuthInterceptor implements Interceptor {
  final Ref ref;
  DioAuthInterceptor(this.ref);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // JwtToken? token = ref.read(authCtrlProvider).getToken();
    // if (token?.refreshToken != null && token!.hasExpired()) {
    //   token = await ref.read(authCtrlProvider).refreshToken();
    // }

    // options.headers.putIfAbsent(HttpHeaders.authorizationHeader, () => "Bearer ${token?.accessToken}");
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
