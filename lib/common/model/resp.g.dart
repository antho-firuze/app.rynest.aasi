// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RespImpl _$$RespImplFromJson(Map<String, dynamic> json) => _$RespImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      result: json['result'] as Map<String, dynamic>?,
      error: json['error'] == null
          ? null
          : Err.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RespImplToJson(_$RespImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
      'error': instance.error,
    };

_$ErrImpl _$$ErrImplFromJson(Map<String, dynamic> json) => _$ErrImpl(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ErrImplToJson(_$ErrImpl instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
