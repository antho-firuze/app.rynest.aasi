import 'package:app.rynest.aasi/utils/dio_auth_interceptor.dart';
import 'package:app.rynest.aasi/utils/dio_busy_interceptor.dart';
import 'package:app.rynest.aasi/utils/dio_jsonrpc_response_interceptor.dart';
import 'package:app.rynest.aasi/utils/dio_logger_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final busyProvider = StateProvider<bool>((ref) => false);

final dioProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);
  dio.options.connectTimeout = const Duration(seconds: 10);

  // dio.interceptors.add(DioLoggerInterceptor());
  // dio.interceptors.add(DioBusyInterceptor(ref));
  return dio;
});

final dioApiProvider = Provider.autoDispose((ref) {
  final dio = ref.read(dioProvider);

  dio.interceptors.add(DioLoggerInterceptor());
  dio.interceptors.add(DioJsonRpcResponseInterceptor(ref));
  // dio.interceptors.add(DioAuthInterceptor(ref));
  return dio;
});

final dioApiFileUploadProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);

  dio.interceptors.add(DioLoggerInterceptor());
  dio.interceptors.add(DioBusyInterceptor(ref));
  dio.interceptors.add(DioAuthInterceptor(ref));

  dio.options.headers['Content-Type'] = 'multipart/form-data';

  return dio;
});

final dioFileDownloadProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  dio.interceptors.add(DioLoggerInterceptor());
  dio.options.responseType = ResponseType.bytes;
  dio.options.followRedirects = false;
  dio.options.validateStatus = (status) => status! < 500;

  return dio;
});

// final dioOptionBytesProvider = Provider((ref) {
//   return Options(
//     responseType: ResponseType.bytes,
//     followRedirects: false,
//     validateStatus: (status) => status! < 500,
//   );
// });

// final dioOptionRefreshTokenProvider = Provider.autoDispose((ref) {
//   final options = Options();
//   JwtToken? token = ref.watch(authTokenProvider);
//   options.headers = {HttpHeaders.authorizationHeader: "Bearer ${token?.refreshToken}"};
//   return options;
// });

final dioStreamProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);

  dio.interceptors.add(DioLoggerInterceptor());
  dio.interceptors.add(DioAuthInterceptor(ref));

  dio.options.headers['Cache-Control'] = 'no-cache';
  dio.options.headers['Accept'] = 'text/event-stream';
  dio.options.headers['Content-Type'] = 'text/event-stream';
  dio.options.responseType = ResponseType.stream;
  return dio;
});

final dioIsValidUrlProvider = FutureProvider.autoDispose.family<bool, String?>((ref, url) async {
  final dio = Dio();

  if (url == null) {
    return false;
  }

  var type = url.substring(0, 4).toLowerCase();
  if (type != 'http') {
    return false;
  }

  final state = await AsyncValue.guard(() async => await dio.get(url));

  return !state.hasError;
});
