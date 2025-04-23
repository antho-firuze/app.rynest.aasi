// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JwtToken _$JwtTokenFromJson(Map<String, dynamic> json) {
  return _JwtToken.fromJson(json);
}

/// @nodoc
mixin _$JwtToken {
// @JsonKey(name: 'token_type') @Default('Bearer') String type,
// @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String? get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this JwtToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JwtTokenCopyWith<JwtToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtTokenCopyWith<$Res> {
  factory $JwtTokenCopyWith(JwtToken value, $Res Function(JwtToken) then) =
      _$JwtTokenCopyWithImpl<$Res, JwtToken>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class _$JwtTokenCopyWithImpl<$Res, $Val extends JwtToken>
    implements $JwtTokenCopyWith<$Res> {
  _$JwtTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JwtTokenImplCopyWith<$Res>
    implements $JwtTokenCopyWith<$Res> {
  factory _$$JwtTokenImplCopyWith(
          _$JwtTokenImpl value, $Res Function(_$JwtTokenImpl) then) =
      __$$JwtTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String? accessToken,
      @JsonKey(name: 'refresh_token') String? refreshToken});
}

/// @nodoc
class __$$JwtTokenImplCopyWithImpl<$Res>
    extends _$JwtTokenCopyWithImpl<$Res, _$JwtTokenImpl>
    implements _$$JwtTokenImplCopyWith<$Res> {
  __$$JwtTokenImplCopyWithImpl(
      _$JwtTokenImpl _value, $Res Function(_$JwtTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$JwtTokenImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JwtTokenImpl implements _JwtToken {
  _$JwtTokenImpl(
      {@JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'refresh_token') this.refreshToken});

  factory _$JwtTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtTokenImplFromJson(json);

// @JsonKey(name: 'token_type') @Default('Bearer') String type,
// @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @override
  String toString() {
    return 'JwtToken(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JwtTokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtTokenImplCopyWith<_$JwtTokenImpl> get copyWith =>
      __$$JwtTokenImplCopyWithImpl<_$JwtTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtTokenImplToJson(
      this,
    );
  }
}

abstract class _JwtToken implements JwtToken {
  factory _JwtToken(
          {@JsonKey(name: 'access_token') final String? accessToken,
          @JsonKey(name: 'refresh_token') final String? refreshToken}) =
      _$JwtTokenImpl;

  factory _JwtToken.fromJson(Map<String, dynamic> json) =
      _$JwtTokenImpl.fromJson;

// @JsonKey(name: 'token_type') @Default('Bearer') String type,
// @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String? get refreshToken;

  /// Create a copy of JwtToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JwtTokenImplCopyWith<_$JwtTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
