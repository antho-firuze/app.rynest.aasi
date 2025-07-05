import 'package:app.rynest.aasi/common/services/talker_service.dart';
import 'package:app.rynest.aasi/utils/dio_auth_interceptor.dart';
import 'package:app.rynest.aasi/utils/dio_busy_interceptor.dart';
import 'package:app.rynest.aasi/utils/talker_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

final _kLogName = 'DIO-SERVICE';

// DIO WITHOUT TOKEN
// =======================
final dioProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.interceptors.add(
    TalkerDioLogger(
      talker: ref.read(talkerProvider),
      settings: TalkerDioLoggerSettings(
        printResponseTime: true,
      ),
    ),
  );

  return dio;
});

// DIO WITH JWT-TOKEN
// ==================================
final dioJWTTokenProvider = Provider.family.autoDispose<Dio, bool>((ref, showLog) {
  final dio = Dio();

  // ref.onDispose(dio.close);
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.interceptors.add(DioAuthInterceptor(ref));
  if (showLog) {
    dio.interceptors.add(
      TalkerDioLogger(
        talker: ref.read(talkerProvider),
        settings: TalkerDioLoggerSettings(
          // printRequestHeaders: true,
          // printResponseHeaders: true,
          printResponseTime: true,
        ),
      ),
    );
  }

  return dio;
});

// DIO FOR API FILE UPLOAD WITH JWT-TOKEN
// ======================================
final dioJWTTokenUploadProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);
  dio.interceptors.add(DioBusyInterceptor(ref));
  dio.interceptors.add(DioAuthInterceptor(ref));
  dio.interceptors.add(
    TalkerDioLogger(
      talker: ref.read(talkerProvider),
      settings: TalkerDioLoggerSettings(
        // printRequestHeaders: true,
        // printResponseHeaders: true,
        printResponseTime: true,
      ),
    ),
  );

  dio.options.headers['Content-Type'] = 'multipart/form-data';

  return dio;
});

// DIO FOR FILE DOWNLOAD
// =======================
final dioFileDownloadProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);
  dio.interceptors.add(
    TalkerDioLogger(
      talker: ref.read(talkerProvider),
      settings: TalkerDioLoggerSettings(
        // printRequestHeaders: true,
        // printResponseHeaders: true,
        printResponseData: false,
        printResponseTime: true,
      ),
    ),
  );
  dio.options.responseType = ResponseType.bytes;
  dio.options.followRedirects = false;
  dio.options.validateStatus = (status) => status! < 500;

  return dio;
});

// DIO FOR WEBSOCKET CONNECTION WITH JWT-TOKEN
// ===========================================
final dioJWTTokenStreamProvider = Provider.autoDispose((ref) {
  final dio = Dio();

  // ref.onDispose(dio.close);
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.interceptors.add(
    TalkerDioLogger(
      talker: ref.read(talkerProvider),
      settings: TalkerDioLoggerSettings(
        // printRequestHeaders: true,
        // printResponseHeaders: true,
        printResponseTime: true,
      ),
    ),
  );
  dio.interceptors.add(DioAuthInterceptor(ref));

  dio.options.headers['Cache-Control'] = 'no-cache';
  dio.options.headers['Accept'] = 'text/event-stream';
  dio.options.headers['Content-Type'] = 'text/event-stream';
  dio.options.responseType = ResponseType.stream;
  return dio;
});

// DIO FOR CHECK LINK/URL VALIDITY
// ======================================
final dioIsValidUrlProvider = FutureProvider.autoDispose.family<bool, String?>((ref, url) async {
  try {
    final dio = Dio();

    if (url == null) return false;

    var type = url.substring(0, 4).toLowerCase();
    if (type != 'http') return false;

    final response = await dio.get(url);
    if (response.statusCode != 200) return false;

    return true;
  } catch (e, s) {
    ref.read(talkerProvider).errx("Error : dioIsValidUrlProvider", error: e, stackTrace: s, name: _kLogName);
    rethrow;
  }
});
