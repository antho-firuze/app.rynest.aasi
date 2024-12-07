// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    @JsonKey(name: 'id_user') @JsonIntConverter() int? idUser,
    @JsonKey(name: 'id_member') @JsonIntConverter() int? idMember,
    @JsonKey(name: 'member_id') String? memberId,
    @JsonKey(name: 'identity_card') String? cardNo,
    @JsonKey(name: 'fullname') String? fullName,
    @JsonKey(name: 'place_of_birth') String? placeOfBirth,
    @JsonKey(name: 'date_of_birth') @JsonDateTimeConverter() String? dateOfBirth,
    @JsonKey(name: 'gender') @JsonGenderConverter() String? gender,
    String? email,
    String? phone,
    String? photo,
    @JsonKey(name: 'photo_idcard') String? photoIdCard,
    @JsonIntConverter() int? status,
    Company? company,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

@freezed
class Company with _$Company {
  factory Company({
    @JsonIntConverter() int? id,
    String? name,
    @JsonKey(name: 'kode_company') String? code,
    @JsonIntConverter() int? type,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}
