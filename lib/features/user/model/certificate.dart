// ignore_for_file: invalid_annotation_target

import 'package:app.rynest.aasi/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate.freezed.dart';
part 'certificate.g.dart';

@freezed
class Certificate with _$Certificate {
  factory Certificate({
    @JsonIntConverter() int? id,
    @JsonKey(name: 'no_sertifikat') String? certNo,
    @JsonKey(name: 'realese_date') @JsonDateTimeConverter() DateTime? releaseDate,
    @JsonKey(name: 'expired_date') @JsonDateTimeConverter() DateTime? expiredDate,
    @JsonKey(name: 'extension_date') @JsonDateTimeConverter() DateTime? extensionDate,
  }) = _Certificate;

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);
}

extension CertificateExt on Certificate {
  String get certType => certNo == null ? '' : certNo!.substring(6, 8);
}
