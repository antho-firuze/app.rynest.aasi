// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reqs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReqsImpl _$$ReqsImplFromJson(Map<String, dynamic> json) => _$ReqsImpl(
      method: json['method'] as String,
      params: json['params'] as Map<String, dynamic>?,
      filePath: json['filePath'] as String?,
    );

Map<String, dynamic> _$$ReqsImplToJson(_$ReqsImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'params': instance.params,
      'filePath': instance.filePath,
    };
