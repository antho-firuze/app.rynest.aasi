import 'dart:math';

import 'package:app.rynest.aasi/services/account_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../helpers/F.dart';
import '../../../models/exam.dart';
import '../../../models/profile.dart';
import '../../../models/result.dart';
import '../../../services/exam_service.dart';
import '../../shared/dialog_mee.dart';

class ExamResultViewModel extends FutureViewModel {
  final examService = locator<ExamService>();
  final accountService = locator<AccountService>();

  Profile? get profile => accountService.profile;
  Exam? get exam => examService.exam;

  String? photo;

  @override
  Future futureToRun() async {
    await loadData();
  }

  Future refresh() async {
    await loadData(init: false);
  }

  Future loadData({bool init = true}) async {
    await Future.delayed(Duration.zero);

    Result result =
        await examService.getResult(isRefresh: !init, showLoading: true);
    if (!result.status) {
      await DialogMee.show(result.message);
      return F.back();
    }

    if (exam?.examStart == null) {
      await DialogMee.show('Ujian anda belum di mulai');
      return F.back();
    }

    if (await F.isURLValid(accountService.profile?.photo)) {
      var dummyId = Random().nextInt(99999);
      photo = '${accountService.profile?.photo}?v=$dummyId';
    } else {
      photo = null;
    }

    notifyListeners();
  }

  Future finishExam() async {
    setBusy(true);

    if (exam!.examCompleted! == false) {
      if (exam!.numOfRepeat! > 0) {
        F.back(result: true);
      } else {
        F.back(result: true);
      }
    } else {
      await DialogMee.show('Terima kasih telah menyelesaikan ujian.');
      // await F.clearStackAndShow(Routes.dashboardView);
      F.close(2);
    }

    notifyListeners();
    setBusy(false);
  }
}
