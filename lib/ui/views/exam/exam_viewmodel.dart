import 'dart:async';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/F.dart';
import 'package:app.rynest.aasi/models/exam.dart';
import 'package:app.rynest.aasi/models/profile.dart';
import 'package:app.rynest.aasi/models/question.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:app.rynest.aasi/services/account_service.dart';
import 'package:app.rynest.aasi/services/exam_service.dart';
import 'package:app.rynest.aasi/services/media_service.dart';
import 'package:app.rynest.aasi/ui/views/exam_result/exam_result_view.dart';
import 'package:app.rynest.aasi/ui/views/setting/setting_view.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/image_view.dart';
import 'package:stacked/stacked.dart';
import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../../../services/app_service.dart';
import '../../shared/dialog_mee.dart';

class ExamViewModel extends FutureViewModel {
  final appService = locator<AppService>();
  final mediaService = locator<MediaService>();
  final examService = locator<ExamService>();
  final accountService = locator<AccountService>();

  Profile? get profile => accountService.profile;
  Exam? get exam => examService.exam;
  Question? get question => examService.question;
  List<Question>? get questions => examService.questions;

  bool get isMinimumAnswered => examService.getMinimumAnswered();
  int get restOfRepeat => examService.exam!.numOfRepeat!;

  // Semua pertanyaan sudah dijawab/diisi
  bool get autoNextQuestion => appService.autoNextQuestion;
  int get fontSize => appService.fontSize;

  Duration? duration;
  Timer? mainTimer;

  String questionsInfo = '';
  String timerInfo = '';
  String currDate = '';
  String currTime = '';

  bool showNavigator = true;
  bool showInfo = false;

  @override
  Future futureToRun() async {
    // Reset Variables
    questionsInfo = '';
    timerInfo = '';
    currDate = '';
    currTime = '';
    examService.question = null;
    examService.questions = null;

    if (await initExam() != true) {
      return F.back();
    }

    duration = await examService.getDuration();
    notifyListeners();

    if (duration!.inSeconds > 0) {
      currDate = DateTime.now().format('dd/MM/yyyy');
      questionsInfo = examService.questionsInfo;
      await startTimer();
    } else {
      await finishExam(message: 'Maaf, waktu Ujian Anda sudah selesai !');
    }
  }

  Future<bool?> initExam() async {
    await Future.delayed(Duration.zero);

    // CHECK AVAILIBILITY SCHEDULE
    await examService.getStatus(showLoading: true);

    if (await examService.checkIsExamAvailable() == false) {
      return false;
    }

    // GET IMAGE START EXAM
    await examService.getPhotos(showLoading: true);

    if (await examService.getImageStartExam() == false) {
      return false;
    }

    Result result = await examService.setStart();
    if (!result.status) {
      // err_exam_has_finished
      if (result.errCode == '7001') {
        await DialogMee.show(result.message!);
        return false;
      }

      await DialogMee.show(result.message!);
      return false;
    }

    return true;
  }

  Future questionsMove(Go go) async {
    examService.questionsMove(go);
    questionsInfo = examService.questionsInfo;
    notifyListeners();
  }

  Future submitAnswer(String key) async {
    question!.answeredKey = key;
    for (var element in question!.options!) {
      int i = question!.options!.indexOf(element);
      question!.options![i].answeredKey = key;
    }
    notifyListeners();

    String optionKeysJoin =
        question!.options!.map((e) => e.optionKey).join("").toString();

    Result result = await examService.setAnswer(
      questionID: question!.id!,
      answeredKey: key,
      optionKeyJoin: optionKeysJoin,
    );

    if (!result.status) {
      // err_exam_has_finished
      if (result.errCode == '7001') {
        await DialogMee.show(result.message!);
        return await F.clearTillFirstAndShowView(const ExamResultView());
      }

      await DialogMee.show(result.message!);
    }

    notifyListeners();
    if (autoNextQuestion) await questionsMove(Go.next);

    notifyListeners();
  }

  Future onPressedCheckScore() async {
    if (isBusy) return;

    if (restOfRepeat == 0) {
      return await DialogMee.show(
          'Maaf, kesempatan Cek Score Anda sudah habis !');
    }

    bool? response = await DialogMee.confirm(
        'Anda memiliki $restOfRepeat kali ${restOfRepeat < 2 ? "lagi " : ""}'
        'kesempatan untuk Cek Score !\n\n'
        'Ingin menggunakannya sekarang ?');
    if (response != true) return;

    await examService.getImageFinishExam(
        message:
            'Sebelum Cek Score, silahkan Anda ambil foto terlebih dahulu !');

    Result result = await examService.setRepeat();
    if (!result.status) {
      // err_exam_has_finished
      if (result.errCode == '7001') {
        await DialogMee.show(result.message);
        return await F.clearTillFirstAndShowView(const ExamResultView());
      }

      return await DialogMee.show(result.message);
    }

    var isFinish =
        await F.navigate(const ExamResultView(type: 'repeat'), force: true);
    if (isFinish == true) {
      await onPressedFinish();
    }
  }

  Future onPressedFinish() async {
    String confirm = '';
    duration = await examService.getDuration();
    if (duration!.inMinutes > 0) {
      confirm = '\n\nAnda masih memiliki waktu '
          'kurang lebih ${duration!.inMinutes} menit !';
    }

    bool? response = await DialogMee.confirm(
        'Anda yakin ingin menyelesaikan ujian ? $confirm');
    if (response != true) return;

    await finishExam();
  }

  Future finishExam({String? message}) async {
    if (message != null && message.isNotEmpty) await DialogMee.show(message);

    await examService.getImageFinishExam();

    Result result = await examService.setStop();
    if (!result.status) {
      await DialogMee.show(result.message);
    }

    mainTimer?.cancel();
    await F.clearTillFirstAndShowView(const ExamResultView());
  }

  Future startTimer() async {
    mainTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      duration = await examService.getDuration();
      timerInfo = duration!.toHHNNSS();
      currTime = DateTime.now().asFormatTimeAMPM();
      if (duration!.inSeconds < 1) {
        timer.cancel();

        if (!exam!.examCompleted!) {
          await finishExam(
              message: 'Waktu anda telah habis.\n\n'
                  'Terima kasih telah mengikuti ujian.');
        }
      }
      notifyListeners();
    });
  }

  Future showSetting() async {
    await F.navigate(const SettingView(showBack: true), force: true);

    notifyListeners();
  }

  showImage(String? url) => F.navigate(ImageView(src: url ?? ''));
}
