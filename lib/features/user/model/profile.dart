// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    @JsonKey(name: 'id_user') @StringToIntConverter() int? idUser,
    @JsonKey(name: 'id_member') @StringToIntConverter() int? idMember,
    @JsonKey(name: 'member_id') String? memberId,
    @JsonKey(name: 'identity_card') String? cardNo,
    @JsonKey(name: 'fullname') @Default('') String fullName,
    @JsonKey(name: 'place_of_birth') String? placeOfBirth,
    @JsonKey(name: 'date_of_birth') @StringToDateConverter() String? dateOfBirth,
    @JsonKey(name: 'gender') @StringToGenderConverter() String? gender,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String photo,
    @JsonKey(name: 'photo_idcard') String? photoIdCard,
    @StringToIntConverter() int? status,
    Company? company,
    Certificate? certificate,
    Schedule? schedule,
    Photos? photos,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class Company with _$Company {
  factory Company({
    @StringToIntConverter() int? id,
    String? name,
    @JsonKey(name: 'kode_company') String? code,
    @StringToIntConverter() int? type,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}

@freezed
class Certificate with _$Certificate {
  factory Certificate({
    @StringToIntConverter() int? id,
    @JsonKey(name: 'no_sertifikat') String? certNo,
    @JsonKey(name: 'realese_date') @StringToDateConverter() DateTime? releaseDate,
    @JsonKey(name: 'expired_date') @StringToDateConverter() DateTime? expiredDate,
    @JsonKey(name: 'extension_date') @StringToDateConverter() DateTime? extensionDate,
  }) = _Certificate;

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);
}

extension CertificateExt on Certificate {
  String get certType => certNo == null ? '' : certNo!.substring(6, 8);
}

@freezed
class Schedule with _$Schedule {
  factory Schedule({
    @JsonKey(name: 'schedule_request_id') @StringToIntConverter() int? scheduleRequestId,
    @JsonKey(name: 'schedule_id') @StringToIntConverter() int? scheduleId,
    @JsonKey(name: 'location_id') @StringToIntConverter() int? locationId,
    @JsonKey(name: 'category_id') @StringToIntConverter() int? categoryId,
    String? name,
    @StringToIntConverter() int? duration,
    String? notes,
    @JsonKey(name: 'open_registration') @StringToDateConverter() DateTime? openRegistration,
    @JsonKey(name: 'close_registration') @StringToDateConverter() DateTime? closeRegistration,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
}

@freezed
class Photos with _$Photos {
  factory Photos({
    @Default('') String selfie,
    @Default('') String idCard,
    @JsonKey(name: 'exam_finish') @Default('') String examFinish,
    @JsonKey(name: 'exam_start') @Default('') String examStart,
  }) = _Photos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
}
