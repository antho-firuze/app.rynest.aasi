import 'package:json_annotation/json_annotation.dart';

class StringToIntConverter implements JsonConverter<int, String?> {
  const StringToIntConverter();

  @override
  int fromJson(String? json) => json == null ? 0 : (int.tryParse(json) ?? 0);

  @override
  String? toJson(int? object) => object?.toString();
}

class IntToBoolConverter implements JsonConverter<bool, int> {
  const IntToBoolConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object ? 1 : 0;
}

class StringToDateConverter implements JsonConverter<DateTime?, String?> {
  const StringToDateConverter();

  @override
  DateTime? fromJson(String? json) => json == null
      ? null
      : json.isEmpty
          ? null
          : DateTime.parse(json);

  @override
  String? toJson(DateTime? object) => object?.toString();
}

class StringToGenderConverter implements JsonConverter<String, String?> {
  const StringToGenderConverter();

  @override
  String fromJson(String? json) => json == null
      ? ""
      : json.isEmpty
          ? ""
          : [1, '1', 'P', 'M'].contains(json)
              ? "M"
              : [2, '2', 'W', 'F'].contains(json)
                  ? "F"
                  : "-";

  @override
  String? toJson(String? object) => object?.toString();
}
