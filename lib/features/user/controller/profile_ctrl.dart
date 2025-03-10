import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/model/resp.dart';
import 'package:app.rynest.aasi/common/services/jsonrpc_service.dart';
import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/user/model/certificate.dart';
import 'package:app.rynest.aasi/features/user/model/profile.dart';
import 'package:app.rynest.aasi/utils/dio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateProvider<Profile?>((ref) => null);
final certificateProvider = StateProvider<Certificate?>((ref) => null);

class ProfileCtrl {
  final Ref ref;
  ProfileCtrl(this.ref);

  final String _profileKey = 'COOKIE_PROFILE';

  void initialize() async {
    log('Initialize Profile !');

    loadProfile();

    ref.listen(tokenValidProvider, (previous, next) async {
      if (next == true) {
        ref.refresh(fetchProfileProvider);
      } else {
        saveProfile(null);
        ref.invalidate(fetchProfileProvider);
      }
      // if (next == true) {
      //   if (ref.read(profileProvider) == null) {
      //     await fetchProfile();
      //   }
      //   await fetcCertificate();
      // } else {
      //   saveProfile(null);
      //   ref.invalidate(fetchProfileProvider);
      // }
    });
  }

  void loadProfile() {
    final data = ref.read(sharedPrefProvider).getString(_profileKey);
    if (data != null) {
      final profile = Profile.fromJson(jsonDecode(data));
      ref.read(profileProvider.notifier).state = profile;
    } else {
      ref.read(profileProvider.notifier).state = null;
    }
  }

  // Future<void> fetchProfile() async {
  //   final reqs = Reqs(method: "member4.profile");
  //   final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

  //   if (state.hasError) return;

  //   var profile = Profile.fromJson(state.value!.result!);

  //   // Check is Photo URL Valid
  //   var dummyId = Random().nextInt(99999);
  //   var valid = await ref.read(dioIsValidUrlProvider(profile.photo).future);
  //   log("profile.photo => ${profile.photo} => $valid");
  //   if (valid != true) {
  //     profile = profile.copyWith(photo: null);
  //   } else {
  //     profile = profile.copyWith(photo: "${profile.photo}?v=$dummyId");
  //   }

  //   valid = await ref.read(dioIsValidUrlProvider(profile.photoIdCard).future);
  //   log("profile.photoIdCard => ${profile.photoIdCard} => $valid");
  //   if (valid != true) {
  //     profile = profile.copyWith(photoIdCard: null);
  //   } else {
  //     profile = profile.copyWith(photoIdCard: "${profile.photoIdCard}?v=$dummyId");
  //   }

  //   saveProfile(profile);
  // }

  void saveProfile(Profile? profile) {
    if (profile == null) {
      ref.read(profileProvider.notifier).state = null;
      ref.read(sharedPrefProvider).remove(_profileKey);
    } else {
      ref.read(profileProvider.notifier).state = profile;
      ref.read(sharedPrefProvider).setString(_profileKey, jsonEncode(profile.toJson()));
    }
  }

  // Future<void> fetcCertificate() async {
  //   final reqs = Reqs(method: "member4.certificate");
  //   final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

  //   if (state.hasError) return;

  //   ref.read(certificateProvider.notifier).state =
  //       state.value!.result == null ? null : Certificate.fromJson(state.value!.result!);
  // }

  Future updatePhotoIdCard(File file) async {
    final reqs = Reqs(method: "member4.upload_photo_idcard", filePath: file.path);
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    final profile = ref.read(profileProvider);
    var dummyId = Random().nextInt(99999);

    ref.read(profileProvider.notifier).state = profile?.copyWith(photoIdCard: "${state.value?.result}?v=$dummyId");
  }

  Future updatePhotoSelfie(File file) async {
    final reqs = Reqs(method: "member4.upload_photo_selfie", filePath: file.path);
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    final profile = ref.read(profileProvider);
    var dummyId = Random().nextInt(99999);

    ref.read(profileProvider.notifier).state = profile?.copyWith(photo: "${state.value?.result}?v=$dummyId");
  }
}

final profileCtrlProvider = Provider(ProfileCtrl.new);

final fetchProfileProvider = FutureProvider<Profile?>((ref) async {
  final reqs = Reqs(method: "member4.profile");
  final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

  log('fetchProfileProvider => ${state.value}', name: 'PROFILE-CTRL');
  Resp? resp = state.value;
  if (resp?.result == null) {
    return null;
  }

  var profile = Profile.fromJson(resp?.result);

  // Check is Photo URL Valid
  var dummyId = Random().nextInt(99999);
  if (profile.photo != null || profile.photo!.isNotEmpty) {
    profile = profile.copyWith(photo: "${profile.photo}?v=$dummyId");
  }
  if (profile.photoIdCard != null || profile.photoIdCard!.isNotEmpty) {
    profile = profile.copyWith(photoIdCard: "${profile.photoIdCard}?v=$dummyId");
  }

  ref.read(profileProvider.notifier).state = profile;
  return profile;
});

final fetchCertificateProvider = FutureProvider<Certificate?>((ref) async {
  final reqs = Reqs(method: "member4.certificate");
  final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

  log('fetchCertificateProvider => ${state.value}', name: 'PROFILE-CTRL');
  Resp? resp = state.value;
  if (resp?.result == null) {
    return null;
  }

  final certificate = Certificate.fromJson(state.value!.result!);

  ref.read(certificateProvider.notifier).state = certificate;
  return certificate;
});
