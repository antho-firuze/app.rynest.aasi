import 'dart:async';
import 'dart:math';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/helpers/extensions.dart';
import 'package:app.rynest.aasi/models/schedule.dart';
import 'package:app.rynest.aasi/services/exam_service.dart';
import 'package:app.rynest.aasi/services/media_service.dart';
import 'package:app.rynest.aasi/ui/views/exam/exam_view.dart';
import 'package:stacked/stacked.dart';

import '../../../models/profile.dart';
import '../../../services/account_service.dart';
import '../../../services/app_service.dart';
import '../exam_result/exam_result_view.dart';

class HomeViewModel extends BaseViewModel {
  final appService = locator<AppService>();
  final accountService = locator<AccountService>();
  final examService = locator<ExamService>();
  final mediaService = locator<MediaService>();

  Profile? get profile => accountService.profile;
  Schedule? get schedule => accountService.schedule;

  Duration? duration;
  String timerInfo = '';
  Timer? mainTimer;

  String? photo;

  Future futureToRun() async {
    await loadData();
  }

  Future refresh() async {
    await loadData(init: false);
  }

  Future loadData({bool init = true}) async {
    await Future.delayed(Duration.zero);

    await accountService.getProfile(showLoading: true, isRefresh: true);
    await accountService.getSchedule(showLoading: false);
    await examService.getStatus(showLoading: false);

    if (await F.isURLValid(accountService.profile?.photo)) {
      var dummyId = Random().nextInt(99999);
      photo = '${accountService.profile?.photo}?v=$dummyId';
    } else {
      photo = null;
    }

    if (examService.exam?.examCompleted == false) {
      duration = await examService.getDuration();
      if (duration!.inSeconds > 5) {
        await startTimer();
      }
    }

    await appService.loadBanners();

    notifyListeners();

    // Check whenever exam already started but app crash/no paket data/phone changed
    // if (exam != null) {
    //   // Check whenever exam completed but not taking picture
    //   if (exam?.examCompleted! == true) {
    //     if (authService.profile?.photos!.examFinish == null &&
    //         authService.profile?.photos!.examFinish!.isEmpty) {
    //       notif = 'Harap mengambil foto dahulu setelah ujian !';
    //     }
    //     await examService.getImageFinishExam(
    //         message: 'Anda belum mengambil foto setelah ujian, '
    //             'silahkan ambil foto anda sekarang !');
    //   }
    //   notifyListeners();
    // }
  }

  Future startTimer() async {
    mainTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      duration = await examService.getDuration();
      timerInfo = duration!.toHHNNSS();
      if (duration!.inSeconds < 1) {
        timer.cancel();

        if (!examService.exam!.examCompleted!) {
          examService.exam!.examCompleted = true;
          mainTimer?.cancel();
          notifyListeners();
        }
      }
      notifyListeners();
    });
    notifyListeners();
  }

  Future onPressedExam() async {
    if (isBusy) return;

    await F.navigate(const ExamView());
    notifyListeners();
  }

  Future onPressedResult() async {
    if (isBusy) return;

    await F.navigate(const ExamResultView(type: 'result'));
    notifyListeners();
  }

  Future<bool?> onPressedSchedule() async {
    return await examService.checkIsExamScheduleAvailable();
  }
}
