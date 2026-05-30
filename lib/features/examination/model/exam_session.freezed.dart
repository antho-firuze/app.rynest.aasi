// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamSession _$ExamSessionFromJson(Map<String, dynamic> json) {
  return _ExamSession.fromJson(json);
}

/// @nodoc
mixin _$ExamSession {
  @JsonKey(name: 'restart')
  int? get restart => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_id')
  String? get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_name')
  String? get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'ip_address')
  String? get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'restart_at')
  @JsonDateTimeConverter()
  DateTime? get restartAt => throw _privateConstructorUsedError;

  /// Serializes this ExamSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamSessionCopyWith<ExamSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamSessionCopyWith<$Res> {
  factory $ExamSessionCopyWith(
          ExamSession value, $Res Function(ExamSession) then) =
      _$ExamSessionCopyWithImpl<$Res, ExamSession>;
  @useResult
  $Res call(
      {@JsonKey(name: 'restart') int? restart,
      @JsonKey(name: 'device_id') String? deviceId,
      @JsonKey(name: 'device_name') String? deviceName,
      @JsonKey(name: 'ip_address') String? ipAddress,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'restart_at')
      @JsonDateTimeConverter()
      DateTime? restartAt});
}

/// @nodoc
class _$ExamSessionCopyWithImpl<$Res, $Val extends ExamSession>
    implements $ExamSessionCopyWith<$Res> {
  _$ExamSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restart = freezed,
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? ipAddress = freezed,
    Object? location = freezed,
    Object? restartAt = freezed,
  }) {
    return _then(_value.copyWith(
      restart: freezed == restart
          ? _value.restart
          : restart // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      restartAt: freezed == restartAt
          ? _value.restartAt
          : restartAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamSessionImplCopyWith<$Res>
    implements $ExamSessionCopyWith<$Res> {
  factory _$$ExamSessionImplCopyWith(
          _$ExamSessionImpl value, $Res Function(_$ExamSessionImpl) then) =
      __$$ExamSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'restart') int? restart,
      @JsonKey(name: 'device_id') String? deviceId,
      @JsonKey(name: 'device_name') String? deviceName,
      @JsonKey(name: 'ip_address') String? ipAddress,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'restart_at')
      @JsonDateTimeConverter()
      DateTime? restartAt});
}

/// @nodoc
class __$$ExamSessionImplCopyWithImpl<$Res>
    extends _$ExamSessionCopyWithImpl<$Res, _$ExamSessionImpl>
    implements _$$ExamSessionImplCopyWith<$Res> {
  __$$ExamSessionImplCopyWithImpl(
      _$ExamSessionImpl _value, $Res Function(_$ExamSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restart = freezed,
    Object? deviceId = freezed,
    Object? deviceName = freezed,
    Object? ipAddress = freezed,
    Object? location = freezed,
    Object? restartAt = freezed,
  }) {
    return _then(_$ExamSessionImpl(
      restart: freezed == restart
          ? _value.restart
          : restart // ignore: cast_nullable_to_non_nullable
              as int?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceName: freezed == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      restartAt: freezed == restartAt
          ? _value.restartAt
          : restartAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamSessionImpl implements _ExamSession {
  _$ExamSessionImpl(
      {@JsonKey(name: 'restart') this.restart,
      @JsonKey(name: 'device_id') this.deviceId,
      @JsonKey(name: 'device_name') this.deviceName,
      @JsonKey(name: 'ip_address') this.ipAddress,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'restart_at') @JsonDateTimeConverter() this.restartAt});

  factory _$ExamSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamSessionImplFromJson(json);

  @override
  @JsonKey(name: 'restart')
  final int? restart;
  @override
  @JsonKey(name: 'device_id')
  final String? deviceId;
  @override
  @JsonKey(name: 'device_name')
  final String? deviceName;
  @override
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'restart_at')
  @JsonDateTimeConverter()
  final DateTime? restartAt;

  @override
  String toString() {
    return 'ExamSession(restart: $restart, deviceId: $deviceId, deviceName: $deviceName, ipAddress: $ipAddress, location: $location, restartAt: $restartAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamSessionImpl &&
            (identical(other.restart, restart) || other.restart == restart) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.restartAt, restartAt) ||
                other.restartAt == restartAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, restart, deviceId, deviceName,
      ipAddress, location, restartAt);

  /// Create a copy of ExamSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamSessionImplCopyWith<_$ExamSessionImpl> get copyWith =>
      __$$ExamSessionImplCopyWithImpl<_$ExamSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamSessionImplToJson(
      this,
    );
  }
}

abstract class _ExamSession implements ExamSession {
  factory _ExamSession(
      {@JsonKey(name: 'restart') final int? restart,
      @JsonKey(name: 'device_id') final String? deviceId,
      @JsonKey(name: 'device_name') final String? deviceName,
      @JsonKey(name: 'ip_address') final String? ipAddress,
      @JsonKey(name: 'location') final String? location,
      @JsonKey(name: 'restart_at')
      @JsonDateTimeConverter()
      final DateTime? restartAt}) = _$ExamSessionImpl;

  factory _ExamSession.fromJson(Map<String, dynamic> json) =
      _$ExamSessionImpl.fromJson;

  @override
  @JsonKey(name: 'restart')
  int? get restart;
  @override
  @JsonKey(name: 'device_id')
  String? get deviceId;
  @override
  @JsonKey(name: 'device_name')
  String? get deviceName;
  @override
  @JsonKey(name: 'ip_address')
  String? get ipAddress;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'restart_at')
  @JsonDateTimeConverter()
  DateTime? get restartAt;

  /// Create a copy of ExamSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamSessionImplCopyWith<_$ExamSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
