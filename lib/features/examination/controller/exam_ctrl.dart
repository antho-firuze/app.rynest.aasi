import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/services/alert_service.dart';
import 'package:app.rynest.aasi/common/services/camera_service.dart';
import 'package:app.rynest.aasi/common/services/jsonrpc_service.dart';
import 'package:app.rynest.aasi/common/services/loading_service.dart';
import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/model/exam.dart';
import 'package:app.rynest.aasi/features/examination/model/exam_photo.dart';
import 'package:app.rynest.aasi/features/examination/model/exam_schedule.dart';
import 'package:app.rynest.aasi/features/examination/model/question.dart';
import 'package:app.rynest.aasi/utils/datetime_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Go { next, previous, first, last }

enum FontSize { increase, decrease }

enum ExamStage { notRegistered, cancel, tooEarlier, start, ongoing, finish, expired }

final fontSizeProvider = StateProvider<double>((ref) => 16);
final autoNextQuestionProvider = StateProvider<bool>((ref) => false);

final examProvider = StateProvider<Exam?>((ref) => null);
final examScheduleProvider = StateProvider<ExamSchedule?>((ref) => null);
final examPhotosProvider = StateProvider<ExamPhotos?>((ref) => null);
final examStageProvider = StateProvider<ExamStage>((ref) => ExamStage.start);
final examStatusProvider = StateProvider<String>((ref) => 'READY');

final questionsProvider = StateProvider<List<Question>?>((ref) => null);
final questionProvider = StateProvider<Question?>((ref) => null);
final remainingTimeProvider = StateProvider<String>((ref) => '');

class ExamCtrl {
  final Ref ref;
  ExamCtrl(this.ref);

  final String _fontSizeKey = 'COOKIE_FONT_SIZE';
  final String _autoNextQuestionKey = 'COOKIE_AUTO_NEXT_QUESTION';

  Timer? mainTimer;
  List<int> randomPages = [];

  void initialize() async {
    log('Initialize Examination !');

    loadSetting();

    await fetchSchedule();
    await fetchPhotos();
    await fetchStatus();

    ref.listen(authTokenProvider, (previous, next) async {
      if (next != null && next != previous) {
        await fetchSchedule();
        await fetchPhotos();
        await fetchStatus();
      }
    });
  }

  void _updateExamStage() {
    final schedule = ref.read(examScheduleProvider);
    final exam = ref.read(examProvider);

    if (schedule == null) {
      ref.read(examStageProvider.notifier).state = ExamStage.notRegistered;
    } else {
      final open = schedule.openRegistration;
      final close = schedule.closeRegistration;

      if (DateTime.now().isBefore(open!)) {
        ref.read(examStageProvider.notifier).state = ExamStage.tooEarlier;
      } else if (DateTime.now().isAfter(close!)) {
        if (exam == null) {
          ref.read(examStageProvider.notifier).state = ExamStage.expired;
        } else {
          ref.read(examStageProvider.notifier).state = ExamStage.finish;
        }
      } else {
        if (exam == null) {
          ref.read(examStageProvider.notifier).state = ExamStage.start;
        } else if (exam.examCompleted != true) {
          ref.read(examStageProvider.notifier).state = ExamStage.ongoing;
        } else {
          ref.read(examStageProvider.notifier).state = ExamStage.finish;
        }
      }
    }

    ref.read(examStatusProvider.notifier).state = ref.read(examStageProvider) == ExamStage.start
        ? "READY"
        : ref.read(examStageProvider) == ExamStage.ongoing
            ? "ON GOING"
            : ref.read(examStageProvider) == ExamStage.finish
                ? "FINISH / DONE"
                : "EXPIRED";

    if (ref.read(examStageProvider) == ExamStage.ongoing) {
      if (mainTimer == null) {
        _calcRemainingTime();
      } else {
        mainTimer?.cancel();
        mainTimer == null;
        _calcRemainingTime();
      }
    }
  }

  void _calcRemainingTime() {
    log('_calcRemainingTime on call', name: 'EXAM-CTRL');

    if (ref.read(examProvider) == null) {
      return;
    }

    mainTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final duration = ref.read(examProvider)?.examEnd?.difference(DateTime.now());
      ref.read(remainingTimeProvider.notifier).state = duration!.toHHNNSS();
      if (duration.inSeconds < 1) {
        timer.cancel();

        await fetchFinish();
        mainTimer?.cancel();
      }
    });
  }

  void loadSetting() {
    ref.read(fontSizeProvider.notifier).state = ref.read(sharedPrefProvider).getDouble(_fontSizeKey) ?? 16;
    ref.read(autoNextQuestionProvider.notifier).state =
        ref.read(sharedPrefProvider).getBool(_autoNextQuestionKey) ?? false;
  }

  void setFontSize(FontSize size) {
    ref.read(fontSizeProvider.notifier).state = switch (size) {
      FontSize.increase => ref.read(fontSizeProvider) == 24 ? 24 : ref.read(fontSizeProvider) + 1,
      FontSize.decrease => ref.read(fontSizeProvider) == 16 ? 16 : ref.read(fontSizeProvider) - 1,
    };
    ref.read(sharedPrefProvider).setDouble(_fontSizeKey, ref.read(fontSizeProvider));
    log("setFontSize : ${ref.read(fontSizeProvider)}", name: "EXAM-CTRL");

    if (ref.read(fontSizeProvider) == 16) {
      AlertService.show(body: 'Ukuran font sudah minimal.');
    } else if (ref.read(fontSizeProvider) == 24) {
      AlertService.show(body: 'Ukuran font sudah maksimal.');
    }
  }

  void setAutoNext() {
    ref.read(autoNextQuestionProvider.notifier).state = !ref.read(autoNextQuestionProvider);
    ref.read(sharedPrefProvider).setBool(_autoNextQuestionKey, ref.read(autoNextQuestionProvider));
  }

  Future<void> fetchSchedule() async {
    final reqs = Reqs(method: "exam4.schedule");
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    ref.read(examScheduleProvider.notifier).state =
        state.value!.result == null ? null : ExamSchedule.fromJson(state.value!.result!);

    _updateExamStage();
  }

  Future<void> fetchPhotos() async {
    final reqs = Reqs(method: "exam4.photos");
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    ref.read(examPhotosProvider.notifier).state =
        state.value!.result == null ? null : ExamPhotos.fromJson(state.value!.result!);
  }

  Future<void> fetchStatus() async {
    final reqs = Reqs(
      method: "exam4.status",
      params: {
        'datetime': DateTime.now().dbDateTime(),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    final exam = state.value?.result == null ? null : Exam.fromJson(state.value?.result);
    ref.read(examProvider.notifier).state = exam;

    _updateExamStage();
  }

  Future<void> fetchStart() async {
    LoadingService.show(['Mempersiapkan Soal Ujian', 'Masih memproses', 'Sepertinya jaringan internet sedang lemot']);
    final reqs = Reqs(
      method: "exam4.start",
      params: {
        'datetime': DateTime.now().dbDateTime(),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
    LoadingService.dissmiss();

    if (state.hasError) return;

    final exam = state.value?.result == null ? null : Exam.fromJson(state.value?.result);
    ref.read(examProvider.notifier).state = exam;

    // Build the questions
    final questionIds = exam?.questionIds!.split(',');
    final questions = questionIds?.map((e) => Question(questionId: e)).toList();
    ref.read(questionsProvider.notifier).state = questions;

    // Set random page for getting silent picture
    randomPages = _getRandomCount();
    log("randomPages : $randomPages", name: "EXAM-CTRL");

    await loadQuestion();

    _updateExamStage();
  }

  Future<void> fetchFinish() async {
    LoadingService.show(['Menyelesaikan Ujian', 'Masih memproses', 'Sepertinya jaringan internet sedang lemot']);
    final reqs = Reqs(
      method: "exam4.finish",
      params: {
        'datetime': DateTime.now().dbDateTime(),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
    LoadingService.dissmiss();

    if (state.hasError) return;

    final exam = state.value?.result == null ? null : Exam.fromJson(state.value?.result);
    ref.read(examProvider.notifier).state = ref.read(examProvider)?.copyWith(examCompleted: exam?.examCompleted);

    _updateExamStage();
  }

  Future<void> fetchAnswer(String answer) async {
    var question = ref.read(questionProvider);

    if (answer == question?.answeredKey) return;

    ref.read(questionProvider.notifier).state = ref.read(questionProvider)?.copyWith(answeredKey: answer);

    LoadingService.show(['Menyimpan jawaban', 'Masih menyimpan', 'Sepertinya jaringan internet sedang lemot']);
    final reqs = Reqs(
      method: "exam4.answer",
      params: {
        'datetime': DateTime.now().dbDateTime(),
        'question_id': question?.questionId,
        'answered_key': answer,
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
    LoadingService.dissmiss();

    if (state.hasError) return;

    final exam = state.value?.result == null ? null : Exam.fromJson(state.value?.result);
    ref.read(examProvider.notifier).state = ref.read(examProvider)?.copyWith(
          numOfCorrect: exam?.numOfCorrect,
          numAnsweredQuestion: exam?.numAnsweredQuestion,
          answerKeys: exam?.answerKeys,
        );

    int index = ref.read(examProvider)?.syncQuestion ?? 0;
    var questions = ref.read(questionsProvider);

    question = question?.copyWith(answeredKey: answer);
    questions?[index] = question!;

    ref.read(questionProvider.notifier).state = question;
    ref.read(questionsProvider.notifier).state = questions;

    if (ref.read(autoNextQuestionProvider) == true) {
      await loadQuestion(Go.next);
    }
  }

  Future<bool> fetchCheckScore() async {
    LoadingService.show(['Check score', 'Masih memproses', 'Sepertinya jaringan internet sedang lemot']);
    final reqs = Reqs(
      method: "exam4.check_score",
      params: {
        'datetime': DateTime.now().dbDateTime(),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
    LoadingService.dissmiss();

    if (state.hasError) return false;

    final exam = state.value?.result == null ? null : Exam.fromJson(state.value?.result);
    ref.read(examProvider.notifier).state = ref.read(examProvider)?.copyWith(numOfRepeat: exam?.numOfRepeat);

    return true;
  }

  Future<void> fetchResult() async {
    LoadingService.show(['Loading hasil ujian', 'Masih memproses', 'Sepertinya jaringan internet sedang lemot']);
    final reqs = Reqs(
      method: "exam4.result",
      params: {
        'datetime': DateTime.now().dbDateTime(),
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
    LoadingService.dissmiss();

    if (state.hasError) return;

    final exam = state.value?.result == null ? null : Exam.fromJson(state.value?.result);
    ref.read(examProvider.notifier).state = ref.read(examProvider)?.copyWith(
          examCompleted: exam?.examCompleted,
          examStart: exam?.examStart,
          examEnd: exam?.examEnd,
          numOfQuestion: exam?.numOfQuestion,
          numAnsweredQuestion: exam?.numAnsweredQuestion,
          numOfCorrect: exam?.numOfCorrect,
          score: exam?.score,
        );

    _updateExamStage();
  }

  Future loadQuestion([Go? go]) async {
    if (ref.read(questionsProvider) == null) {
      log("loadQuestion => questionsProvider : null", name: "EXAM-CTRL");
      return;
    }

    if (ref.read(examProvider) == null) {
      log("loadQuestion => examProvider : null", name: "EXAM-CTRL");
      return;
    }

    int index = ref.read(examProvider)?.syncQuestion ?? 0;
    if (go != null) {
      int newIndex = switch (go) {
        Go.next => index == (ref.read(questionsProvider)!.length - 1) ? index : index + 1,
        Go.previous => index == 0 ? 0 : index - 1,
        Go.first => 0,
        Go.last => ref.read(questionsProvider)!.length - 1,
      };
      ref.read(examProvider.notifier).state = ref.read(examProvider)?.copyWith(syncQuestion: newIndex);
      log("loadQuestion => newIndex : $newIndex", name: "EXAM-CTRL");
    }

    _getSilentPic(index);

    await fetchQuestion();
  }

  Future<void> fetchQuestion() async {
    int index = ref.read(examProvider)?.syncQuestion ?? 0;
    var questions = ref.read(questionsProvider);
    var question = questions?[index];

    if (question?.question != null) {
      ref.read(questionProvider.notifier).state = question;
      log("loadQuestion => questionId : ${question?.questionId}", name: "EXAM-CTRL");
      return;
    }

    LoadingService.show(['Loading pertanyaan', 'Masih loading', 'Sepertinya jaringan internet sedang lemot']);
    final reqs = Reqs(
      method: "exam4.question",
      params: {
        'question_id': question?.questionId,
      },
    );
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));
    LoadingService.dissmiss();

    if (state.hasError) return;

    question = state.value?.result == null ? null : Question.fromJson(state.value?.result);

    questions?[index] = question!;
    ref.read(questionProvider.notifier).state = question;
    ref.read(questionsProvider.notifier).state = questions;
    log("loadQuestion => questionId : ${question?.questionId}", name: "EXAM-CTRL");
  }

  Future updatePhotoExamStart(File file) async {
    final reqs = Reqs(method: "exam4.upload_photo_exam_start", filePath: file.path);
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    var dummyId = Random().nextInt(99999);
    final examPhotos = ref.read(examPhotosProvider) ?? ExamPhotos();

    ref.read(examPhotosProvider.notifier).state = examPhotos.copyWith(examStart: "${state.value?.result}?v=$dummyId");
  }

  Future updatePhotoExamFinish(File file) async {
    final reqs = Reqs(method: "exam4.upload_photo_exam_finish", filePath: file.path);
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    var dummyId = Random().nextInt(99999);
    final examPhotos = ref.read(examPhotosProvider) ?? ExamPhotos();

    ref.read(examPhotosProvider.notifier).state = examPhotos.copyWith(examFinish: "${state.value?.result}?v=$dummyId");
  }

  void _getSilentPic(int index) {
    index += 1;
    if (index == randomPages[0]) {
      CameraService().takeSilencePic(callback: updatePhotoExamRandom1);
    }
    if (index == randomPages[1]) {
      CameraService().takeSilencePic(callback: updatePhotoExamRandom2);
    }
  }

  List<int> _getRandomCount([int min = 5, int max = 40]) {
    List<int> rndNum = [];
    rndNum.add(_getUniqueNum(min, max));
    rndNum.add(_getUniqueNum(min, max, rndNum[0]));
    rndNum.sort();
    return rndNum;
  }

  int _getUniqueNum(int min, int max, [int seed = 0]) {
    int r = Random().nextInt(max - min) + min;
    return r == seed ? _getUniqueNum(min, max, seed) : r;
  }

  Future updatePhotoExamRandom1(File file) async {
    final reqs = Reqs(method: "exam4.upload_photo_exam_random1", filePath: file.path);
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    log("updatePhotoExamRandom1 => DONE", name: "EXAM-CTRL");
  }

  Future updatePhotoExamRandom2(File file) async {
    final reqs = Reqs(method: "exam4.upload_photo_exam_random2", filePath: file.path);
    final state = await AsyncValue.guard(() async => await ref.read(jsonRpcProvider).call(reqs: reqs));

    if (state.hasError) return;

    log("updatePhotoExamRandom2 => DONE", name: "EXAM-CTRL");
  }
}

final examCtrlProvider = Provider(ExamCtrl.new);
