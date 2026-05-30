// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: const JsonIntConverter().fromJson(json['id']),
      roleId: const JsonIntConverter().fromJson(json['role_id']),
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, int>(
          instance.id, const JsonIntConverter().toJson),
      'role_id': _$JsonConverterToJson<dynamic, int>(
          instance.roleId, const JsonIntConverter().toJson),
      'username': instance.username,
      'email': instance.email,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
