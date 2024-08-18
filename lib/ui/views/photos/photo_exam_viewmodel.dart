import 'dart:math';

import 'package:app.rynest.aasi/app/app.locator.dart';
import 'package:app.rynest.aasi/services/exam_service.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/F.dart';
import '../../../models/photos.dart';

class PhotoExamViewModel extends FutureViewModel {
  final examService = locator<ExamService>();

  Photos? get photos => examService.photos;

  String? photoExamStart;
  String? photoExamFinish;

  @override
  Future futureToRun() async {
    await loadData();
  }

  Future refresh() async {
    await loadData(init: false);
  }

  Future loadData({bool init = true}) async {
    await Future.delayed(Duration.zero);

    await examService.getPhotos(isRefresh: true, showLoading: true);

    var dummyId = Random().nextInt(99999);
    if (await F.isURLValid(examService.photos?.examStart) == true) {
      photoExamStart = '${photos?.examStart}?v=$dummyId';
    }
    if (await F.isURLValid(examService.photos?.examFinish) == true) {
      photoExamFinish = '${photos?.examFinish}?v=$dummyId';
    }

    notifyListeners();
  }
}
