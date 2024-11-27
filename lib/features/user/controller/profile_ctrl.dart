import 'dart:convert';
import 'dart:developer';

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/services/jsonrpc_service.dart';
import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/user/model/profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateProvider<Profile?>((ref) => null);

class ProfileCtrl {
  final Ref ref;
  ProfileCtrl(this.ref);

  final String _profileKey = 'COOKIE_PROFILE';

  void initialize() async {
    log('Initialize Profile !');

    loadProfile();

    ref.listen(authTokenProvider, (previous, next) async {
      if (next != null) {
        if (ref.read(profileProvider) == null) {
          await fetchProfile();
        }
      } else {
        saveProfile(null);
      }
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

  Future<void> fetchProfile() async {
    final reqs = Reqs(method: "member3.profile");
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    log("fetchProfile : ${state.value}");
    final profile = Profile.fromJson(state.value!.result!);

    saveProfile(profile);
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

  
}

final profileCtrlProvider = Provider(ProfileCtrl.new);
