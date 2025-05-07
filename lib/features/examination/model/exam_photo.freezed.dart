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

ExamPhoto _$ExamPhotoFromJson(Map<String, dynamic> json) {
  return _ExamPhoto.fromJson(json);
}

/// @nodoc
mixin _$ExamPhoto {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this ExamPhoto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamPhotoCopyWith<ExamPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamPhotoCopyWith<$Res> {
  factory $ExamPhotoCopyWith(ExamPhoto value, $Res Function(ExamPhoto) then) =
      _$ExamPhotoCopyWithImpl<$Res, ExamPhoto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class _$ExamPhotoCopyWithImpl<$Res, $Val extends ExamPhoto>
    implements $ExamPhotoCopyWith<$Res> {
  _$ExamPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamPhotoImplCopyWith<$Res>
    implements $ExamPhotoCopyWith<$Res> {
  factory _$$ExamPhotoImplCopyWith(
          _$ExamPhotoImpl value, $Res Function(_$ExamPhotoImpl) then) =
      __$$ExamPhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'image_url') String? imageUrl});
}

/// @nodoc
class __$$ExamPhotoImplCopyWithImpl<$Res>
    extends _$ExamPhotoCopyWithImpl<$Res, _$ExamPhotoImpl>
    implements _$$ExamPhotoImplCopyWith<$Res> {
  __$$ExamPhotoImplCopyWithImpl(
      _$ExamPhotoImpl _value, $Res Function(_$ExamPhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$ExamPhotoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamPhotoImpl implements _ExamPhoto {
  _$ExamPhotoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'image_url') this.imageUrl});

  factory _$ExamPhotoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamPhotoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @override
  String toString() {
    return 'ExamPhoto(id: $id, type: $type, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamPhotoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, imageUrl);

  /// Create a copy of ExamPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamPhotoImplCopyWith<_$ExamPhotoImpl> get copyWith =>
      __$$ExamPhotoImplCopyWithImpl<_$ExamPhotoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamPhotoImplToJson(
      this,
    );
  }
}

abstract class _ExamPhoto implements ExamPhoto {
  factory _ExamPhoto(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'image_url') final String? imageUrl}) = _$ExamPhotoImpl;

  factory _ExamPhoto.fromJson(Map<String, dynamic> json) =
      _$ExamPhotoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;

  /// Create a copy of ExamPhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamPhotoImplCopyWith<_$ExamPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
