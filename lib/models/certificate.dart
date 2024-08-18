import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../helpers/F.dart';

class Certificate {
  Certificate({
    this.id,
    this.certNo,
    this.releaseDate,
    this.expiredDate,
    this.extensionDate,
  });

  int? id;
  String? certNo;
  DateTime? releaseDate;
  DateTime? expiredDate;
  DateTime? extensionDate;

  factory Certificate.fromJson(Map<String, dynamic> json) => Certificate(
        id: F.toInt(json['id_no_sertfikat']),
        certNo: json['no_sertifikat'],
        releaseDate: F.toDateTime(json['realese_date']),
        expiredDate: F.toDateTime(json['expired_date']),
        extensionDate: F.toDateTime(json['extension_date']),
      );

  Map<String, dynamic> toJson() => {
        "id_no_sertfikat": id,
        "no_sertifikat": certNo,
        "realese_date": releaseDate?.asFormatDBDateTime(),
        "expired_date": expiredDate?.asFormatDBDateTime(),
        "extension_date": extensionDate?.asFormatDBDateTime(),
      };
}
