import 'dart:convert';
import 'dart:developer';

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/services/alert_service.dart';
import 'package:app.rynest.aasi/common/services/jsonrpc_service.dart';
import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:app.rynest.aasi/features/auth/model/user.dart';
import 'package:app.rynest.aasi/features/auth/views/signin_view.dart';
import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTokenProvider = StateProvider<String?>((ref) => null);
final authUserProvider = StateProvider<User?>((ref) => null);

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

  void initialize() {
    log('Initialize User & Token !');

    loadToken();
    loadUser();
    loadRemember();
  }

  void loadToken() {
    final data = ref.read(sharedPrefProvider).getString(_tokenKey);
    if (data != null) {
      ref.read(authTokenProvider.notifier).state = data;
    } else {
      ref.read(authTokenProvider.notifier).state = null;
    }
  }

  void setToken(String? token) {
    if (token == null) {
      ref.read(authTokenProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(_tokenKey);
    } else {
      ref.read(authTokenProvider.notifier).state = token;
      ref.read(sharedPrefProvider).setString(_tokenKey, token);
    }
  }

  Future<bool> checkToken() async {
    final reqs = Reqs(method: "auth.check_token");
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) {
      setToken(null);
      return false;
    }

    return true;
  }

  void loadUser() {
    final data = ref.read(sharedPrefProvider).getString(_userKey);
    if (data != null) {
      final user = User.fromJson(jsonDecode(data));
      ref.read(authUserProvider.notifier).state = user;
    } else {
      ref.read(authUserProvider.notifier).state = null;
    }
  }

  void setUser(User? user) {
    if (user == null) {
      ref.read(authUserProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(_userKey);
    } else {
      ref.read(authUserProvider.notifier).state = user;
      ref.read(sharedPrefProvider).setString(_userKey, jsonEncode(user.toJson()));
    }
  }

  void loadRemember() {
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
    final reqs = Reqs(
      method: "auth.login",
      params: {
        'username': ref.read(textIdentifierProvider),
        'password': ref.read(textPasswordProvider),
        // 'username': "1589972726",
        // 'password': "P455worD@Byp455",
        // 'dt_client': DateTime.now().asFormatDBDateTime(),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return false;

    setToken(state.value?.result?['token']);

    setUser(state.value?.result?['user'] == null ? null : User.fromJson(state.value?.result?['user']));
    setRemember(ref.read(isRememberProvider));

    return true;
  }

  Future<bool> signUp() async {
    final reqs = Reqs(
      method: "auth.register",
      params: {
        'username': ref.read(textIdentifierProvider),
        'password': ref.read(textPasswordProvider),
        'fullname': ref.read(textFullNameProvider),
        'phone': ref.read(textPhoneProvider),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return false;

    return true;
  }

  Future<void> sendCode() async {
    final reqs = Reqs(
      method: "auth.password_forgot",
      params: {
        'email': ref.read(textEmailProvider),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    // log(state.value['verification_code']);
    // ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
    ref.read(verifyTypeProvider.notifier).state = 'forgot_password';
    ref.read(isCountdownExpiredProvider.notifier).state = false;
    ref.read(countdownTimerProvider.notifier).state = 60 * 3;

    await AlertService.showOk(
      body: 'Kode verifikasi telah dikirimkan silahkan anda cek !',
      onOk: () async {
        final result = await ref.read(goRouterProvider).push('/code_verify');
        if (result == true) {
          ref.read(goRouterProvider).pop(true);
        }
      },
    );
  }

  Future<void> resendCode() async {
    if (ref.read(isCountdownExpiredProvider) == false) {
      return SnackBarService.show(message: 'Hitung mundur masih berlaku !');
    }

    switch (ref.read(verifyTypeProvider)) {
      case 'email':
        // final data = {
        //   "type": "email",
        //   "is_testing": AppConfig.isTesting,
        // };
        final reqs = Reqs(
          method: "auth.password_forgot",
          params: {
            'email': ref.read(textEmailProvider),
          },
        );
        final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
        if (state.hasError) return;

        // log(state.value['verification_code']);
        // ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        break;
      case 'phone':
        // final data = {
        //   "type": "phone",
        //   "is_testing": AppConfig.isTesting,
        // };
        final reqs = Reqs(
          method: "auth.password_forgot",
          params: {
            'email': ref.read(textEmailProvider),
          },
        );
        final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
        if (state.hasError) return;

        // log(state.value['verification_code']);
        // ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
        break;
      default:
        // final data = {
        //   "email": ref.watch(textEmailProvider),
        //   "send_via": "sms",
        // };
        final reqs = Reqs(
          method: "auth.password_forgot",
          params: {
            'email': ref.read(textEmailProvider),
          },
        );
        final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
        if (state.hasError) return;

      // log(state.value['verification_code']);
      // ref.read(verifyCodeProvider.notifier).state = state.value['verification_code'];
    }

    await AlertService.showOk(
      body: 'Kode verifikasi telah dikirimkan ulang silahkan anda cek kembali !',
      onOk: () async {
        ref.read(isCountdownExpiredProvider.notifier).state = false;
      },
    );
  }

  Future<void> resetPwd() async {
    // final data = {
    //   "email": ref.watch(textEmailProvider),
    //   "password": ref.watch(textPasswordProvider),
    //   "need_confirm": false,
    // };
    final reqs = Reqs(
      method: "auth.password_reset",
      params: {
        'email': ref.read(textEmailProvider),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    await AlertService.showOk(
      body: 'Berhasil, silahkan anda coba masuk dengan kode sandi terbaru !'.hardcoded,
      onOk: () {
        ref.read(goRouterProvider).pop(true);
      },
    );
  }

  Future<void> changePwd() async {
    final reqs = Reqs(
      method: "auth.password_change",
      params: {
        "password": ref.read(textPasswordOldProvider),
        "new_password": ref.watch(textPasswordProvider),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    await AlertService.showOk(
      body: 'Berhasil, kode sandi sudah berubah !'.hardcoded,
      onOk: () {
        ref.read(goRouterProvider).pop(true);
      },
    );
  }

  Future<void> signOut({bool silence = false}) async {
    if (silence) {
      setUser(null);
      setToken(null);
      return;
    }

    await AlertService.confirm(
      body: "Anda yakin ingin keluar ?",
      onOk: () {
        setUser(null);
        setToken(null);
      },
    );
  }

  Future removeAccount() async {
    await AlertService.confirm(
      body: "Anda yakin ingin menon-aktifkan Akun Anda ?",
      onOk: () async {
        final reqs = Reqs(method: "auth.unregister");
        final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

        if (state.hasError) return;

        await AlertService.showOk(
          body: 'Akun Anda telah berhasil di non-aktifkan, silahkan cek email anda untuk informasi lebih lanjut !'
              .hardcoded,
          onOk: () {
            setUser(null);
            setToken(null);
          },
        );
      },
    );
  }

  Future signInCallback({required VoidCallback next}) async {
    if (ref.read(authTokenProvider) == null) {
      final result = await ref.read(pageUtilsProvider).goto(page: const SignInView());
      if (result == true) {
        return next();
      }
    } else {
      return next();
    }
  }

  Future signInGoto({required Widget page}) async {
    if (ref.read(authTokenProvider) == null) {
      final result = await ref.read(pageUtilsProvider).goto(page: const SignInView());
      if (result == true) {
        return await ref.read(pageUtilsProvider).goto(page: page);
      }
    } else {
      return await ref.read(pageUtilsProvider).goto(page: page);
    }
  }
}

final authCtrlProvider = Provider(AuthCtrl.new);
