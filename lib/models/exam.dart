import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../helpers/F.dart';

class Exam {
  Exam({
    this.examStart,
    this.examEnd,
    this.duration,
    this.examCompleted,
    this.numOfQuestion,
    this.numOfCorrect,
    this.numAnsweredQuestion,
    this.numRemainQuestion,
    this.numOfRepeat,
    this.minOfAnswer,
    this.score,
  });

  DateTime? examStart;
  DateTime? examEnd;
  int? duration;
  bool? examCompleted;
  int? numOfQuestion;
  int? numOfCorrect;
  int? numAnsweredQuestion;
  int? numRemainQuestion;
  int? numOfRepeat;
  int? minOfAnswer;
  double? score;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        examStart: F.toDateTime(json['exam_start']),
        examEnd: F.toDateTime(json['exam_end']),
        duration: F.toInt(json['duration']),
        examCompleted: json['exam_completed'],
        numOfQuestion: F.toInt(json['num_of_question']),
        numOfCorrect: F.toInt(json['num_of_correct']),
        numAnsweredQuestion: F.toInt(json['num_answered_question']),
        numRemainQuestion: F.toInt(json['num_remain_question']),
        numOfRepeat: F.toInt(json['num_of_repeat']),
        minOfAnswer: F.toInt(json['min_of_answer']),
        score: F.toDouble(json['score']),
      );

  Map<String, dynamic> toJson() => {
        "exam_start": examStart?.asFormatDBDateTime(),
        "exam_end": examEnd?.asFormatDBDateTime(),
        "duration": duration,
        "exam_completed": examCompleted,
        "num_of_question": numOfQuestion,
        "num_of_correct": numOfCorrect,
        "num_answered_question": numAnsweredQuestion,
        "num_remain_question": numRemainQuestion,
        "num_of_repeat": numOfRepeat,
        "min_of_answer": minOfAnswer,
        "score": score,
      };
}
