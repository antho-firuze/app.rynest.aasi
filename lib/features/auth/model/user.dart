// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {

  factory User({
  int? id,
  String? name,
  String? username,
  String? email,
  @JsonKey(name: 'fullname') String? fullName,
  @JsonKey(name: 'userrole') String? userRole,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}