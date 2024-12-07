// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamPhotos _$ExamPhotosFromJson(Map<String, dynamic> json) {
  return _ExamPhotos.fromJson(json);
}

/// @nodoc
mixin _$ExamPhotos {
  String? get selfie => throw _privateConstructorUsedError;
  String? get idCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_finish')
  String? get examFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_start')
  String? get examStart => throw _privateConstructorUsedError;

  /// Serializes this ExamPhotos to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamPhotos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamPhotosCopyWith<ExamPhotos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamPhotosCopyWith<$Res> {
  factory $ExamPhotosCopyWith(
          ExamPhotos value, $Res Function(ExamPhotos) then) =
      _$ExamPhotosCopyWithImpl<$Res, ExamPhotos>;
  @useResult
  $Res call(
      {String? selfie,
      String? idCard,
      @JsonKey(name: 'exam_finish') String? examFinish,
      @JsonKey(name: 'exam_start') String? examStart});
}

/// @nodoc
class _$ExamPhotosCopyWithImpl<$Res, $Val extends ExamPhotos>
    implements $ExamPhotosCopyWith<$Res> {
  _$ExamPhotosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamPhotos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selfie = freezed,
    Object? idCard = freezed,
    Object? examFinish = freezed,
    Object? examStart = freezed,
  }) {
    return _then(_value.copyWith(
      selfie: freezed == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String?,
      idCard: freezed == idCard
          ? _value.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as String?,
      examFinish: freezed == examFinish
          ? _value.examFinish
          : examFinish // ignore: cast_nullable_to_non_nullable
              as String?,
      examStart: freezed == examStart
          ? _value.examStart
          : examStart // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamPhotosImplCopyWith<$Res>
    implements $ExamPhotosCopyWith<$Res> {
  factory _$$ExamPhotosImplCopyWith(
          _$ExamPhotosImpl value, $Res Function(_$ExamPhotosImpl) then) =
      __$$ExamPhotosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selfie,
      String? idCard,
      @JsonKey(name: 'exam_finish') String? examFinish,
      @JsonKey(name: 'exam_start') String? examStart});
}

/// @nodoc
class __$$ExamPhotosImplCopyWithImpl<$Res>
    extends _$ExamPhotosCopyWithImpl<$Res, _$ExamPhotosImpl>
    implements _$$ExamPhotosImplCopyWith<$Res> {
  __$$ExamPhotosImplCopyWithImpl(
      _$ExamPhotosImpl _value, $Res Function(_$ExamPhotosImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamPhotos
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selfie = freezed,
    Object? idCard = freezed,
    Object? examFinish = freezed,
    Object? examStart = freezed,
  }) {
    return _then(_$ExamPhotosImpl(
      selfie: freezed == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String?,
      idCard: freezed == idCard
          ? _value.idCard
          : idCard // ignore: cast_nullable_to_non_nullable
              as String?,
      examFinish: freezed == examFinish
          ? _value.examFinish
          : examFinish // ignore: cast_nullable_to_non_nullable
              as String?,
      examStart: freezed == examStart
          ? _value.examStart
          : examStart // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamPhotosImpl implements _ExamPhotos {
  _$ExamPhotosImpl(
      {this.selfie,
      this.idCard,
      @JsonKey(name: 'exam_finish') this.examFinish,
      @JsonKey(name: 'exam_start') this.examStart});

  factory _$ExamPhotosImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamPhotosImplFromJson(json);

  @override
  final String? selfie;
  @override
  final String? idCard;
  @override
  @JsonKey(name: 'exam_finish')
  final String? examFinish;
  @override
  @JsonKey(name: 'exam_start')
  final String? examStart;

  @override
  String toString() {
    return 'ExamPhotos(selfie: $selfie, idCard: $idCard, examFinish: $examFinish, examStart: $examStart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamPhotosImpl &&
            (identical(other.selfie, selfie) || other.selfie == selfie) &&
            (identical(other.idCard, idCard) || other.idCard == idCard) &&
            (identical(other.examFinish, examFinish) ||
                other.examFinish == examFinish) &&
            (identical(other.examStart, examStart) ||
                other.examStart == examStart));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, selfie, idCard, examFinish, examStart);

  /// Create a copy of ExamPhotos
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamPhotosImplCopyWith<_$ExamPhotosImpl> get copyWith =>
      __$$ExamPhotosImplCopyWithImpl<_$ExamPhotosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamPhotosImplToJson(
      this,
    );
  }
}

abstract class _ExamPhotos implements ExamPhotos {
  factory _ExamPhotos(
      {final String? selfie,
      final String? idCard,
      @JsonKey(name: 'exam_finish') final String? examFinish,
      @JsonKey(name: 'exam_start') final String? examStart}) = _$ExamPhotosImpl;

  factory _ExamPhotos.fromJson(Map<String, dynamic> json) =
      _$ExamPhotosImpl.fromJson;

  @override
  String? get selfie;
  @override
  String? get idCard;
  @override
  @JsonKey(name: 'exam_finish')
  String? get examFinish;
  @override
  @JsonKey(name: 'exam_start')
  String? get examStart;

  /// Create a copy of ExamPhotos
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamPhotosImplCopyWith<_$ExamPhotosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
