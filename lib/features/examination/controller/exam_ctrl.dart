import 'dart:convert';
import 'dart:developer';

import 'package:app.rynest.aasi/common/services/sharedpref_service.dart';
import 'package:app.rynest.aasi/models/exam.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fontSizeProvider = StateProvider<int>((ref) => 16);
final autoNextQuestionProvider = StateProvider<bool>((ref) => false);
final examProvider = StateProvider<Exam?>((ref) => null);

class ExamCtrl {
  final Ref ref;
  ExamCtrl(this.ref);

  final String _fontSizeKey = 'COOKIE_FONT_SIZE';
  final String _autoNextQuestionKey = 'COOKIE_AUTO_NEXT_QUESTION';
  final String _examKey = 'COOKIE_EXAM';

  List<Map<String, dynamic>> _fontSizes = [
    {'text': 'Kecil', 'value': 14},
    {'text': 'Sedang', 'value': 16},
    {'text': 'Besar', 'value': 18},
    {'text': 'Super Besar', 'value': 20},
    {'text': 'Besar Sekali', 'value': 24},
  ];

  void initialize() {
    log('Initialize Examination !');

    loadExamSetting();
    loadExam();
  }

  void loadExamSetting() {
    ref.read(fontSizeProvider.notifier).state = ref.read(sharedPrefProvider).getInt(_fontSizeKey) ?? 16;
    ref.read(autoNextQuestionProvider.notifier).state =
        ref.read(sharedPrefProvider).getBool(_autoNextQuestionKey) ?? false;
  }

  void loadExam() {
    final data = ref.read(sharedPrefProvider).getString(_examKey);
    if (data != null) {
      final exam = Exam.fromJson(jsonDecode(data));
      ref.read(examProvider.notifier).state = exam;
    } else {
      ref.read(examProvider.notifier).state = null;
    }
  }
}

final examCtrlProvider = Provider(ExamCtrl.new);
