import 'dart:io';
import 'dart:math';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/constants/backend.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:app.rynest.aasi/ui/shared/loading_mee.dart';
import 'package:dio/dio.dart';
import 'package:get/utils.dart';
import 'package:logger/logger.dart';

import '../services/sharedpreferences_service.dart';

class ApiHelper {
  final Logger log = Logger();

  String token = '';
  String language = 'id';
  String agent = Platform.isAndroid ? 'android' : 'ios';

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: endPointUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    ),
  );

  final sessionService = locator<SharedPreferencesService>();

  var logEndPoint = {
    'baseUrl': endPointUrl,
    'connectTimeout': connectTimeout,
    'receiveTimeout': receiveTimeout,
  };

  Future init() async {
    token = await sessionService.token();
    language = await sessionService.lang();
  }

  Future callAPIJsonRPC({
    required String method,
    Map<String, dynamic>? params,
    String? filePath,
  }) async {
    try {
      dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';

      FormData? formData;
      Map<String, dynamic> payload = {
        'id': Random().nextInt(99999),
        'lang': language,
        'agent': agent,
        'method': method,
        'token': token,
      };
      if (params != null && params.isNotEmpty) {
        payload['params'] = params;
      }
      if (filePath != null && filePath.isNotEmpty) {
        dio.options.headers['Content-Type'] = 'multipart/form-data';

        payload['userfile'] = await MultipartFile.fromFile(filePath);
        formData = FormData.fromMap(payload);
      }

      logEndPoint['headers'] = dio.options.headers;
      logEndPoint['payload'] = payload;
      log.d(logEndPoint);

      Response response = await dio.post('', data: formData ?? payload);

      log.i(response.data);

      if (response.data['status']) {
        return Result.success(
          data: response.data['result'],
          message: response.data['message'],
        );
      } else {
        return Result.error(
          message: response.data['error']['message'],
          errCode: '${response.data['error']['code']}',
        );
      }
    } catch (e) {
      // Trapping Error from external factor #2 (NETWORK ERROR)
      List<dynamic> errs = handleErrorRequest(e);
      log.e("errCode: ${errs[0]} \nerrMessage: ${errs[1]} ()");

      return Result.error(message: errs[1], errCode: errs[0]);
    }
  }

  Future callAPICDN({
    required Map<String, dynamic> params,
    String? filePath,
  }) async {
    try {
      FormData? formData;
      Map<String, dynamic> payload = params;

      if (filePath != null && filePath.isNotEmpty) {
        dio.options.headers['Content-Type'] = 'multipart/form-data';

        payload['userfile'] = await MultipartFile.fromFile(filePath);
        formData = FormData.fromMap(payload);
      }

      log.d(payload);

      LoadingMee.show();

      Response response =
          await dio.post(endPointCDNUrl, data: formData ?? payload);

      LoadingMee.dismiss();

      log.i(response.data);

      if (response.data['status']) {
        return Result.success(
          data: {
            'link': response.data['link'],
            'base': response.data['base'],
            'path': response.data['path'],
            'file': response.data['file'],
          },
          message: '',
        );
      } else {
        return Result.error(
          message: response.data['error']['message'],
          errCode: '${response.data['error']['code']}',
        );
      }
    } catch (e) {
      // Trapping Error from external factor #2 (NETWORK ERROR)
      List<dynamic> errs = handleErrorRequest(e);
      log.e("errCode: ${errs[0]} \nerrMessage: ${errs[1]} ()");
      return Result.error(message: errs[1], errCode: errs[0]);
    }
  }

  Future callAPIToFCM({
    required String endPoint,
    required Map<String, dynamic> headers,
    required Map<String, dynamic> params,
  }) async {
    try {
      Map<String, dynamic> payload = params;

      log.d(payload);

      Response response = await dio.post(
        endPoint,
        data: payload,
        options: Options(headers: headers),
      );

      log.i(response.data);

      return Result.success(
        data: response.data,
        message: response.statusMessage!,
      );
    } catch (e) {
      // Trapping Error from external factor #2 (NETWORK ERROR)
      // List<dynamic> errs = handleErrorRequest(e);
      log.e(e);
      return Result.error(message: 'error', errCode: '000000');
      // log.e("errCode: ${errs[0]} \nerrMessage: ${errs[1]} ()");
      // return Result.error(message: errs[1], errCode: errs[0]);
    }
  }

  // Error handle request
  List<String> handleErrorRequest(dynamic error) {
    String errorCode = '999999999';
    String errorDescription = "";
    if (error is int) {
      errorCode = error.toString();
      switch (error) {
        case 400:
          errorDescription = "400 Bad Request";
          break;
        case 401:
          errorDescription = "401 Unauthorized";
          break;
        case 403:
          errorDescription = "403 Forbidden";
          break;
        case 404:
          errorDescription = "404 Not Found";
          break;
        case 500:
          errorDescription = "500 Internal Server Error";
          break;
        case 502:
          errorDescription = "502 Bad Gateway";
          break;
        case 503:
          errorDescription = "503 Service Unavailable";
          break;
        case 504:
          errorDescription = "504 Gateway Timeout";
          break;
        default:
          errorDescription = "$error Unexpected error occured";
      }
    } else if (error is DioException) {
      // switch (error.type) {
      //   case DioErrorType.connectTimeout:
      //     errorDescription = "Connection timeout with API server";
      //     break;
      //   case DioErrorType.sendTimeout:
      //     errorDescription = "Send timeout in connection with API server";
      //     break;
      //   case DioErrorType.receiveTimeout:
      //     errorDescription = "Receive timeout in connection with API server";
      //     break;
      //   case DioErrorType.response:
      //     errorDescription =
      //         "Received invalid status code: ${error.response!.statusCode}";
      //     break;
      //   case DioErrorType.cancel:
      //     errorDescription = "Request to API server was cancelled";
      //     break;
      //   case DioErrorType.other:
      //     errorDescription =
      //         "Connection to API server failed due to internet connection";
      //     break;
      // }
      switch (error.type) {
        case DioExceptionType.cancel:
          errorDescription = "error_api_cancel".tr;
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = "error_api_recvtimeout".tr;
          break;
        case DioExceptionType.sendTimeout:
          errorDescription = "error_api_sendtimeout".tr;
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = "error_api_conntimeout".tr;
          break;
        case DioExceptionType.badCertificate:
          errorDescription = "error_api_other".tr;
          break;
        case DioExceptionType.badResponse:
          errorDescription = "error_api_recvtimeout".tr;
          break;
        case DioExceptionType.connectionError:
          errorDescription = "error_api_conntimeout".tr;
          break;
        case DioExceptionType.unknown:
          errorDescription = "error_api_other".tr;
          break;
      }
      if (error.response != null) {
        errorCode = error.response!.statusCode.toString();
        errorDescription = error.response!.data['message'];
      }
    } else {
      errorDescription = error.message;
    }
    return [errorCode, errorDescription];
  }
}

final apiHelper = ApiHelper();

class ApiMethod {
  String appCheckVersion = 'app.check_version';
  String appUpdateDeviceInfo = 'app.update_device_info';
  String appSendNotification = 'app.send_notification';

  String authCheckToken = 'auth.check_token';
  String authSignIn = 'auth.login';
  String authSignInWithGoogle = 'auth.login_with_google_id';
  String authSignInWithApple = 'auth.login_with_apple_id';
  String authSignUp = 'auth.register';
  String authSendOTP = 'auth.send_otp';
  String authPasswordChange = 'auth.password_change';
  String authPasswordForgot = 'auth.password_forgot';
  String authPasswordReset = 'auth.password_reset';
  String authUnregister = 'auth.unregister';

  String memberActivate = 'member3.activate';
  String memberProfile = 'member3.profile';
  String memberProfileEdit = 'member3.profile_edit';
  String memberSchedule = 'member3.schedule';
  String memberCertificate = 'member3.certificate';
  String memberUploadSelfie = 'member3.upload_photo_selfie';
  String memberUploadIDCard = 'member3.upload_photo_idcard';
  String memberUploadExamStart = 'member3.upload_photo_exam_start';
  String memberUploadExamRandom1 = 'member3.upload_photo_exam_random1';
  String memberUploadExamRandom2 = 'member3.upload_photo_exam_random2';
  String memberUploadExamFinish = 'member3.upload_photo_exam_finish';

  String examStatus = 'exam3.status';
  String examStart = 'exam3.start';
  String examFinish = 'exam3.finish';
  String examAnswer = 'exam3.answer';
  String examRepeat = 'exam3.repeat';
  String examResult = 'exam3.result';
  String examQuestions = 'exam3.questions';
  String examPhotos = 'exam3.photos';
}

final apiMethod = ApiMethod();
