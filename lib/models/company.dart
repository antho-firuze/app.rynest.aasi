import '../helpers/F.dart';

class Company {
  Company({
    this.id,
    this.name,
    this.code,
    this.type,
  });

  int? id;
  String? name;
  String? code;
  int? type;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: F.toInt(json['id']),
        name: json['name'],
        code: json['kode_company'],
        type: F.toInt(json['type']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kode_company": code,
        "type": type,
      };
}
