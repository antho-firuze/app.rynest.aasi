import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:math' hide log;

import 'package:app.rynest.aasi/common/controller/location_ctrl.dart';
import 'package:app.rynest.aasi/common/controller/network_ctrl.dart';
import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/model/resp.dart';
import 'package:app.rynest.aasi/common/services/alert_service.dart';
import 'package:app.rynest.aasi/common/services/api_service.dart';
import 'package:app.rynest.aasi/common/services/camera_service.dart';
import 'package:app.rynest.aasi/common/services/device_service.dart';
import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/examination/model/exam.dart';
import 'package:app.rynest.aasi/features/examination/model/exam_photo.dart';
import 'package:app.rynest.aasi/features/examination/model/exam_schedule.dart';
import 'package:app.rynest.aasi/features/examination/model/question.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_question_view.dart';
import 'package:app.rynest.aasi/features/examination/views/exam_result_view.dart';
import 'package:app.rynest.aasi/utils/datetime_utils.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _kLogName = 'EXAM-CTRL';

enum Go { next, previous, first, last }

enum FontSize { increase, decrease }

final fontSizeProvider = StateProvider<double>((ref) => 16);
final autoNextQuestionProvider = StateProvider<bool>((ref) => false);

final examProvider = StateProvider<Exam?>((ref) => null);
final examScheduleProvider = StateProvider<ExamSchedule?>((ref) => null);
final examPhotosProvider = StateProvider<List<ExamPhoto>>((ref) => []);

final examStillGoingProvider = StateProvider<bool>((ref) => false);
final examInterruptionProvider = StateProvider<bool>((ref) => false);
final remainingTimeStrProvider = StateProvider<String>((ref) => '');
final isRemainingTimeStillGoingProvider = StateProvider<bool?>((ref) => null);

final questionNumProvider = StateProvider<int>((ref) => 1);

final fetchExamScheduleProvider = FutureProvider<ExamSchedule?>((ref) async {
  final reqs = Reqs(path: '/api/v1/exam/schedule', data: {
    "datetime": DateTime.now().dbDateTime(),
  });
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.hasError) return null;
  if (state.value == null) return null;

  final schedule = ExamSchedule.fromJson(state.value);
  ref.read(examScheduleProvider.notifier).state = schedule;
  return schedule;
});

final fetchExamResultProvider = FutureProvider<Exam?>((ref) async {
  if (ref.read(examScheduleProvider) == null) {
    // ignore: unused_result
    ref.refresh(fetchExamScheduleProvider);
  }

  final reqs = Reqs(path: '/api/v1/exam/result', data: {
    "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
    "device_id": ref.read(deviceIdProvider),
  });
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.value == null) return null;

  final exam = Exam.fromJson(state.value);
  return exam;
});

final fetchExamPhotosProvider = FutureProvider<List<ExamPhoto>?>((ref) async {
  final reqs = Reqs(path: '/api/v1/exam/photos', data: {
    "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
  });
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.hasError) return null;
  if (state.value == null) return null;

  final examPhotos = (state.value as List<dynamic>)
      .map((json) => ExamPhoto.fromJson(json))
      .toList(); // ExamPhoto.fromJson(state.value)
  // log("examPhotos.length: ${examPhotos.length}");
  ref.read(examPhotosProvider.notifier).state = examPhotos;
  return examPhotos;
});

final fetchQuestionProvider = FutureProvider<Question?>((ref) async {
  final exam = ref.read(examProvider);
  final qid = exam?.syncQuestion;
  final idx = exam?.qids.indexOf(qid!);
  final opt = exam?.opts[idx!];

  final reqs = Reqs(path: '/api/v1/exam/question', data: {
    "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
    "question_id": qid,
    "shuffle": opt,
    "device_id": ref.read(deviceIdProvider),
  });
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.hasError) {
    RespError err = state.error as RespError;
    log('question error : ${err.code} - ${err.message}', name: _kLogName);
    if (err.code == 409) {
      ref.read(examInterruptionProvider.notifier).state = true;
    }
    return null;
  }
  if (state.value == null) return null;

  final question = Question.fromJson(state.value);
  return question;
});

final fetchExamInfoProvider = FutureProvider<Exam?>((ref) async {
  final reqs = Reqs(path: '/api/v1/exam/info', data: {
    "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
    "category_id": ref.read(examScheduleProvider)?.categoryId,
    "device_id": ref.read(deviceIdProvider),
  });
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  if (state.hasError) return null;
  if (state.value == null) return null;

  final exam = Exam.fromJson(state.value);
  ref.read(examProvider.notifier).state = exam.afterStart();
  return exam;
});

class ExamCtrl {
  final Ref ref;
  ExamCtrl(this.ref);

  final _fontSizeKey = 'COOKIE_FONT_SIZE';
  final _autoNextQuestionKey = 'COOKIE_AUTO_NEXT_QUESTION';

  final _maxFontSize = 24.0;
  final _minFontSize = 16.0;

  Timer? _mainTimer;
  List<int> randomPages = [];

  void initialize() async {
    log('Initialize Examination !');

    loadSetting();

    ref.listen(examScheduleProvider, (previous, next) {
      if (next != null) {
        if (next.state == 'ON-GOING') {
          checkIfExamStillOnGoing(examSchedule: next, exam: ref.read(examProvider));
        }
        if (next.state == 'COMPLETED') {
          // ignore: unused_result
          ref.refresh(fetchExamResultProvider);
          // ignore: unused_result
          ref.refresh(fetchExamPhotosProvider);
          ref.read(examStillGoingProvider.notifier).state = false;
        } else {
          ref.read(examStillGoingProvider.notifier).state = false;
        }
      }
    });

    ref.listen(examProvider, (previous, next) {
      if (next != null) {
        if (next.state == 'ON-GOING') {
          checkIfExamStillOnGoing(examSchedule: ref.read(examScheduleProvider), exam: next);
        } else {
          ref.read(examStillGoingProvider.notifier).state = false;
        }
      }
    });

    ref.listen(authUserProvider, (previous, next) async {
      if (next != null) {
        // ignore: unused_result
        ref.refresh(fetchExamScheduleProvider);
      } else {
        ref.read(examScheduleProvider.notifier).state = null;
      }
    });

    if (ref.read(authUserProvider) != null) {
      // ignore: unused_result
      ref.refresh(fetchExamScheduleProvider);
    }
  }

  void loadSetting() {
    ref.read(fontSizeProvider.notifier).state = ref.read(sharedPrefProvider).getDouble(_fontSizeKey) ?? 16;
    ref.read(autoNextQuestionProvider.notifier).state =
        ref.read(sharedPrefProvider).getBool(_autoNextQuestionKey) ?? false;
  }

  void checkIfExamStillOnGoing({ExamSchedule? examSchedule, Exam? exam, bool showLog = false}) async {
    if (examSchedule?.state == 'ON-GOING') {
      if (showLog) log('exam : $exam', name: _kLogName);
      if (exam == null) {
        // ignore: unused_result
        ref.refresh(fetchExamInfoProvider);
      } else {
        if (ref.read(isRemainingTimeStillGoingProvider) == null) {
          _startTimer();
        } else if (ref.read(isRemainingTimeStillGoingProvider) == true) {
          ref.read(examStillGoingProvider.notifier).state = true;
        } else {
          ref.read(examStillGoingProvider.notifier).state = false;
        }
      }
    }
  }

  void setFontSize(FontSize size, {bool showLog = false}) {
    double oldSize = ref.read(fontSizeProvider);
    if (showLog) log("oldSize : $oldSize", name: _kLogName);

    if (size == FontSize.increase) {
      double newSize = oldSize + 1;
      if (showLog) log("newSize : $newSize", name: _kLogName);
      if (newSize > _maxFontSize) {
        SnackBarService(message: Text('Ukuran font sudah maksimal')).shown(bottom: 50);
      } else {
        ref.read(fontSizeProvider.notifier).state = newSize;
        ref.read(sharedPrefProvider).setDouble(_fontSizeKey, newSize);
        SnackBarService(message: Text('Zoom In')).shown(bottom: 50);
      }
    } else {
      double newSize = oldSize - 1;
      if (showLog) log("newSize : $newSize", name: _kLogName);
      if (newSize < _minFontSize) {
        SnackBarService(message: Text('Ukuran font sudah minimal')).shown(bottom: 50);
      } else {
        ref.read(fontSizeProvider.notifier).state = newSize;
        ref.read(sharedPrefProvider).setDouble(_fontSizeKey, newSize);
        SnackBarService(message: Text('Zoom Out')).shown(bottom: 50);
      }
    }
  }

  void setAutoNext({bool showLog = false}) {
    bool autoNext = !ref.read(autoNextQuestionProvider);
    ref.read(autoNextQuestionProvider.notifier).state = autoNext;
    ref.read(sharedPrefProvider).setBool(_autoNextQuestionKey, ref.read(autoNextQuestionProvider));
    if (showLog) log("AutoNext : $autoNext", name: _kLogName);
    SnackBarService(message: Text("Auto Next : ${autoNext ? 'ON' : 'OFF'}")).shown(bottom: 50);
  }

  void _startTimer({bool showLog = false}) {
    final exam = ref.read(examProvider);

    if (showLog) log('durationInMinutes : ${exam?.duration}', name: _kLogName);
    int durationInMinutes = exam?.duration ?? 90;

    // Check remaining duration before start the TIMER.
    DateTime? finishPredictiction = exam?.startAt?.add(Duration(minutes: durationInMinutes));
    Duration? duration = finishPredictiction?.difference(DateTime.now());
    if (duration!.inSeconds < 1) {
      ref.read(isRemainingTimeStillGoingProvider.notifier).state = false;
      return;
    }

    _cancelTimer();
    ref.read(isRemainingTimeStillGoingProvider.notifier).state = true;

    _mainTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
      final finishPredictiction = exam?.startAt?.add(Duration(minutes: durationInMinutes));

      final duration = finishPredictiction?.difference(DateTime.now());
      ref.read(remainingTimeStrProvider.notifier).state = duration!.toHHNNSS();

      // Check if duration has reached
      if (duration.inSeconds < 1) {
        _cancelTimer();
        ref.read(isRemainingTimeStillGoingProvider.notifier).state = false;
        await callFinish(force: true);
      }
    });
  }

  void _cancelTimer() {
    _mainTimer?.cancel();
    _mainTimer == null;
  }

  Future<void> callStart({bool showLog = false}) async {
    final reqs = Reqs(path: '/api/v1/exam/start', data: {
      "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
      "category_id": ref.read(examScheduleProvider)?.categoryId,
      "start_at": DateTime.now().dbDateTime(),
      "device_id": ref.read(deviceIdProvider),
      "device_name": ref.read(deviceNameProvider),
      "ip_address": ref.read(wifiIPv4Provider),
      "location": ref.read(locationProvider),
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) return;
    if (state.value == null) return;

    final exam = Exam.fromJson(state.value);
    if (exam.state == 'COMPLETED') {
      // ignore: unused_result
      ref.refresh(fetchExamScheduleProvider);
      return;
    }

    ref.read(examProvider.notifier).state = exam.afterStart();

    // Set random page for getting silent picture
    randomPages = _getRandomCount();
    if (showLog) log("randomPages : $randomPages", name: _kLogName);

    ref.read(examInterruptionProvider.notifier).state = false;

    // GOTO Question Page
    ref.read(pageUtilsProvider).goto(page: ExamQuestionView());
    loadQuestion();
    _startTimer();
  }

  Future<void> callFinish({bool force = false, bool showLog = true}) async {
    if (force == false) {
      bool result = await AlertService.confirm(
        body: 'Anda sudah yakin ingin menyelesaikan ujian ini ?',
      );
      if (showLog) log('result : $result', name: _kLogName);
      if (result == false) return;

      ref.read(pageUtilsProvider).popz();
    }

    ref.read(examStillGoingProvider.notifier).state = false;
    ref.read(examInterruptionProvider.notifier).state = false;

    final reqs = Reqs(path: '/api/v1/exam/finish', data: {
      "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
      "finish_at": DateTime.now().dbDateTime(),
      "device_id": ref.read(deviceIdProvider),
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

    if (state.hasError) {
      // This conditionally executed if network is not connected
      if (showLog) log('callFinish : network is not connected', name: _kLogName);
      final examSchedule = ref.read(examScheduleProvider);
      ref.read(examScheduleProvider.notifier).state = examSchedule?.copyWith(state: 'COMPLETED');
      final exam = ref.read(examProvider);
      ref.read(examProvider.notifier).state = exam?.copyWith(state: 'COMPLETED');
      return;
    }

    _cancelTimer();
    // ignore: unused_result
    ref.refresh(fetchExamScheduleProvider);
    // ignore: unused_result
    ref.refresh(fetchExamResultProvider);
  }

  Future<void> callAnswer(int idx, String answer, {bool showLog = true}) async {
    final exam = ref.read(examProvider);
    String? oldKey = exam?.keys[idx];
    answer = answer.toUpperCase();

    if (showLog) log('oldAnswer : $oldKey', name: _kLogName);
    if (showLog) log('newAnswer : $answer', name: _kLogName);
    if (answer == oldKey) return;

    if (showLog) log('answerKeys : ${exam?.answerKeys}', name: _kLogName);

    int? qid = exam?.qids[idx];
    String? opt = exam?.opts[idx];
    String? qIdOpt = "$qid$opt";
    if (showLog) log('question_id : $qIdOpt', name: _kLogName);

    final reqs = Reqs(path: '/api/v1/exam/answer', data: {
      "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
      "question_id": qIdOpt,
      "answered_key": answer,
      "device_id": ref.read(deviceIdProvider),
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs));

    if (state.hasError) {
      RespError err = state.error as RespError;
      if (showLog) log('answer error : ${err.code} - ${err.message}', name: _kLogName);
      if (err.code == 409) {
        ref.read(examInterruptionProvider.notifier).state = true;
      }
      return;
    }
    if (state.value == null) return;

    final examR = exam?.afterAnswer(idx, answer);
    if (showLog) log('answerKeys : ${examR?.answerKeys}', name: _kLogName);
    ref.read(examProvider.notifier).state = examR;

    if (ref.read(autoNextQuestionProvider) == true) {
      loadQuestion(Go.next);
    }
  }

  Future<void> callCheckScore({bool showLog = true}) async {
    final exam = ref.read(examProvider);
    int clickScore = exam?.clickScore ?? 0;
    int checkScore = exam?.checkScore ?? 0;

    if (checkScore >= clickScore) {
      SnackBarService(message: Text("Cek score sudah mencapai batas maksimal (maks: $checkScore kali)"))
          .shown(bottom: 50);
      return;
    }
    bool result = await AlertService.confirm(
      body: """Anda memiliki ${clickScore - checkScore} kali kesempatan${checkScore == 1 ? ' lagi' : ''}. \n
      Apakah anda ingin menggunakannya Cek Score sekarang?""",
    );
    if (showLog) log('result : $result', name: _kLogName);
    if (result == false) return;

    final reqs = Reqs(path: '/api/v1/exam/check_score', data: {
      "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
      "device_id": ref.read(deviceIdProvider),
    });
    final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

    if (state.hasError) {
      RespError err = state.error as RespError;
      if (showLog) log('check_score error : ${err.code} - ${err.message}', name: _kLogName);
      if (err.code == 409) {
        ref.read(examInterruptionProvider.notifier).state = true;
      }
      return;
    }
    if (state.value == null) return;

    final examR = Exam.fromJson(state.value);

    ref.read(examProvider.notifier).state = exam?.copyWith(checkScore: examR.checkScore, state: examR.state);
    if (examR.state == 'COMPLETED') {
      // ignore: unused_result
      ref.refresh(fetchExamScheduleProvider);
      return;
    }

    // ignore: unused_result
    ref.refresh(fetchExamResultProvider);

    // GOTO Result Page
    ref.read(pageUtilsProvider).goto(page: ExamResultView(type: 1));
  }

  void loadQuestion([Go? go, bool showLog = false]) {
    final exam = ref.read(examProvider);
    if (exam == null) {
      if (showLog) log("exam : null", name: _kLogName);
      return;
    }

    int? qid = [null, 0].contains(exam.syncQuestion) ? exam.qids.first : exam.syncQuestion;
    if (showLog) log("qid : $qid", name: _kLogName);
    ref.read(examProvider.notifier).state = exam.copyWith(syncQuestion: qid);

    int qLen = exam.qids.length;
    int index = exam.qids.indexOf(qid!);
    if (showLog) log("index : $index", name: _kLogName);
    if (go != null) {
      int newIndex = switch (go) {
        Go.next => index == (qLen - 1) ? index : index + 1,
        Go.previous => index == 0 ? 0 : index - 1,
        Go.first => 0,
        Go.last => qLen - 1,
      };
      if (showLog) log("newIndex : $newIndex", name: _kLogName);

      if (newIndex == index) {
        if ([Go.previous, Go.first].contains(go)) {
          SnackBarService(message: Text('Ini soal yang pertama !')).shown(bottom: 50);
        } else {
          SnackBarService(message: Text('Ini soal yang terakhir !')).shown(bottom: 50);
        }
      } else {
        ref.read(examProvider.notifier).state = exam.copyWith(syncQuestion: exam.qids[newIndex]);

        int pageNum = newIndex + 1;
        ref.read(questionNumProvider.notifier).state = pageNum;

        _getSilentPic(pageNum);

        // ignore: unused_result
        ref.refresh(fetchQuestionProvider);
      }
    } else {
      int pageNum = index + 1;
      _getSilentPic(pageNum);

      ref.read(questionNumProvider.notifier).state = pageNum;
      // // GOTO Question Page
      // ref.read(pageUtilsProvider).goto(page: ExamQuestionView());
      // ignore: unused_result
      ref.refresh(fetchQuestionProvider);
    }
  }

  void callThatsMe() {
    ref.read(examInterruptionProvider.notifier).state = false;
    ref.read(pageUtilsProvider).popz();
    // ignore: unused_result
    ref.refresh(fetchExamScheduleProvider);
  }

  Future updatePhotoExamStart(File file, {bool showLog = false}) async {
    if (showLog) log("file : ${file.path}", name: _kLogName);

    final reqs = Reqs(
      path: '/api/v1/exam/upload_photo',
      filePath: file.path,
      fileKey: 'userfile',
      data: {
        "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
        "type": "exam_start",
      },
    );
    final state =
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs, showLog: true));

    if (state.hasError) return;

    if (state.value != null) {
      final dummyId = Random().nextInt(99999);
      final url = "${state.value['url']}?v=$dummyId";
      if (showLog) log("url : $url", name: _kLogName);

      // ignore: unused_result
      ref.refresh(fetchExamScheduleProvider);
    } else {
      SnackBarService.show(message: "Error : Response null from aws server");
    }
  }

  Future updatePhotoExamFinish(File file, {bool showLog = false}) async {
    if (showLog) log("file : ${file.path}", name: _kLogName);

    final reqs = Reqs(
      path: '/api/v1/exam/upload_photo',
      filePath: file.path,
      fileKey: 'userfile',
      data: {
        "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
        "type": "exam_finish",
      },
    );
    final state =
        await AsyncValue.guard(() async => await ref.read(apiServiceProvider).call(reqs: reqs, showLog: true));

    if (state.hasError) return;

    if (state.value != null) {
      final dummyId = Random().nextInt(99999);
      final url = "${state.value['url']}?v=$dummyId";
      if (showLog) log("url : $url", name: _kLogName);

      // ignore: unused_result
      ref.refresh(fetchExamResultProvider);
      // ignore: unused_result
      ref.refresh(fetchExamScheduleProvider);
    } else {
      SnackBarService.show(message: "Error : Response null from aws server");
    }
  }

  Future updatePhotoExamRandom1(File file, {bool showLog = false}) async {
    if (showLog) log("file : ${file.path}", name: _kLogName);

    final reqs = Reqs(
      path: '/api/v1/exam/upload_photo',
      filePath: file.path,
      fileKey: 'userfile',
      data: {
        "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
        "type": "exam_rnd_1",
      },
    );
    final state = await AsyncValue.guard(
        () async => await ref.read(apiServiceProvider).call(reqs: reqs, showBusy: false, showLog: true));

    if (state.hasError) return;

    if (state.value != null) {
      final dummyId = Random().nextInt(99999);
      final url = "${state.value['url']}?v=$dummyId";
      if (showLog) log("url : $url", name: _kLogName);
    } else {
      if (showLog) log("Error : Response null from aws server", name: _kLogName);
    }
  }

  Future updatePhotoExamRandom2(File file, {bool showLog = false}) async {
    if (showLog) log("file : ${file.path}", name: _kLogName);

    final reqs = Reqs(
      path: '/api/v1/exam/upload_photo',
      filePath: file.path,
      fileKey: 'userfile',
      data: {
        "schedule_request_id": ref.read(examScheduleProvider)?.scheduleRequestId,
        "type": "exam_rnd_2",
      },
    );
    final state = await AsyncValue.guard(
        () async => await ref.read(apiServiceProvider).call(reqs: reqs, showBusy: false, showLog: true));

    if (state.hasError) return;

    if (state.value != null) {
      final dummyId = Random().nextInt(99999);
      final url = "${state.value['url']}?v=$dummyId";
      if (showLog) log("url : $url", name: _kLogName);
    } else {
      if (showLog) log("Error : Response null from aws server", name: _kLogName);
    }
  }

  void _getSilentPic(int pageNum, {bool showLog = false}) {
    // index += 1;
    if (showLog) log('get_pic => index : $pageNum | rnd : $randomPages', name: _kLogName);
    if (pageNum == randomPages[0]) {
      CameraService().takeSilencePic(callback: updatePhotoExamRandom1);
    }
    if (pageNum == randomPages[1]) {
      CameraService().takeSilencePic(callback: updatePhotoExamRandom2);
    }
  }

  List<int> _getRandomCount([int min = 5, int max = 40]) {
    List<int> rndNum = [];
    rndNum.add(_getUniqueNum(min, 20));
    rndNum.add(_getUniqueNum(21, max, rndNum[0]));
    rndNum.sort();
    return rndNum;
  }

  int _getUniqueNum(int min, int max, [int seed = 0]) {
    int r = Random().nextInt(max - min) + min;
    return r == seed ? _getUniqueNum(min, max, seed) : r;
  }
}

final examCtrlProvider = Provider(ExamCtrl.new);

// EXAM STATE TEST - BEFORE START|START|RESTART
// ===============================
// [ok] check exam schedule
// [ok] check photo (selfie, idcard & startExam)
// [ok] test restart apps: sync last question
// [ok] test restart apps: notif exam still running
// TODO [?] test restart apps: with diff device, diff location, diff ip_address
// TODO [?] test restart apps: with notif on another device

// EXAM STATE TEST - ON-GOING|RESTART
// ===============================
// [ok] test zoom in/out
// [ok] test auto next question
// [ok] test timer
// [ok] test check score
// [ok] check exam result (temporary)

// EXAM STATE TEST - FINISH
// ===============================
// [ok] test finish button
// [ok] test auto finish timeout (data conected)
// [ok] test auto finish timeout (data not connected)
// [ok] check photo (finishExam)
// [ok] check exam result (final)
