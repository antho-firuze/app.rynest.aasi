import 'dart:async';
import 'dart:math';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/helpers/api_helper.dart';
import 'package:app.rynest.aasi/models/exam.dart';
import 'package:app.rynest.aasi/models/question.dart';
import 'package:app.rynest.aasi/models/result.dart';
import 'package:app.rynest.aasi/services/account_service.dart';
import 'package:app.rynest.aasi/services/media_service.dart';
import 'package:app.rynest.aasi/ui/shared/loading_mee.dart';

import 'package:app.rynest.aasi/helpers/extensions.dart';
import 'package:app.rynest.aasi/ui/shared/toast_mee.dart';
import 'package:camera/camera.dart';
import 'package:logger/logger.dart';

import '../constants/picture_type.dart';
import '../helpers/F.dart';
import '../models/photos.dart';
import '../ui/shared/dialog_mee.dart';
import '../ui/shared/widgets/camera_page.dart';

enum Go { next, previous, first, last }

class ExamService {
  final accountService = locator<AccountService>();
  final mediaService = locator<MediaService>();

  final Logger log = Logger();

  Exam? exam;
  Question? question;
  List<Question>? questions;
  Duration? duration;
  // double minimumAnswers = 0.6; // 60%
  // bool isMinimumAnswered = false;
  // int restOfRepeat = 0;
  String questionsInfo = '';

  Photos? photos;
  List<int> rndNum = [];

  // bool isAutoNextQuestion = true;
  // double fontSize = 16;

  // Future init() async {
  //   isAutoNextQuestion = await F.session.isAutoNextQuestion();
  //   fontSize = double.parse((await F.session.fontSize()).toString());
  // }

  Future getPhotos({bool isRefresh = false, bool showLoading = false}) async {
    if (showLoading) LoadingMee.show();
    Result result =
        await apiHelper.callAPIJsonRPC(method: apiMethod.examPhotos);
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await getPhotos(isRefresh: isRefresh, showLoading: showLoading);
      }

      photos = null;
      return Result.error(message: result.message, errCode: result.errCode);
    }

    photos = Photos.fromJson(result.data);
    return Result.success(message: result.message);
  }

  Future<bool?> getImageStartExam({
    bool retake = false,
    String? message,
  }) async {
    if (await F.isURLValid(photos?.examStart)) {
      return true;
    }

    if (!retake) {
      message = message ?? 'Silahkan anda ambil foto sebelum ujian !';
      await DialogMee.show(message);
    }

    var cameras = await availableCameras();
    String? imagePath = await F.navigate(
        CameraPage(
          cameras: cameras,
          cameraType: CameraType.selfie,
        ),
        force: true);
    // String? imagePath = await mediaService.getImageFromCamera();
    if (imagePath == null) {
      await DialogMee.show(
          'Maaf, anda belum mengambil foto. \nSilahkan ambil foto ulang !');
      return await getImageStartExam(retake: true, message: message);
    }

    Result result = await accountService.savePicture(
      filePath: imagePath,
      type: PictureType.start,
    );

    if (!result.status) {
      await DialogMee.show(result.message);
      return false;
    }

    photos?.examStart = result.data;

    await DialogMee.show('Photo berhasil disimpan !');
    return true;
  }

  genRndCount() {
    int min = 5;
    int max = 40;
    rndNum.add(getUniqueNum(min: min, max: max));
    rndNum.add(getUniqueNum(min: min, max: max, seed: rndNum[0]));
    rndNum.sort();
  }

  int getUniqueNum({required int min, required int max, int seed = 0}) {
    int r = Random().nextInt(max - min) + min;
    return r == seed ? getUniqueNum(min: min, max: max, seed: seed) : r;
  }

  getSilentPic() {
    F.log.i('GET RANDOM PIC ON => $rndNum');
    var index = questions?.indexOf(question!);
    if (index != null) {
      index += 1;
      if (index == rndNum[0]) {
        getSilentPic1();
      }
      if (index == rndNum[1]) {
        getSilentPic2();
      }
    }
  }

  Future getSilentPic1() async {
    var imagePath = await mediaService.takeSilencePic();
    if (imagePath == null) {
      return;
    }
    await accountService.savePicture(
      filePath: imagePath,
      type: PictureType.random1,
      showLoading: false,
    );
  }

  Future getSilentPic2() async {
    var imagePath = await mediaService.takeSilencePic();
    if (imagePath == null) {
      return;
    }
    await accountService.savePicture(
      filePath: imagePath,
      type: PictureType.random2,
      showLoading: false,
    );
  }

  Future<bool?> getImageFinishExam({
    bool retake = false,
    String? message,
  }) async {
    if (await F.isURLValid(photos?.examFinish)) {
      return true;
    }

    if (!retake) {
      message = message ?? 'Silahkan anda ambil foto setelah ujian !';
      await DialogMee.show(message);
    }

    var cameras = await availableCameras();
    String? imagePath = await F.navigate(
        CameraPage(
          cameras: cameras,
          cameraType: CameraType.selfie,
        ),
        force: true);
    // String? imagePath = await mediaService.getImageFromCamera();
    if (imagePath == null) {
      await DialogMee.show(
          'Maaf, anda belum mengambil foto. \nSilahkan ambil foto ulang !');
      return await getImageFinishExam(retake: true, message: message);
    }

    Result result = await accountService.savePicture(
      filePath: imagePath,
      type: PictureType.finish,
    );

    if (!result.status) {
      await DialogMee.show(result.message);
      return false;
    }

    photos?.examFinish = result.data;

    await DialogMee.show('Photo berhasil disimpan !');
    return true;
  }

  Future<bool?> checkIsExamAvailable() async {
    log.i('Check Schedule Available : '
        '${accountService.schedule == null ? 'NO' : 'YES'}');
    if (accountService.schedule == null) {
      await DialogMee.show(
          'Anda belum terjadwal dalam Ujian !\n\nSilahkan hubungi CS.');
      return false;
    }

    log.i('Check Schedule Status : ${accountService.profile?.status}');
    if (accountService.profile?.status == 2) {
      await DialogMee.show(
          'Jadwan Ujian Anda dibatalkan !\n\nSilahkan hubungi CS.');
      return false;
    }

    // CHECK photo & KTP
    LoadingMee.show();
    bool a = await F.isURLValid(accountService.profile?.photo);
    bool b = await F.isURLValid(accountService.profile?.photoIdCard);
    LoadingMee.dismiss();
    log.i("Check Photo Selfie & KTP :"
        "\n- [Selfie = ${a ? 'YES' : 'NO'}]"
        "\n- [ID CARD = ${b ? 'YES' : 'NO'}]");

    if (!a && !b) {
      await DialogMee.show(
          'Silahkan lengkapi Data Anda terlebih dahulu. \n\nIsi dan lengkapi \nPhoto Profile & Photo KTP \npada halaman akun.');
      return false;
    }

    if (!a) {
      await DialogMee.show(
          'Silahkan lengkapi Photo Profile pada halaman akun !');
      return false;
    }

    if (!b) {
      await DialogMee.show('Silahkan lengkapi Photo KTP pada halaman akun !');
      return false;
    }

    // CHECK Exam Schedule
    DateTime? openRegistration = accountService.schedule?.openRegistration;
    DateTime? closeRegistration = accountService.schedule?.closeRegistration;
    log.i('Check Exam Schedule : '
        '\n- OpenRegistration = ${openRegistration?.format('dd MMM yyyy • HH:mm')}'
        '\n- CloseRegistration = ${closeRegistration?.format('dd MMM yyyy • HH:mm')}');

    if (DateTime.now().isBefore(openRegistration!)) {
      await DialogMee.show(
          'Jadwal Ujian anda dimulai pada ${openRegistration.asFormatTime()}');
      return false;
    }
    if (DateTime.now().isAfter(closeRegistration!)) {
      await DialogMee.show(
          'Jadwal Ujian anda sudah selesai pada ${closeRegistration.asFormatTime()}');
      return false;
    }

    log.i('Check Exam Available : '
        '${exam == null ? 'NO' : 'YES'}');
    if (exam != null) {
      log.i('Check Is Exam Completed : '
          '${exam?.examCompleted == true ? 'YES' : 'NO'}');

      if (exam?.examCompleted != null) {
        if (exam?.examCompleted == true) {
          await DialogMee.show('Maaf, ujian anda sudah berakhir !');
          return false;
        }

        if (exam?.examCompleted == false) {
          duration = await getDuration();
          if (duration!.inSeconds < 1) {
            await DialogMee.show('Maaf, waktu ujian anda sudah habis !');
            return false;
          }
        }

        // Exam is still running
        String text = 'Anda ingin melanjutkan ujian sekarang ?';
        if (await DialogMee.confirm(text) == true) {
          return true;
        }

        return false;
      }
    }

    String text = 'Anda yakin akan memulai ujian sekarang ?';
    if (await DialogMee.confirm(text) == true) {
      text = 'Kosongkan waktu maksimal '
          '${accountService.schedule?.duration ?? 90} menit kedepan, '
          'apakah anda sudah benar-benar siap ?';
      if (await DialogMee.confirm(text) == true) {
        return true;
      }
    }

    return false;
  }

  Future<bool?> checkIsExamResultAvailable() async {
    if (exam == null) {
      await DialogMee.show('Hasil Ujian anda belum tersedia !');
      return false;
    }

    return true;
  }

  Future<bool?> checkIsExamScheduleAvailable() async {
    await accountService.getSchedule(showLoading: true);
    await getStatus(showLoading: true);

    if (accountService.schedule == null) {
      await DialogMee.show(
          'Jadwal ujian belum tersedia !\n\nSilahkan hubungi CS.');
      return false;
    }

    log.d(accountService.schedule?.toJson());
    return true;
  }

  Future<Duration?> getDuration() async =>
      exam?.examEnd?.difference(DateTime.now());

  bool getMinimumAnswered() {
    List<Question>? answered =
        questions?.where((element) => element.answeredKey != '').toList();

    if (answered == null) return false;

    double minAnswerPercent =
        questions!.length * exam!.minOfAnswer!.toDouble() / 100;
    return answered.length >= minAnswerPercent;
  }

  // Future getRestOfRepeat() async {
  //   restOfRepeat = exam!.numOfRepeat!;
  // }

  void getQuestionsInfo() {
    var index = questions?.indexOf(question!);
    questionsInfo =
        '${index == null ? 0 : index + 1} / ${questions?.length ?? 0}';

    // GET SILENT PIC
    getSilentPic();
  }

  Future getResult({bool isRefresh = false, bool showLoading = false}) async {
    // if (isRefresh == false) {
    //   // CHECK IN THE SESSION
    //   if (showLoading) LoadingMee.show();
    //   var examSession = await F.session.exam();
    //   LoadingMee.dismiss();
    //   if (F.isNullOrEmpty(examSession) == false) {
    //     exam = Exam.fromJson(jsonDecode(examSession!));
    //     log.i('Get Exam Result from Session !');
    //     log.d(exam!.toJson());
    //     return Result.success(message: 'Get Exam Result from Session !');
    //   }
    //   log.i('Get Exam Result from Server !');
    // }

    if (showLoading) LoadingMee.show();
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.examResult,
      params: {
        'date_client': DateTime.now().asFormatDBDate(),
        'time_client': DateTime.now().asFormatDBTime(),
      },
    );
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await getResult(isRefresh: isRefresh, showLoading: showLoading);
      }

      // exam = null;
      // await F.session.exam(clear: true);
      return Result.error(message: result.message, errCode: result.errCode);
    }

    exam = result.data == null ? null : Exam.fromJson(result.data);
    // await F.session.exam(value: jsonEncode(exam!.toJson()));
    return Result.success(message: result.message);
  }

  Future getQuestions() async {
    LoadingMee.show();
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.examQuestions,
      params: {
        'date_client': DateTime.now().asFormatDBDate(),
        'time_client': DateTime.now().asFormatDBTime(),
      },
    );
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await getQuestions();
      }

      questions = null;
      return Result.error(message: result.message, errCode: result.errCode);
    }

    questions = Question.fromJsonList(result.data);
    questionsSetup();
    return Result.success(message: result.message);
  }

  void questionsSetup() {
    List<Question> qAnswered =
        questions!.where((element) => element.answeredKey != '').toList();
    List<Question> qNAnswered =
        questions!.where((element) => element.answeredKey == '').toList();
    questions!.shuffle();

    questions = List.from(qAnswered)..addAll(qNAnswered);
    questions = questions!.sublist(0, exam!.numOfQuestion);

    var index = qAnswered.length - 1;
    index = index == questions!.length - 1 ? index : index + 1;
    question = questions![index];
    question!.options!.shuffle();
    getQuestionsInfo();
  }

  void questionsMove(Go go) {
    if (questions != null) {
      var currIndex = questions!.indexOf(question!);
      switch (go) {
        case Go.next:
          if (currIndex == questions!.length - 1) {
            ToastMee.info('Ini Pertanyaan Akhir');
            return;
          }
          question = questions![currIndex + 1];
          break;
        case Go.previous:
          if (currIndex == 0) {
            ToastMee.info('Ini Pertanyaan Awal');
            return;
          }
          question = questions![currIndex - 1];
          break;
        case Go.first:
          if (currIndex == 0) return;
          question = questions!.first;
          break;
        case Go.last:
          if (currIndex == questions!.length - 1) return;
          question = questions!.last;
          break;
      }
      question!.options!.shuffle();
      getQuestionsInfo();
    } else {
      log.i('listQuestions: Empty');
    }
  }

  Future getStatus({bool showLoading = false}) async {
    if (showLoading) LoadingMee.show();
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.examStatus,
      params: {
        'date_client': DateTime.now().asFormatDBDate(),
        'time_client': DateTime.now().asFormatDBTime(),
      },
    );
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await getStatus(showLoading: showLoading);
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }

    exam = result.data == null ? null : Exam.fromJson(result.data);
    // await F.session.exam(value: jsonEncode(exam!.toJson()));
    return Result.success(message: result.message);
  }

  Future setStart() async {
    LoadingMee.show();
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.examStart,
      params: {
        'date_client': DateTime.now().asFormatDBDate(),
        'time_client': DateTime.now().asFormatDBTime(),
      },
    );
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await setStart();
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }

    exam = result.data == null ? null : Exam.fromJson(result.data);
    genRndCount();
    await getQuestions();
    // if (exam != null) {
    //   minimumAnswers = exam!.minOfAnswer;
    // }
    // await F.session.exam(value: jsonEncode(exam!.toJson()));
    return Result.success(message: result.message);
  }

  Future setStop() async {
    LoadingMee.show();
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.examFinish,
      params: {
        'date_client': DateTime.now().asFormatDBDate(),
        'time_client': DateTime.now().asFormatDBTime(),
      },
    );
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await setStop();
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }

    exam = result.data == null ? null : Exam.fromJson(result.data);
    // exam!.examCompleted = true;
    // await F.session.exam(value: jsonEncode(exam!.toJson()));
    return Result.success(message: result.message);
  }

  Future setAnswer({
    required int questionID,
    required String answeredKey,
    required String optionKeyJoin,
  }) async {
    LoadingMee.show();

    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.examAnswer,
      params: {
        'date_client': DateTime.now().asFormatDBDate(),
        'time_client': DateTime.now().asFormatDBTime(),
        'question_id': '${questionID.toString()}$optionKeyJoin',
        'answered_key': answeredKey,
      },
    );

    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await setAnswer(
          questionID: questionID,
          answeredKey: answeredKey,
          optionKeyJoin: optionKeyJoin,
        );
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }

    exam = result.data == null ? null : Exam.fromJson(result.data);
    // await F.session.exam(value: jsonEncode(exam!.toJson()));
    // await getMinimumAnswered();
    return Result.success(message: result.message);
  }

  Future setRepeat() async {
    LoadingMee.show();
    Result result = await apiHelper.callAPIJsonRPC(
      method: apiMethod.examRepeat,
      params: {
        'date_client': DateTime.now().asFormatDBDate(),
        'time_client': DateTime.now().asFormatDBTime(),
      },
    );
    LoadingMee.dismiss();

    if (!result.status) {
      if (await F.isErrorNetwork(result, checkToken: true)) {
        return await setRepeat();
      }

      return Result.error(message: result.message, errCode: result.errCode);
    }

    exam = result.data == null ? null : Exam.fromJson(result.data);
    // if (exam != null) {
    //   restOfRepeat = exam!.numOfRepeat!;
    // }
    // await F.session.exam(value: jsonEncode(exam!.toJson()));
    // await getRestOfRepeat();
    return Result.success(message: result.message);
  }
}
