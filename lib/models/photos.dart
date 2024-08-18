class Photos {
  Photos({
    this.selfie,
    this.idCard,
    this.examFinish,
    this.examStart,
  });

  String? selfie;
  String? idCard;
  String? examFinish;
  String? examStart;

  factory Photos.fromJson(Map<String, dynamic>? json) => json == null
      ? Photos(examStart: '', examFinish: '')
      : Photos(
          selfie: json['selfie'],
          idCard: json['idcard'],
          examFinish: json['exam_finish'],
          examStart: json['exam_start'],
        );

  Map<String, dynamic> toJson() => {
        "selfie": selfie,
        "idcard": idCard,
        "exam_finish": examFinish,
        "exam_start": examStart,
      };
}
