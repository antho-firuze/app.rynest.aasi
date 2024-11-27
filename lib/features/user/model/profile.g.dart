// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      idUser: const StringToIntConverter().fromJson(json['id_user'] as String?),
      idMember:
          const StringToIntConverter().fromJson(json['id_member'] as String?),
      memberId: json['member_id'] as String?,
      cardNo: json['identity_card'] as String?,
      fullName: json['fullname'] as String? ?? '',
      placeOfBirth: json['place_of_birth'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender:
          const StringToGenderConverter().fromJson(json['gender'] as String?),
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      photoIdCard: json['photo_idcard'] as String?,
      status: const StringToIntConverter().fromJson(json['status'] as String?),
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      certificate: json['certificate'] == null
          ? null
          : Certificate.fromJson(json['certificate'] as Map<String, dynamic>),
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
      photos: json['photos'] == null
          ? null
          : Photos.fromJson(json['photos'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id_user': _$JsonConverterToJson<String?, int>(
          instance.idUser, const StringToIntConverter().toJson),
      'id_member': _$JsonConverterToJson<String?, int>(
          instance.idMember, const StringToIntConverter().toJson),
      'member_id': instance.memberId,
      'identity_card': instance.cardNo,
      'fullname': instance.fullName,
      'place_of_birth': instance.placeOfBirth,
      'date_of_birth': instance.dateOfBirth,
      'gender': _$JsonConverterToJson<String?, String>(
          instance.gender, const StringToGenderConverter().toJson),
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.photo,
      'photo_idcard': instance.photoIdCard,
      'status': _$JsonConverterToJson<String?, int>(
          instance.status, const StringToIntConverter().toJson),
      'company': instance.company,
      'certificate': instance.certificate,
      'schedule': instance.schedule,
      'photos': instance.photos,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      id: const StringToIntConverter().fromJson(json['id'] as String?),
      name: json['name'] as String?,
      code: json['kode_company'] as String?,
      type: const StringToIntConverter().fromJson(json['type'] as String?),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<String?, int>(
          instance.id, const StringToIntConverter().toJson),
      'name': instance.name,
      'kode_company': instance.code,
      'type': _$JsonConverterToJson<String?, int>(
          instance.type, const StringToIntConverter().toJson),
    };

_$CertificateImpl _$$CertificateImplFromJson(Map<String, dynamic> json) =>
    _$CertificateImpl(
      id: const StringToIntConverter().fromJson(json['id'] as String?),
      certNo: json['no_sertifikat'] as String?,
      releaseDate: const StringToDateConverter()
          .fromJson(json['realese_date'] as String?),
      expiredDate: const StringToDateConverter()
          .fromJson(json['expired_date'] as String?),
      extensionDate: const StringToDateConverter()
          .fromJson(json['extension_date'] as String?),
    );

Map<String, dynamic> _$$CertificateImplToJson(_$CertificateImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<String?, int>(
          instance.id, const StringToIntConverter().toJson),
      'no_sertifikat': instance.certNo,
      'realese_date':
          const StringToDateConverter().toJson(instance.releaseDate),
      'expired_date':
          const StringToDateConverter().toJson(instance.expiredDate),
      'extension_date':
          const StringToDateConverter().toJson(instance.extensionDate),
    };

_$ScheduleImpl _$$ScheduleImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleImpl(
      scheduleRequestId: const StringToIntConverter()
          .fromJson(json['schedule_request_id'] as String?),
      scheduleId:
          const StringToIntConverter().fromJson(json['schedule_id'] as String?),
      locationId:
          const StringToIntConverter().fromJson(json['location_id'] as String?),
      categoryId:
          const StringToIntConverter().fromJson(json['category_id'] as String?),
      name: json['name'] as String?,
      duration:
          const StringToIntConverter().fromJson(json['duration'] as String?),
      notes: json['notes'] as String?,
      openRegistration: const StringToDateConverter()
          .fromJson(json['open_registration'] as String?),
      closeRegistration: const StringToDateConverter()
          .fromJson(json['close_registration'] as String?),
    );

Map<String, dynamic> _$$ScheduleImplToJson(_$ScheduleImpl instance) =>
    <String, dynamic>{
      'schedule_request_id': _$JsonConverterToJson<String?, int>(
          instance.scheduleRequestId, const StringToIntConverter().toJson),
      'schedule_id': _$JsonConverterToJson<String?, int>(
          instance.scheduleId, const StringToIntConverter().toJson),
      'location_id': _$JsonConverterToJson<String?, int>(
          instance.locationId, const StringToIntConverter().toJson),
      'category_id': _$JsonConverterToJson<String?, int>(
          instance.categoryId, const StringToIntConverter().toJson),
      'name': instance.name,
      'duration': _$JsonConverterToJson<String?, int>(
          instance.duration, const StringToIntConverter().toJson),
      'notes': instance.notes,
      'open_registration':
          const StringToDateConverter().toJson(instance.openRegistration),
      'close_registration':
          const StringToDateConverter().toJson(instance.closeRegistration),
    };

_$PhotosImpl _$$PhotosImplFromJson(Map<String, dynamic> json) => _$PhotosImpl(
      selfie: json['selfie'] as String? ?? '',
      idCard: json['idCard'] as String? ?? '',
      examFinish: json['exam_finish'] as String? ?? '',
      examStart: json['exam_start'] as String? ?? '',
    );

Map<String, dynamic> _$$PhotosImplToJson(_$PhotosImpl instance) =>
    <String, dynamic>{
      'selfie': instance.selfie,
      'idCard': instance.idCard,
      'exam_finish': instance.examFinish,
      'exam_start': instance.examStart,
    };
