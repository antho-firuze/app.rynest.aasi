import 'dart:convert';

import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/helpers/api_helper.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:app.rynest.aasi/ui/shared/loading_mee.dart';

import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../app/app.locator.dart';
import 'app_service.dart';

class AuthService {
  String? username;
  String? otpEmail;
  int? otp;
  bool isRemember = false;
  Map<String, dynamic>? remember;

  // final fcmService = locator<FcmService>();
  final appService = locator<AppService>();

  Future init() async {
    // lang = await F.session.lang();

    // await setToken();
    // await setLoggedUser();
    await getRemember();
    username = await F.session.username();
  }

  Future setRemember({Map<String, dynamic>? value}) async {
    if (value != null && value.isNotEmpty) {
      await F.session.remember(value: jsonEncode(value));
      remember = value;
    } else {
      await F.session.remember(value: '');
      remember = null;
    }
  }

  Future getRemember() async {
    String jsonString = await F.session.remember();
    if (jsonString.isNotEmpty) {
      isRemember = true;
      remember = jsonDecode(jsonString);
    }
  }

  Future checkToken() async {
    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.authCheckToken);

    if (result.status) {
      return Result.success();
    } else {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await checkToken();
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future signUp({
    required String username,
    required String password,
    required String fullname,
    required String phone,
  }) async {
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.authSignUp,
      params: {
        'username': username,
        'password': password,
        'fullname': fullname,
        'phone': phone,
      },
    );

    if (result.status) {
      apiHelper.token = result.data['token'];
      return Result.success(message: result.message);
    } else {
      if (await F.isErrorNetwork(result, checkToken: false)) {
        return await signUp(
          username: username,
          password: password,
          fullname: fullname,
          phone: phone,
        );
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future signIn({
    required String username,
    required String password,
  }) async {
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.authSignIn,
      params: {
        'username': username,
        'password': password,
        'dt_client': DateTime.now().asFormatDBDateTime(),
      },
    );

    if (result.status) {
      apiHelper.token = result.data['token'];
      await F.session.token(value: result.data['token']);

      username = username.trim();
      await F.session.username(value: username.trim());

      if (isRemember) {
        await setRemember(value: {
          'username': username,
          'password': password,
        });
      } else {
        await setRemember(value: null);
      }

      // PUSHER
      // String topic = 'auth~${username.sanitize()}~${F.platform}';
      // await F.session.topicSignIn(value: topic);

      // await fcmService.publishV0(
      //   params: {
      //     'topic': topic,
      //     'title': 'Apakah Anda Login di perangkat lain ?',
      //     'message': 'Perangkat nya adalah [${appService.getPhoneInfo()}]',
      //     'data': {
      //       'category': 'authentication',
      //     },
      //   },
      // );
      // await fcmService.subscribe(topic: topic);

      return Result.success(message: result.message);
    } else {
      if (await F.isErrorNetwork(result, checkToken: false)) {
        return await signIn(username: username, password: password);
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future changePassword({
    required String password,
    required String newPassword,
  }) async {
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.authPasswordChange,
      params: {
        'password': password,
        'new_password': newPassword,
      },
    );

    if (result.status) {
      return Result.success(message: result.message);
    } else {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await changePassword(
          password: password,
          newPassword: newPassword,
        );
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future forgotPassword({required String email}) async {
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.authPasswordForgot,
      params: {
        'email': email,
      },
    );

    if (result.status) {
      otpEmail = email;
      otp = F.toInt(result.data['otp']);
      return Result.success(message: result.message);
    } else {
      if (await F.isErrorNetwork(result, checkToken: false)) {
        return await forgotPassword(email: email);
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future resetPassword({required int otp, required String password}) async {
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.authPasswordReset,
      params: {
        'otp': otp,
        'password': password,
      },
    );

    if (result.status) {
      return Result.success(message: result.message);
    } else {
      if (await F.isErrorNetwork(result, checkToken: false)) {
        return await resetPassword(otp: otp, password: password);
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future loginWithGoogleId({
    required String username,
    required String googleID,
    required String fullname,
  }) async {
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.authSignInWithGoogle,
      params: {
        'username': username,
        'google_id': googleID,
        'fullname': fullname,
      },
    );

    if (result.status) {
      apiHelper.token = result.data['token'];
      return Result.success(message: result.message);
    } else {
      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future loginWithAppleId({
    required String username,
    required String appleID,
    required String fullname,
  }) async {
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.authSignInWithApple,
      params: {
        'username': username,
        'apple_id': appleID,
        'fullname': fullname,
      },
    );

    if (result.status) {
      apiHelper.token = result.data['token'];
      return Result.success(message: result.message);
    } else {
      return Result.error(message: result.message, errCode: result.errCode);
    }
  }

  Future unRegister() async {
    LoadingMee.show();
    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.authUnregister);
    LoadingMee.dismiss();

    if (result.status) {
      return Result.success(message: result.message);
    } else {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await unRegister();
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }
  }
}
