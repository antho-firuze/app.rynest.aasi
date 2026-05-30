import 'dart:convert';
import 'dart:developer';

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/services/alert_service.dart';
import 'package:app.rynest.aasi/common/services/api_service.dart';
import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/common/services/talker_service.dart';
import 'package:app.rynest.aasi/features/auth/model/jwt_token.dart';
import 'package:app.rynest.aasi/features/auth/model/user.dart';
import 'package:app.rynest.aasi/features/auth/views/signin_view.dart';
import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:app.rynest.aasi/utils/talker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SendVia { email, sms, wa, telegram }

enum VerificationFor { email, phone, unregister }

final countDownExpired = 60 * 3;

final authTokenProvider = StateProvider<JwtToken?>((ref) => null);
final authUserProvider = StateProvider<User?>((ref) => null);

// final tokenValidProvider = StateProvider<bool>((ref) => false);

final textIdentifierProvider = StateProvider<String>((ref) => '');
final textPasswordOldProvider = StateProvider<String>((ref) => '');
final textPasswordProvider = StateProvider<String>((ref) => '');
final textPasswordConfirmProvider = StateProvider<String>((ref) => '');
final textEmailProvider = StateProvider<String>((ref) => '');
final textNameProvider = StateProvider<String>((ref) => '');
final textFullNameProvider = StateProvider<String>((ref) => '');
final textPhoneProvider = StateProvider<String>((ref) => '');
final isRememberProvider = StateProvider<bool>((ref) => false);

final verifyCodeProvider = StateProvider<String>((ref) => '');
final verifyTypeProvider = StateProvider<String>((ref) => 'email');
final countdownTimerProvider = StateProvider<int>((ref) => 60 * 3);
final isCountdownExpiredProvider = StateProvider<bool>((ref) => false);

class AuthCtrl {
  final Ref ref;
  AuthCtrl(this.ref);

  final _tokenKey = 'COOKIE_TOKEN';
  final _userKey = 'COOKIE_USER';
  final _rememberKey = 'COOKIE_REMEMBER';

  final _kLogName = 'AUTH-CTRL';

  void initialize() {
    log('Initialize Token !');

    // Load this first, because the Token & Remember are not related to anywhere
    loadToken();
    loadRemember();

    // Load this after the token is validate in Initial Controller
    // loadUser();
  }

  void loadToken() {
    try {
      log("loadToken", name: _kLogName);

      final data = ref.read(sharedPrefProvider).getString(_tokenKey);
      if (data != null) {
        final token = JwtToken.fromJson(jsonDecode(data));
        ref.read(authTokenProvider.notifier).state = token;
      } else {
        ref.read(authTokenProvider.notifier).state = null;
      }
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: loadToken", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  void setToken(JwtToken? token) {
    try {
      log("setToken", name: _kLogName);

      if (token == null) {
        ref.read(authTokenProvider.notifier).state = null;
        ref.read(sharedPrefProvider).remove(_tokenKey);
      } else {
        ref.read(authTokenProvider.notifier).state = token;
        ref.read(sharedPrefProvider).setString(_tokenKey, jsonEncode(token.toJson()));
      }
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: setToken", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<JwtToken?> refreshToken() async {
    try {
      log("refreshToken", name: _kLogName);

      final refreshToken = ref.read(authTokenProvider)?.refreshToken;

      final reqs = Reqs(path: '/api/v1/auth/refresh_token', data: {});
      final data = await ref.read(apiServiceProvider).refreshToken(reqs: reqs, refreshToken: refreshToken);

      if (data == null) return null;

      final jwtToken = JwtToken.fromJson(data);
      setToken(jwtToken);

      return jwtToken;
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: refreshToken", error: e, stackTrace: s, name: _kLogName);
      return null;
    }
  }

  void loadUser() {
    try {
      log("loadUser", name: _kLogName);

      final data = ref.read(sharedPrefProvider).getString(_userKey);
      if (data != null) {
        final user = User.fromJson(jsonDecode(data));
        ref.read(authUserProvider.notifier).state = user;
      } else {
        ref.read(authUserProvider.notifier).state = null;
      }
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: loadUser", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  void setUser(User? user) {
    try {
      log("setUser", name: _kLogName);

      if (user == null) {
        ref.read(authUserProvider.notifier).state = null;
        ref.read(sharedPrefProvider).remove(_userKey);
      } else {
        ref.read(authUserProvider.notifier).state = user;
        ref.read(sharedPrefProvider).setString(_userKey, jsonEncode(user.toJson()));
      }
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: setUser", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  void loadRemember() {
    log("loadRemember", name: _kLogName);

    final data = ref.read(sharedPrefProvider).getString(_rememberKey);
    if (data != null) {
      final remember = jsonDecode(data);
      ref.read(textIdentifierProvider.notifier).state = remember['identifier'];
      ref.read(textPasswordProvider.notifier).state = remember['password'];
      ref.read(isRememberProvider.notifier).state = true;
    } else {
      ref.read(textIdentifierProvider.notifier).state = '';
      ref.read(textPasswordProvider.notifier).state = '';
      ref.read(isRememberProvider.notifier).state = false;
    }
  }

  void setRemember(bool value) {
    log("setRemember", name: _kLogName);

    if (value) {
      ref.read(isRememberProvider.notifier).state = true;
      final remember = {"identifier": ref.read(textIdentifierProvider), "password": ref.read(textPasswordProvider)};
      ref.read(sharedPrefProvider).setString(_rememberKey, jsonEncode(remember));
    } else {
      ref.read(textIdentifierProvider.notifier).state = '';
      ref.read(textPasswordProvider.notifier).state = '';
      ref.read(isRememberProvider.notifier).state = false;
      ref.read(sharedPrefProvider).remove(_rememberKey);
    }
  }

  Future<bool> signIn() async {
    try {
      log("signIn", name: _kLogName);

      final reqs = Reqs(path: '/api/v1/auth/signin', data: {
        "identifier": ref.read(textIdentifierProvider),
        "password": ref.read(textPasswordProvider),
      });
      final data = await ref.read(apiServiceProvider).call(reqs: reqs);

      final jwtToken = JwtToken.fromJson(data);
      final user = User.fromJson(data['user']);

      setToken(jwtToken);
      setUser(user);
      setRemember(ref.read(isRememberProvider));

      return true;
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: signIn", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<bool> signUp() async {
    try {
      log("signUp", name: _kLogName);

      final reqs = Reqs(path: '/api/v1/auth/signup', data: {
        "identifier": ref.read(textIdentifierProvider),
        "email": ref.read(textEmailProvider),
        "password": ref.read(textPasswordProvider),
        "name": ref.read(textNameProvider),
        "fullname": ref.read(textFullNameProvider),
        "phone": ref.read(textPhoneProvider),
        "need_verify": false,
        "is_testing": false,
      });
      await ref.read(apiServiceProvider).call(reqs: reqs);

      return true;
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: signUp", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<void> sendForgotCode({SendVia sendVia = SendVia.email}) async {
    try {
      log("sendForgotCode", name: _kLogName);

      final reqs = Reqs(path: '/api/v1/auth/send_forgot_code', data: {
        "email": ref.read(textEmailProvider),
        "phone": ref.read(textPhoneProvider),
        "send_via": sendVia.name,
        "is_testing": false,
      });
      final data = await ref.read(apiServiceProvider).call(reqs: reqs);

      // log(state.value['verification_code']);
      ref.read(verifyCodeProvider.notifier).state = data['verification_code'];
      ref.read(verifyTypeProvider.notifier).state = 'forgot_password';
      ref.read(isCountdownExpiredProvider.notifier).state = false;
      ref.read(countdownTimerProvider.notifier).state = countDownExpired;

      await AlertService.showOk(
        body: 'Kode verifikasi telah dikirimkan silahkan anda cek !',
      );
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: sendForgotCode", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<void> sendVerificationCode() async {
    try {
      log("sendVerificationCode", name: _kLogName);

      final reqs = Reqs(path: '/api/v1/auth/send_verification_code', data: {
        "type": ref.read(verifyTypeProvider),
        "is_testing": false,
      });
      final data = await ref.read(apiServiceProvider).call(reqs: reqs);

      ref.read(verifyCodeProvider.notifier).state = data['verification_code'];
      ref.read(isCountdownExpiredProvider.notifier).state = false;
      ref.read(countdownTimerProvider.notifier).state = countDownExpired;

      await AlertService.showOk(
        body: 'Kode verifikasi telah dikirimkan silahkan anda cek !',
      );
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: sendVerificationCode", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<void> resetPwd() async {
    try {
      log("resetPwd", name: _kLogName);

      final reqs = Reqs(path: '/api/v1/auth/reset_pwd', data: {
        "email": ref.read(textEmailProvider),
        "password": ref.read(textPasswordProvider),
        "need_confirm": true,
        "is_testing": false,
      });
      await ref.read(apiServiceProvider).call(reqs: reqs);

      await AlertService.showOk(
        body: 'Berhasil, silahkan anda coba masuk dengan kode sandi terbaru !'.hardcoded,
        onOk: () {
          ref.read(goRouterProvider).pop(true);
        },
      );
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: sendVerificationCode", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<void> changePwd() async {
    try {
      log("changePwd", name: _kLogName);

      final reqs = Reqs(path: '/api/v1/auth/change_pwd', data: {
        "old_password": ref.read(textPasswordOldProvider),
        "new_password": ref.read(textPasswordProvider),
        "need_confirm": false,
        "is_testing": false,
      });
      await ref.read(apiServiceProvider).call(reqs: reqs);

      await AlertService.showOk(
        body: 'Berhasil, kode sandi sudah berubah !'.hardcoded,
        onOk: () {
          ref.read(goRouterProvider).pop(true);
        },
      );
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: changePwd", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<void> signOut({bool silence = false}) async {
    log("signOut", name: _kLogName);

    if (silence) {
      setUser(null);
      setToken(null);
      return;
    }

    await AlertService.confirm(
      body: "Anda yakin ingin keluar ?",
      onYes: () {
        setUser(null);
        setToken(null);
      },
    );
  }

  Future<void> closingAccount() async {
    try {
      log("closingAccount", name: _kLogName);

      final reqs = Reqs(path: '/api/v1/auth/closing_account', data: {
        "is_send_email_info": true,
        "is_testing": false,
      });
      await ref.read(apiServiceProvider).call(reqs: reqs);

      await AlertService.showOk(
        body: 'Akun Anda telah berhasil di non-aktifkan, silahkan cek email anda untuk informasi lebih lanjut !'
            .hardcoded,
        onOk: () {
          setUser(null);
          setToken(null);
          ref.read(pageUtilsProvider).popz();
        },
      );
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: closingAccount", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future<void> removeAccount() async {
    try {
      log("removeAccount", name: _kLogName);

      await AlertService.confirm(
        body: "Anda yakin ingin menon-aktifkan Akun Anda ?",
        onYes: () async {
          ref.read(verifyTypeProvider.notifier).state = 'unregister';
          await sendVerificationCode();
        },
      );
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error: removeAccount", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future signInCallback({required VoidCallback next}) async {
    if (ref.read(authUserProvider) == null) {
      final result = await ref.read(pageUtilsProvider).goto(page: const SignInView());
      if (result == true) {
        return next();
      }
    } else {
      return next();
    }
  }

  Future signInGoto({required Widget page, bool showLog = false}) async {
    if (ref.read(authUserProvider) == null) {
      if (showLog) log("you are not signin", name: _kLogName);
      final result = await ref.read(pageUtilsProvider).goto(page: const SignInView());
      if (result == true) {
        return await ref.read(pageUtilsProvider).goto(page: page);
      }
    } else {
      if (showLog) log("you are signed", name: _kLogName);
      return await ref.read(pageUtilsProvider).goto(page: page);
    }
  }
}

final authCtrlProvider = Provider(AuthCtrl.new);
