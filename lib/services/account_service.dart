import 'package:app.rynest.aasi/models/certificate.dart';
import 'package:app.rynest.aasi/models/schedule.dart';

import '../constants/picture_type.dart';
import '../helpers/F.dart';
import '../helpers/api_helper.dart';
import '../models/profile.dart';
import '../models/result.dart';
import '../ui/shared/loading_mee.dart';

class AccountService {
  Profile? profile;
  Schedule? schedule;
  Certificate? certificate;
  // String? photo;
  // String? photoIdCard;
  // String? photoExamStart;
  // String? photoExamFinish;

  Future getProfile({bool isRefresh = false, bool showLoading = false}) async {
    // if (isRefresh == false) {
    //   // CHECK IN THE SESSION
    //   if (showLoading) LoadingMee.show();
    //   var profileSession = await F.session.profile();
    //   LoadingMee.dismiss();
    //   if (F.isNullOrEmpty(profileSession) == false) {
    //     profile = Profile.fromJson(jsonDecode(profileSession!));
    //     F.log.i('Get Profile from Session !');
    //     F.log.d(profile!.toJson());
    //     return Result.success(message: 'Get Profile from Session !');
    //   }
    //   F.log.i('Get Profile from Server !');
    // }

    if (showLoading) LoadingMee.show();
    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.memberProfile);
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await getProfile(isRefresh: isRefresh, showLoading: showLoading);
      }

      profile = null;
      // await F.session.profile(clear: true);
      return Result.error(message: result.message, errCode: result.errCode);
    }

    profile = Profile.fromJson(result.data);
    // await F.session.profile(value: jsonEncode(profile!.toJson()));
    return Result.success(message: result.message);
  }

  Future getSchedule({bool isRefresh = false, bool showLoading = false}) async {
    if (showLoading) LoadingMee.show();
    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.memberSchedule);
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await getSchedule(
            isRefresh: isRefresh, showLoading: showLoading);
      }

      schedule = null;
      return Result.error(message: result.message, errCode: result.errCode);
    }

    schedule = Schedule.fromJson(result.data);
    return Result.success(message: result.message);
  }

  Future getCertificate(
      {bool isRefresh = false, bool showLoading = false}) async {
    if (showLoading) LoadingMee.show();
    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.memberCertificate);
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await getCertificate(
            isRefresh: isRefresh, showLoading: showLoading);
      }

      certificate = null;
      return Result.error(message: result.message, errCode: result.errCode);
    }

    certificate =
        result.data == null ? null : Certificate.fromJson(result.data);
    return Result.success(message: result.message);
  }

  Future savePicture(
      {required PictureType type,
      required String filePath,
      bool showLoading = true}) async {
    String method;
    switch (type) {
      case PictureType.selfie:
        method = apiMethod.memberUploadSelfie;
        break;
      case PictureType.idCard:
        method = apiMethod.memberUploadIDCard;
        break;
      case PictureType.start:
        method = apiMethod.memberUploadExamStart;
        break;
      case PictureType.finish:
        method = apiMethod.memberUploadExamFinish;
        break;
      case PictureType.random1:
        method = apiMethod.memberUploadExamRandom1;
        break;
      case PictureType.random2:
        method = apiMethod.memberUploadExamRandom2;
        break;
    }
    if (showLoading) LoadingMee.show();
    Result result = await apiHelper.callAPIJsonRPC(
      method: method,
      filePath: filePath,
    );
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await savePicture(type: type, filePath: filePath);
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }

    return Result.success(message: result.message, data: result.data);
  }
}
