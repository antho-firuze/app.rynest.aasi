import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/services/api_service.dart';
import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/user/model/certificate.dart';
import 'package:app.rynest.aasi/features/user/model/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateProvider<Profile?>((ref) => null);
final certificateProvider = StateProvider<Certificate?>((ref) => null);

final fetchProfileProvider = FutureProvider<Profile?>((ref) async {
  if (ref.read(authUserProvider) == null) return null;

  final reqs = Reqs(path: '/api/v1/member/profile', data: {});
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.hasError) return null;

  // Profile not exists
  if (state.value == null) return null;

  var profile = Profile.fromJson(state.value);
  final dummyId = Random().nextInt(99999);
  if (profile.photo != null || profile.photo!.isNotEmpty) {
    profile = profile.copyWith(photo: "${profile.photo}?v=$dummyId");
  }
  if (profile.photoIdCard != null || profile.photoIdCard!.isNotEmpty) {
    profile = profile.copyWith(photoIdCard: "${profile.photoIdCard}?v=$dummyId");
  }
  ref.read(profileCtrlProvider).saveProfile(profile);

  return profile;
});

final fetchCertificateProvider = FutureProvider<Certificate?>((ref) async {
  if (ref.read(authUserProvider) == null) return null;

  final reqs = Reqs(path: '/api/v1/member/certificate', data: {});
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.hasError) return null;

  // Certificate not exists
  if (state.value == null) return null;

  final certificate = Certificate.fromJson(state.value);
  ref.read(certificateProvider.notifier).state = certificate;

  return certificate;
});

class ProfileCtrl {
  final Ref ref;
  ProfileCtrl(this.ref);

  final _kLogName = 'PROFILE-CTRL';

  final String _profileKey = 'COOKIE_PROFILE';

  void initialize() async {
    log('Initialize Profile !');

    loadProfile();

    ref.listen(authUserProvider, (previous, next) async {
      if (next != null) {
        // ignore: unused_result
        ref.refresh(fetchProfileProvider);
        // ignore: unused_result
        ref.refresh(fetchCertificateProvider);
      } else {
        saveProfile(null);
        ref.invalidate(fetchProfileProvider);
      }
    });
  }

  void loadProfile({bool showLog = false}) {
    final data = ref.read(sharedPrefProvider).getString(_profileKey);
    if (data != null) {
      if (showLog) log("data = $data", name: _kLogName);
      final profile = Profile.fromJson(jsonDecode(data));
      ref.read(profileProvider.notifier).state = profile;
    } else {
      if (showLog) log("data = null", name: _kLogName);
      ref.read(profileProvider.notifier).state = null;
    }
  }

  void saveProfile(Profile? profile) {
    if (profile == null) {
      ref.read(profileProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(_profileKey);
    } else {
      ref.read(profileProvider.notifier).state = profile;
      ref.read(sharedPrefProvider).setString(_profileKey, jsonEncode(profile.toJson()));
    }
  }

  Future updatePhotoSelfie(File file, {bool showLog = false}) async {
    if (showLog) log("file : ${file.path}", name: _kLogName);

    final reqs = Reqs(
      path: '/api/v1/member/upload_photo',
      filePath: file.path,
      fileKey: 'userfile',
      data: {
        "type": "selfie",
      },
    );
    final state =
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs, showLog: true));

    if (state.hasError) return;

    if (state.value != null) {
      final dummyId = Random().nextInt(99999);
      final url = "${state.value['url']}?v=$dummyId";
      if (showLog) log("url : $url", name: _kLogName);
      final profile = ref.read(profileProvider)?.copyWith(photo: url);
      ref.read(profileProvider.notifier).state = profile;
    } else {
      SnackBarService.show(message: "Error : Response null from aws server");
    }
  }

  Future updatePhotoIdCard(File file, {bool showLog = false}) async {
    if (showLog) log("file : ${file.path}", name: _kLogName);

    final reqs = Reqs(
      path: '/api/v1/member/upload_photo',
      filePath: file.path,
      fileKey: 'userfile',
      data: {
        "type": "idcard",
      },
    );
    final state =
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs, showLog: true));

    if (state.hasError) return;

    if (state.value != null) {
      final dummyId = Random().nextInt(99999);
      final url = "${state.value['url']}?v=$dummyId";
      if (showLog) log("url : $url", name: _kLogName);
      final profile = ref.read(profileProvider)?.copyWith(photoIdCard: url);
      ref.read(profileProvider.notifier).state = profile;
    } else {
      SnackBarService.show(message: "Error : Response null from aws server");
    }
  }
}

final profileCtrlProvider = Provider(ProfileCtrl.new);

