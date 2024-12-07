// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CertificateImpl _$$CertificateImplFromJson(Map<String, dynamic> json) =>
    _$CertificateImpl(
      id: const JsonIntConverter().fromJson(json['id']),
      certNo: json['no_sertifikat'] as String?,
      releaseDate: const JsonDateTimeConverter().fromJson(json['realese_date']),
      expiredDate: const JsonDateTimeConverter().fromJson(json['expired_date']),
      extensionDate:
          const JsonDateTimeConverter().fromJson(json['extension_date']),
    );

Map<String, dynamic> _$$CertificateImplToJson(_$CertificateImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, int>(
          instance.id, const JsonIntConverter().toJson),
      'no_sertifikat': instance.certNo,
      'realese_date':
          const JsonDateTimeConverter().toJson(instance.releaseDate),
      'expired_date':
          const JsonDateTimeConverter().toJson(instance.expiredDate),
      'extension_date':
          const JsonDateTimeConverter().toJson(instance.extensionDate),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
