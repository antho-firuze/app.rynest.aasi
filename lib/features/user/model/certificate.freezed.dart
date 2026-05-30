// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return _Certificate.fromJson(json);
}

/// @nodoc
mixin _$Certificate {
  @JsonIntConverter()
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_sertifikat')
  String? get certNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'realese_date')
  @JsonDateTimeConverter()
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date')
  @JsonDateTimeConverter()
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'extension_date')
  @JsonDateTimeConverter()
  DateTime? get extensionDate => throw _privateConstructorUsedError;

  /// Serializes this Certificate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CertificateCopyWith<Certificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateCopyWith<$Res> {
  factory $CertificateCopyWith(
          Certificate value, $Res Function(Certificate) then) =
      _$CertificateCopyWithImpl<$Res, Certificate>;
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      @JsonKey(name: 'no_sertifikat') String? certNo,
      @JsonKey(name: 'realese_date')
      @JsonDateTimeConverter()
      DateTime? releaseDate,
      @JsonKey(name: 'expired_date')
      @JsonDateTimeConverter()
      DateTime? expiredDate,
      @JsonKey(name: 'extension_date')
      @JsonDateTimeConverter()
      DateTime? extensionDate});
}

/// @nodoc
class _$CertificateCopyWithImpl<$Res, $Val extends Certificate>
    implements $CertificateCopyWith<$Res> {
  _$CertificateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? certNo = freezed,
    Object? releaseDate = freezed,
    Object? expiredDate = freezed,
    Object? extensionDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      certNo: freezed == certNo
          ? _value.certNo
          : certNo // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      extensionDate: freezed == extensionDate
          ? _value.extensionDate
          : extensionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CertificateImplCopyWith<$Res>
    implements $CertificateCopyWith<$Res> {
  factory _$$CertificateImplCopyWith(
          _$CertificateImpl value, $Res Function(_$CertificateImpl) then) =
      __$$CertificateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      @JsonKey(name: 'no_sertifikat') String? certNo,
      @JsonKey(name: 'realese_date')
      @JsonDateTimeConverter()
      DateTime? releaseDate,
      @JsonKey(name: 'expired_date')
      @JsonDateTimeConverter()
      DateTime? expiredDate,
      @JsonKey(name: 'extension_date')
      @JsonDateTimeConverter()
      DateTime? extensionDate});
}

/// @nodoc
class __$$CertificateImplCopyWithImpl<$Res>
    extends _$CertificateCopyWithImpl<$Res, _$CertificateImpl>
    implements _$$CertificateImplCopyWith<$Res> {
  __$$CertificateImplCopyWithImpl(
      _$CertificateImpl _value, $Res Function(_$CertificateImpl) _then)
      : super(_value, _then);

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? certNo = freezed,
    Object? releaseDate = freezed,
    Object? expiredDate = freezed,
    Object? extensionDate = freezed,
  }) {
    return _then(_$CertificateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      certNo: freezed == certNo
          ? _value.certNo
          : certNo // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      extensionDate: freezed == extensionDate
          ? _value.extensionDate
          : extensionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CertificateImpl implements _Certificate {
  _$CertificateImpl(
      {@JsonIntConverter() this.id,
      @JsonKey(name: 'no_sertifikat') this.certNo,
      @JsonKey(name: 'realese_date') @JsonDateTimeConverter() this.releaseDate,
      @JsonKey(name: 'expired_date') @JsonDateTimeConverter() this.expiredDate,
      @JsonKey(name: 'extension_date')
      @JsonDateTimeConverter()
      this.extensionDate});

  factory _$CertificateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CertificateImplFromJson(json);

  @override
  @JsonIntConverter()
  final int? id;
  @override
  @JsonKey(name: 'no_sertifikat')
  final String? certNo;
  @override
  @JsonKey(name: 'realese_date')
  @JsonDateTimeConverter()
  final DateTime? releaseDate;
  @override
  @JsonKey(name: 'expired_date')
  @JsonDateTimeConverter()
  final DateTime? expiredDate;
  @override
  @JsonKey(name: 'extension_date')
  @JsonDateTimeConverter()
  final DateTime? extensionDate;

  @override
  String toString() {
    return 'Certificate(id: $id, certNo: $certNo, releaseDate: $releaseDate, expiredDate: $expiredDate, extensionDate: $extensionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CertificateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.certNo, certNo) || other.certNo == certNo) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.extensionDate, extensionDate) ||
                other.extensionDate == extensionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, certNo, releaseDate, expiredDate, extensionDate);

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CertificateImplCopyWith<_$CertificateImpl> get copyWith =>
      __$$CertificateImplCopyWithImpl<_$CertificateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CertificateImplToJson(
      this,
    );
  }
}

abstract class _Certificate implements Certificate {
  factory _Certificate(
      {@JsonIntConverter() final int? id,
      @JsonKey(name: 'no_sertifikat') final String? certNo,
      @JsonKey(name: 'realese_date')
      @JsonDateTimeConverter()
      final DateTime? releaseDate,
      @JsonKey(name: 'expired_date')
      @JsonDateTimeConverter()
      final DateTime? expiredDate,
      @JsonKey(name: 'extension_date')
      @JsonDateTimeConverter()
      final DateTime? extensionDate}) = _$CertificateImpl;

  factory _Certificate.fromJson(Map<String, dynamic> json) =
      _$CertificateImpl.fromJson;

  @override
  @JsonIntConverter()
  int? get id;
  @override
  @JsonKey(name: 'no_sertifikat')
  String? get certNo;
  @override
  @JsonKey(name: 'realese_date')
  @JsonDateTimeConverter()
  DateTime? get releaseDate;
  @override
  @JsonKey(name: 'expired_date')
  @JsonDateTimeConverter()
  DateTime? get expiredDate;
  @override
  @JsonKey(name: 'extension_date')
  @JsonDateTimeConverter()
  DateTime? get extensionDate;

  /// Create a copy of Certificate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CertificateImplCopyWith<_$CertificateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
