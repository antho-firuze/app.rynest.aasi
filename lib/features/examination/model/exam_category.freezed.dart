// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamCategory _$ExamCategoryFromJson(Map<String, dynamic> json) {
  return _ExamCategory.fromJson(json);
}

/// @nodoc
mixin _$ExamCategory {
  @JsonIntConverter()
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonIntConverter()
  int get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_grade')
  @JsonIntConverter()
  int get passedGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_of_question')
  @JsonIntConverter()
  int? get numOfQuestion => throw _privateConstructorUsedError;

  /// Serializes this ExamCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamCategoryCopyWith<ExamCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamCategoryCopyWith<$Res> {
  factory $ExamCategoryCopyWith(
          ExamCategory value, $Res Function(ExamCategory) then) =
      _$ExamCategoryCopyWithImpl<$Res, ExamCategory>;
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      String? name,
      @JsonIntConverter() int duration,
      @JsonKey(name: 'passed_grade') @JsonIntConverter() int passedGrade,
      @JsonKey(name: 'num_of_question')
      @JsonIntConverter()
      int? numOfQuestion});
}

/// @nodoc
class _$ExamCategoryCopyWithImpl<$Res, $Val extends ExamCategory>
    implements $ExamCategoryCopyWith<$Res> {
  _$ExamCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = null,
    Object? passedGrade = null,
    Object? numOfQuestion = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      passedGrade: null == passedGrade
          ? _value.passedGrade
          : passedGrade // ignore: cast_nullable_to_non_nullable
              as int,
      numOfQuestion: freezed == numOfQuestion
          ? _value.numOfQuestion
          : numOfQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamCategoryImplCopyWith<$Res>
    implements $ExamCategoryCopyWith<$Res> {
  factory _$$ExamCategoryImplCopyWith(
          _$ExamCategoryImpl value, $Res Function(_$ExamCategoryImpl) then) =
      __$$ExamCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      String? name,
      @JsonIntConverter() int duration,
      @JsonKey(name: 'passed_grade') @JsonIntConverter() int passedGrade,
      @JsonKey(name: 'num_of_question')
      @JsonIntConverter()
      int? numOfQuestion});
}

/// @nodoc
class __$$ExamCategoryImplCopyWithImpl<$Res>
    extends _$ExamCategoryCopyWithImpl<$Res, _$ExamCategoryImpl>
    implements _$$ExamCategoryImplCopyWith<$Res> {
  __$$ExamCategoryImplCopyWithImpl(
      _$ExamCategoryImpl _value, $Res Function(_$ExamCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? duration = null,
    Object? passedGrade = null,
    Object? numOfQuestion = freezed,
  }) {
    return _then(_$ExamCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      passedGrade: null == passedGrade
          ? _value.passedGrade
          : passedGrade // ignore: cast_nullable_to_non_nullable
              as int,
      numOfQuestion: freezed == numOfQuestion
          ? _value.numOfQuestion
          : numOfQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamCategoryImpl implements _ExamCategory {
  _$ExamCategoryImpl(
      {@JsonIntConverter() this.id,
      this.name,
      @JsonIntConverter() this.duration = 0,
      @JsonKey(name: 'passed_grade') @JsonIntConverter() this.passedGrade = 0,
      @JsonKey(name: 'num_of_question')
      @JsonIntConverter()
      this.numOfQuestion});

  factory _$ExamCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamCategoryImplFromJson(json);

  @override
  @JsonIntConverter()
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey()
  @JsonIntConverter()
  final int duration;
  @override
  @JsonKey(name: 'passed_grade')
  @JsonIntConverter()
  final int passedGrade;
  @override
  @JsonKey(name: 'num_of_question')
  @JsonIntConverter()
  final int? numOfQuestion;

  @override
  String toString() {
    return 'ExamCategory(id: $id, name: $name, duration: $duration, passedGrade: $passedGrade, numOfQuestion: $numOfQuestion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.passedGrade, passedGrade) ||
                other.passedGrade == passedGrade) &&
            (identical(other.numOfQuestion, numOfQuestion) ||
                other.numOfQuestion == numOfQuestion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, duration, passedGrade, numOfQuestion);

  /// Create a copy of ExamCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamCategoryImplCopyWith<_$ExamCategoryImpl> get copyWith =>
      __$$ExamCategoryImplCopyWithImpl<_$ExamCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamCategoryImplToJson(
      this,
    );
  }
}

abstract class _ExamCategory implements ExamCategory {
  factory _ExamCategory(
      {@JsonIntConverter() final int? id,
      final String? name,
      @JsonIntConverter() final int duration,
      @JsonKey(name: 'passed_grade') @JsonIntConverter() final int passedGrade,
      @JsonKey(name: 'num_of_question')
      @JsonIntConverter()
      final int? numOfQuestion}) = _$ExamCategoryImpl;

  factory _ExamCategory.fromJson(Map<String, dynamic> json) =
      _$ExamCategoryImpl.fromJson;

  @override
  @JsonIntConverter()
  int? get id;
  @override
  String? get name;
  @override
  @JsonIntConverter()
  int get duration;
  @override
  @JsonKey(name: 'passed_grade')
  @JsonIntConverter()
  int get passedGrade;
  @override
  @JsonKey(name: 'num_of_question')
  @JsonIntConverter()
  int? get numOfQuestion;

  /// Create a copy of ExamCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamCategoryImplCopyWith<_$ExamCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
