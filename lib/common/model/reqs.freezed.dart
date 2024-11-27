// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reqs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reqs _$ReqsFromJson(Map<String, dynamic> json) {
  return _Reqs.fromJson(json);
}

/// @nodoc
mixin _$Reqs {
  String get method => throw _privateConstructorUsedError;
  Map<String, dynamic>? get params => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;

  /// Serializes this Reqs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReqsCopyWith<Reqs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqsCopyWith<$Res> {
  factory $ReqsCopyWith(Reqs value, $Res Function(Reqs) then) =
      _$ReqsCopyWithImpl<$Res, Reqs>;
  @useResult
  $Res call({String method, Map<String, dynamic>? params, String? filePath});
}

/// @nodoc
class _$ReqsCopyWithImpl<$Res, $Val extends Reqs>
    implements $ReqsCopyWith<$Res> {
  _$ReqsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? params = freezed,
    Object? filePath = freezed,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqsImplCopyWith<$Res> implements $ReqsCopyWith<$Res> {
  factory _$$ReqsImplCopyWith(
          _$ReqsImpl value, $Res Function(_$ReqsImpl) then) =
      __$$ReqsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String method, Map<String, dynamic>? params, String? filePath});
}

/// @nodoc
class __$$ReqsImplCopyWithImpl<$Res>
    extends _$ReqsCopyWithImpl<$Res, _$ReqsImpl>
    implements _$$ReqsImplCopyWith<$Res> {
  __$$ReqsImplCopyWithImpl(_$ReqsImpl _value, $Res Function(_$ReqsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? params = freezed,
    Object? filePath = freezed,
  }) {
    return _then(_$ReqsImpl(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      params: freezed == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReqsImpl implements _Reqs {
  _$ReqsImpl(
      {required this.method, final Map<String, dynamic>? params, this.filePath})
      : _params = params;

  factory _$ReqsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqsImplFromJson(json);

  @override
  final String method;
  final Map<String, dynamic>? _params;
  @override
  Map<String, dynamic>? get params {
    final value = _params;
    if (value == null) return null;
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? filePath;

  @override
  String toString() {
    return 'Reqs(method: $method, params: $params, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqsImpl &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other._params, _params) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, method,
      const DeepCollectionEquality().hash(_params), filePath);

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqsImplCopyWith<_$ReqsImpl> get copyWith =>
      __$$ReqsImplCopyWithImpl<_$ReqsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqsImplToJson(
      this,
    );
  }
}

abstract class _Reqs implements Reqs {
  factory _Reqs(
      {required final String method,
      final Map<String, dynamic>? params,
      final String? filePath}) = _$ReqsImpl;

  factory _Reqs.fromJson(Map<String, dynamic> json) = _$ReqsImpl.fromJson;

  @override
  String get method;
  @override
  Map<String, dynamic>? get params;
  @override
  String? get filePath;

  /// Create a copy of Reqs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReqsImplCopyWith<_$ReqsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
