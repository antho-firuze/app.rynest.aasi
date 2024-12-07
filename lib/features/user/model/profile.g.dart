// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      idUser: const JsonIntConverter().fromJson(json['id_user']),
      idMember: const JsonIntConverter().fromJson(json['id_member']),
      memberId: json['member_id'] as String?,
      cardNo: json['identity_card'] as String?,
      fullName: json['fullname'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: const JsonGenderConverter().fromJson(json['gender'] as String?),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      photoIdCard: json['photo_idcard'] as String?,
      status: const JsonIntConverter().fromJson(json['status']),
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id_user': _$JsonConverterToJson<dynamic, int>(
          instance.idUser, const JsonIntConverter().toJson),
      'id_member': _$JsonConverterToJson<dynamic, int>(
          instance.idMember, const JsonIntConverter().toJson),
      'member_id': instance.memberId,
      'identity_card': instance.cardNo,
      'fullname': instance.fullName,
      'place_of_birth': instance.placeOfBirth,
      'date_of_birth': instance.dateOfBirth,
      'gender': _$JsonConverterToJson<String?, String>(
          instance.gender, const JsonGenderConverter().toJson),
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'photo_idcard': instance.photoIdCard,
      'status': _$JsonConverterToJson<dynamic, int>(
          instance.status, const JsonIntConverter().toJson),
      'company': instance.company,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      id: const JsonIntConverter().fromJson(json['id']),
      name: json['name'] as String?,
      code: json['kode_company'] as String?,
      type: const JsonIntConverter().fromJson(json['type']),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, int>(
          instance.id, const JsonIntConverter().toJson),
      'name': instance.name,
      'kode_company': instance.code,
      'type': _$JsonConverterToJson<dynamic, int>(
          instance.type, const JsonIntConverter().toJson),
    };
