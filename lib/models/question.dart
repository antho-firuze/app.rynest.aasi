class Question {
  Question({
    this.id,
    this.question,
    this.answerOptionA,
    this.answerOptionB,
    this.answerOptionC,
    this.answerOptionD,
    this.answerOptionE,
    this.answerKey,
    this.answeredKey,
    this.options,
  });

  int? id;
  String? question;
  String? answerOptionA;
  String? answerOptionB;
  String? answerOptionC;
  String? answerOptionD;
  String? answerOptionE;
  String? answerKey;
  String? answeredKey;
  List<QuestionOption>? options;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'] is String ? int.parse(json['id']) : json['id'],
        question: json['question'],
        answerOptionA: json['answer_option_a'] ?? '',
        answerOptionB: json['answer_option_b'] ?? '',
        answerOptionC: json['answer_option_c'] ?? '',
        answerOptionD: json['answer_option_d'] ?? '',
        answeredKey: json['answered_key'] ?? '',
        options: [
          QuestionOption(
            questionId:
                json['id'] is String ? int.parse(json['id']) : json['id'],
            optionKey: 'A',
            textOption: json['answer_option_a'] ?? '',
            answeredKey: json['answered_key'] ?? '',
          ),
          QuestionOption(
            questionId:
                json['id'] is String ? int.parse(json['id']) : json['id'],
            optionKey: 'B',
            textOption: json['answer_option_b'] ?? '',
            answeredKey: json['answered_key'] ?? '',
          ),
          QuestionOption(
            questionId:
                json['id'] is String ? int.parse(json['id']) : json['id'],
            optionKey: 'C',
            textOption: json['answer_option_c'] ?? '',
            answeredKey: json['answered_key'] ?? '',
          ),
          QuestionOption(
            questionId:
                json['id'] is String ? int.parse(json['id']) : json['id'],
            optionKey: 'D',
            textOption: json['answer_option_d'] ?? '',
            answeredKey: json['answered_key'] ?? '',
          ),
        ],
      );

  static List<Question>? fromJsonList(List? jsonList) {
    if (jsonList == null) return null;
    return jsonList.map((item) => Question.fromJson(item)).toList();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer_option_a": answerOptionA,
        "answer_option_b": answerOptionB,
        "answer_option_c": answerOptionC,
        "answer_option_d": answerOptionD,
        "answered_key": answeredKey,
      };
}

class QuestionOption {
  QuestionOption({
    this.questionId,
    this.optionKey,
    this.answerKey,
    this.answeredKey,
    this.textOption,
  });

  int? questionId;
  String? optionKey;
  String? answerKey;
  String? answeredKey;
  String? textOption;
}
