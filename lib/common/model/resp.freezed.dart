// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Resp _$RespFromJson(Map<String, dynamic> json) {
  return _Resp.fromJson(json);
}

/// @nodoc
mixin _$Resp {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  dynamic get result => throw _privateConstructorUsedError;
  Err? get error => throw _privateConstructorUsedError;

  /// Serializes this Resp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Resp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RespCopyWith<Resp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RespCopyWith<$Res> {
  factory $RespCopyWith(Resp value, $Res Function(Resp) then) =
      _$RespCopyWithImpl<$Res, Resp>;
  @useResult
  $Res call({bool? status, String? message, dynamic result, Err? error});

  $ErrCopyWith<$Res>? get error;
}

/// @nodoc
class _$RespCopyWithImpl<$Res, $Val extends Resp>
    implements $RespCopyWith<$Res> {
  _$RespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Resp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Err?,
    ) as $Val);
  }

  /// Create a copy of Resp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RespImplCopyWith<$Res> implements $RespCopyWith<$Res> {
  factory _$$RespImplCopyWith(
          _$RespImpl value, $Res Function(_$RespImpl) then) =
      __$$RespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, dynamic result, Err? error});

  @override
  $ErrCopyWith<$Res>? get error;
}

/// @nodoc
class __$$RespImplCopyWithImpl<$Res>
    extends _$RespCopyWithImpl<$Res, _$RespImpl>
    implements _$$RespImplCopyWith<$Res> {
  __$$RespImplCopyWithImpl(_$RespImpl _value, $Res Function(_$RespImpl) _then)
      : super(_value, _then);

  /// Create a copy of Resp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? result = freezed,
    Object? error = freezed,
  }) {
    return _then(_$RespImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Err?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RespImpl implements _Resp {
  _$RespImpl({this.status, this.message, this.result, this.error});

  factory _$RespImpl.fromJson(Map<String, dynamic> json) =>
      _$$RespImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final dynamic result;
  @override
  final Err? error;

  @override
  String toString() {
    return 'Resp(status: $status, message: $message, result: $result, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RespImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(result), error);

  /// Create a copy of Resp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RespImplCopyWith<_$RespImpl> get copyWith =>
      __$$RespImplCopyWithImpl<_$RespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RespImplToJson(
      this,
    );
  }
}

abstract class _Resp implements Resp {
  factory _Resp(
      {final bool? status,
      final String? message,
      final dynamic result,
      final Err? error}) = _$RespImpl;

  factory _Resp.fromJson(Map<String, dynamic> json) = _$RespImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  dynamic get result;
  @override
  Err? get error;

  /// Create a copy of Resp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RespImplCopyWith<_$RespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Err _$ErrFromJson(Map<String, dynamic> json) {
  return _Err.fromJson(json);
}

/// @nodoc
mixin _$Err {
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;

  /// Serializes this Err to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Err
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrCopyWith<Err> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrCopyWith<$Res> {
  factory $ErrCopyWith(Err value, $Res Function(Err) then) =
      _$ErrCopyWithImpl<$Res, Err>;
  @useResult
  $Res call({String? message, int? code});
}

/// @nodoc
class _$ErrCopyWithImpl<$Res, $Val extends Err> implements $ErrCopyWith<$Res> {
  _$ErrCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Err
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrImplCopyWith<$Res> implements $ErrCopyWith<$Res> {
  factory _$$ErrImplCopyWith(_$ErrImpl value, $Res Function(_$ErrImpl) then) =
      __$$ErrImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? code});
}

/// @nodoc
class __$$ErrImplCopyWithImpl<$Res> extends _$ErrCopyWithImpl<$Res, _$ErrImpl>
    implements _$$ErrImplCopyWith<$Res> {
  __$$ErrImplCopyWithImpl(_$ErrImpl _value, $Res Function(_$ErrImpl) _then)
      : super(_value, _then);

  /// Create a copy of Err
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$ErrImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrImpl implements _Err {
  _$ErrImpl({this.message, this.code});

  factory _$ErrImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrImplFromJson(json);

  @override
  final String? message;
  @override
  final int? code;

  @override
  String toString() {
    return 'Err(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Err
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrImplCopyWith<_$ErrImpl> get copyWith =>
      __$$ErrImplCopyWithImpl<_$ErrImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrImplToJson(
      this,
    );
  }
}

abstract class _Err implements Err {
  factory _Err({final String? message, final int? code}) = _$ErrImpl;

  factory _Err.fromJson(Map<String, dynamic> json) = _$ErrImpl.fromJson;

  @override
  String? get message;
  @override
  int? get code;

  /// Create a copy of Err
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrImplCopyWith<_$ErrImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
