import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/services/api_service.dart';
import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:app.rynest.aasi/common/services/talker_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/controller/exam_ctrl.dart';
import 'package:app.rynest.aasi/features/user/model/certificate.dart';
import 'package:app.rynest.aasi/features/user/model/profile.dart';
import 'package:app.rynest.aasi/utils/download_utils.dart';
import 'package:app.rynest.aasi/utils/talker_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _kLogName = 'PROFILE-CTRL';

final profileProvider = StateProvider<Profile?>((ref) => null);
final certificateProvider = StateProvider<Certificate?>((ref) => null);

final fetchProfileProvider = FutureProvider<Profile?>((ref) async {
  try {
    if (ref.read(authUserProvider) == null) return null;
    log("fetchProfileProvider", name: _kLogName);

    final reqs = Reqs(path: '/api/v1/member/profile', data: {});
    final data = await ref.read(apiServiceProvider).fetch(reqs: reqs);

    if (data == null) return null;

    var profile = Profile.fromJson(data);
    final dummyId = Random().nextInt(99999);

    // Check image availability
    if (profile.photo?.isNotEmpty != null) {
      profile = profile.copyWith(photo: "${profile.photo}?v=$dummyId");
    }
    if (profile.photoIdCard?.isNotEmpty != null) {
      profile = profile.copyWith(photoIdCard: "${profile.photoIdCard}?v=$dummyId");
    }
    ref.read(profileProvider.notifier).state = profile;

    return profile;
  } catch (e, s) {
    ref.read(talkerProvider).errx("Error : fetchProfileProvider", error: e, stackTrace: s, name: _kLogName);
    rethrow;
  }
});

final fetchCertificateProvider = FutureProvider<Certificate?>((ref) async {
  try {
    if (ref.read(authUserProvider) == null) return null;
    log("fetchCertificateProvider", name: _kLogName);

    final reqs = Reqs(path: '/api/v1/member/certificate', data: {});
    final data = await ref.read(apiServiceProvider).fetch(reqs: reqs);

    if (data == null) return null;

    final certificate = Certificate.fromJson(data);
    ref.read(certificateProvider.notifier).state = certificate;

    return certificate;
  } catch (e, s) {
    ref.read(talkerProvider).errx("Error : fetchCertificateProvider", error: e, stackTrace: s, name: _kLogName);
    rethrow;
  }
});

class ProfileCtrl {
  final Ref ref;
  ProfileCtrl(this.ref);

  final _kLogName = 'PROFILE-CTRL';

  void initialize() async {
    log('Initialize Profile !');

    // loadProfile();
    ref.read(fetchProfileProvider);
    ref.read(fetchCertificateProvider);

    ref.listen(authUserProvider, (previous, next) async {
      if (next == null) {
        ref.read(profileProvider.notifier).state = null;
        ref.read(certificateProvider.notifier).state = null;
      } else {
        // ignore: unused_result
        ref.refresh(fetchProfileProvider);
        // ignore: unused_result
        ref.refresh(fetchCertificateProvider);
      }
    });
  }

  String getSelfieNameCache() {
    final profile = ref.read(profileProvider);
    return "${profile?.id}-selfie";
  }

  String getIDCardNameCache() {
    final profile = ref.read(profileProvider);
    return "${profile?.id}-idCard";
  }

  Future updatePhotoSelfie(File file, {bool showLog = true}) async {
    try {
      log("updatePhotoSelfie", name: _kLogName);

      final reqs = Reqs(
        path: '/api/v1/member/upload_photo',
        filePath: file.path,
        fileKey: 'userfile',
        data: {
          "type": "selfie",
        },
      );
      final data = await ref.read(apiServiceProvider).call(reqs: reqs, showLog: true);
      if (data == null) {
        SnackBarService.show(message: "Invalid response from AWS Server");
        throw "Invalid response from AWS Server";
      }

      final url = data['url'];
      if (showLog) log("updatePhotoSelfie : $url", name: _kLogName);

      // Delete image on cache first
      await ref.read(downloadUtilsProvider).deleteImageOndisk(getSelfieNameCache());

      // Download & Save image on disk
      await ref.read(downloadUtilsProvider).downloadAndSaveImage(url, getSelfieNameCache());

      // Update image url
      final profile = ref.read(profileProvider)?.copyWith(photo: url);
      ref.read(profileProvider.notifier).state = profile;

      // ignore: unused_result
      ref.refresh(checkExamPreparationProvider);
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error : updatePhotoSelfie", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }

  Future updatePhotoIdCard(File file, {bool showLog = false}) async {
    try {
      log("updatePhotoIdCard", name: _kLogName);

      final reqs = Reqs(
        path: '/api/v1/member/upload_photo',
        filePath: file.path,
        fileKey: 'userfile',
        data: {
          "type": "idcard",
        },
      );
      final data = await ref.read(apiServiceProvider).call(reqs: reqs, showLog: true);
      if (data == null) {
        SnackBarService.show(message: "Invalid response from AWS Server");
        throw "Invalid response from AWS Server";
      }

      final url = data['url'];
      if (showLog) log("updatePhotoIdCard : $url", name: _kLogName);

      // Delete image on cache first
      await ref.read(downloadUtilsProvider).deleteImageOndisk(getIDCardNameCache());

      // Download & Save image on disk
      await ref.read(downloadUtilsProvider).downloadAndSaveImage(url, getIDCardNameCache());

      // Update image url
      final profile = ref.read(profileProvider)?.copyWith(photoIdCard: url);
      ref.read(profileProvider.notifier).state = profile;

      // ignore: unused_result
      ref.refresh(checkExamPreparationProvider);
    } catch (e, s) {
      ref.read(talkerProvider).errx("Error : updatePhotoIdCard", error: e, stackTrace: s, name: _kLogName);
      rethrow;
    }
  }
}

final profileCtrlProvider = Provider(ProfileCtrl.new);
