import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../helpers/F.dart';
import 'company.dart';

// Map<String, dynamic> listGender = {"1": "Pria", "2": "Wanita"};
// Map<String, dynamic> listGender = {"M": "Pria", "F": "Wanita"};
// List<String> listGender = ['Belum Tahu', 'Pria', 'Wanita'];

class Profile {
  Profile({
    this.idUser,
    this.idMember,
    this.memberId,
    this.cardNo,
    this.fullName,
    this.placeOfBirth,
    this.dateOfBirth,
    this.gender,
    this.phone,
    this.email,
    this.isActivated,
    this.photo,
    this.photoIdCard,
    this.company,
    // this.schedule,
    // this.photos,
    // this.certificate,
    this.status,
  });

  int? idUser;
  int? idMember;
  String? memberId;
  String? cardNo;
  String? fullName;
  String? placeOfBirth;
  DateTime? dateOfBirth;
  String? gender;
  String? phone;
  String? email;
  bool? isActivated;
  String? photo;
  String? photoIdCard;
  Company? company;
  // Schedule? schedule;
  // Photos? photos;
  // Certificate? certificate;
  int? status;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        idUser: F.toInt(json['id_user']),
        idMember: F.toInt(json['id_member']),
        memberId: json['member_id'],
        cardNo: json['identity_card'],
        fullName: json['fullname'],
        placeOfBirth: json['place_of_birth'],
        dateOfBirth: F.toDateTime(json['date_of_birth']),
        gender: F.toGender(json['gender']),
        phone: json['phone'],
        email: json['email'],
        photo: json['photo'],
        photoIdCard: json['photo_idcard'],
        company: json['company'] == null
            ? Company()
            : Company.fromJson(json['company']),
        // schedule: json['schedule'] == null
        //     ? Schedule()
        //     : Schedule.fromJson(json['schedule']),
        // photos:
        //     json['photos'] == null ? Photos() : Photos.fromJson(json['photos']),
        // certificate: json['certificate'] == null
        //     ? Certificate()
        //     : Certificate.fromJson(json['certificate']),
        status: F.toInt(json['status']), // 2 => CANCEL EXAM, ELSE CAN EXAM
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "id_member": idMember,
        "member_id": memberId,
        "identity_card": cardNo,
        "fullname": fullName,
        "place_of_birth": placeOfBirth,
        "date_of_birth": dateOfBirth!.asFormatDBDate(),
        "gender": F.fromGender(gender),
        "phone": phone,
        "email": email,
        "photo": photo,
        "photo_idcard": photoIdCard,
        "company": company?.toJson(),
        // "schedule": schedule == null ? null : schedule!.toJson(),
        // "photos": photos == null ? null : photos!.toJson(),
        // "certificate": certificate == null ? null : certificate!.toJson(),
        "status": status,
      };
}
