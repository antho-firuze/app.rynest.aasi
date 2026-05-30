// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExamSchedule _$ExamScheduleFromJson(Map<String, dynamic> json) {
  return _ExamSchedule.fromJson(json);
}

/// @nodoc
mixin _$ExamSchedule {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  @JsonIntConverter()
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'notes')
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_request_id')
  @JsonIntConverter()
  int? get scheduleRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_id')
  @JsonIntConverter()
  int? get scheduleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_id')
  @JsonIntConverter()
  int? get locationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  @JsonIntConverter()
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'open_registration')
  @JsonDateTimeConverter()
  DateTime? get openRegistration => throw _privateConstructorUsedError;
  @JsonKey(name: 'close_registration')
  @JsonDateTimeConverter()
  DateTime? get closeRegistration => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  ExamCategory? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_start')
  bool get photoStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_finish')
  bool get photoFinish => throw _privateConstructorUsedError;

  /// Serializes this ExamSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExamSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamScheduleCopyWith<ExamSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamScheduleCopyWith<$Res> {
  factory $ExamScheduleCopyWith(
          ExamSchedule value, $Res Function(ExamSchedule) then) =
      _$ExamScheduleCopyWithImpl<$Res, ExamSchedule>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'duration') @JsonIntConverter() int? duration,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'schedule_request_id')
      @JsonIntConverter()
      int? scheduleRequestId,
      @JsonKey(name: 'schedule_id') @JsonIntConverter() int? scheduleId,
      @JsonKey(name: 'location_id') @JsonIntConverter() int? locationId,
      @JsonKey(name: 'category_id') @JsonIntConverter() int? categoryId,
      @JsonKey(name: 'open_registration')
      @JsonDateTimeConverter()
      DateTime? openRegistration,
      @JsonKey(name: 'close_registration')
      @JsonDateTimeConverter()
      DateTime? closeRegistration,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'category') ExamCategory? category,
      @JsonKey(name: 'photo_start') bool photoStart,
      @JsonKey(name: 'photo_finish') bool photoFinish});

  $ExamCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$ExamScheduleCopyWithImpl<$Res, $Val extends ExamSchedule>
    implements $ExamScheduleCopyWith<$Res> {
  _$ExamScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExamSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? duration = freezed,
    Object? notes = freezed,
    Object? scheduleRequestId = freezed,
    Object? scheduleId = freezed,
    Object? locationId = freezed,
    Object? categoryId = freezed,
    Object? openRegistration = freezed,
    Object? closeRegistration = freezed,
    Object? state = freezed,
    Object? category = freezed,
    Object? photoStart = null,
    Object? photoFinish = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleRequestId: freezed == scheduleRequestId
          ? _value.scheduleRequestId
          : scheduleRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      openRegistration: freezed == openRegistration
          ? _value.openRegistration
          : openRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeRegistration: freezed == closeRegistration
          ? _value.closeRegistration
          : closeRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExamCategory?,
      photoStart: null == photoStart
          ? _value.photoStart
          : photoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      photoFinish: null == photoFinish
          ? _value.photoFinish
          : photoFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ExamSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExamCategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $ExamCategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExamScheduleImplCopyWith<$Res>
    implements $ExamScheduleCopyWith<$Res> {
  factory _$$ExamScheduleImplCopyWith(
          _$ExamScheduleImpl value, $Res Function(_$ExamScheduleImpl) then) =
      __$$ExamScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'duration') @JsonIntConverter() int? duration,
      @JsonKey(name: 'notes') String? notes,
      @JsonKey(name: 'schedule_request_id')
      @JsonIntConverter()
      int? scheduleRequestId,
      @JsonKey(name: 'schedule_id') @JsonIntConverter() int? scheduleId,
      @JsonKey(name: 'location_id') @JsonIntConverter() int? locationId,
      @JsonKey(name: 'category_id') @JsonIntConverter() int? categoryId,
      @JsonKey(name: 'open_registration')
      @JsonDateTimeConverter()
      DateTime? openRegistration,
      @JsonKey(name: 'close_registration')
      @JsonDateTimeConverter()
      DateTime? closeRegistration,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'category') ExamCategory? category,
      @JsonKey(name: 'photo_start') bool photoStart,
      @JsonKey(name: 'photo_finish') bool photoFinish});

  @override
  $ExamCategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$ExamScheduleImplCopyWithImpl<$Res>
    extends _$ExamScheduleCopyWithImpl<$Res, _$ExamScheduleImpl>
    implements _$$ExamScheduleImplCopyWith<$Res> {
  __$$ExamScheduleImplCopyWithImpl(
      _$ExamScheduleImpl _value, $Res Function(_$ExamScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExamSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? duration = freezed,
    Object? notes = freezed,
    Object? scheduleRequestId = freezed,
    Object? scheduleId = freezed,
    Object? locationId = freezed,
    Object? categoryId = freezed,
    Object? openRegistration = freezed,
    Object? closeRegistration = freezed,
    Object? state = freezed,
    Object? category = freezed,
    Object? photoStart = null,
    Object? photoFinish = null,
  }) {
    return _then(_$ExamScheduleImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleRequestId: freezed == scheduleRequestId
          ? _value.scheduleRequestId
          : scheduleRequestId // ignore: cast_nullable_to_non_nullable
              as int?,
      scheduleId: freezed == scheduleId
          ? _value.scheduleId
          : scheduleId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      openRegistration: freezed == openRegistration
          ? _value.openRegistration
          : openRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeRegistration: freezed == closeRegistration
          ? _value.closeRegistration
          : closeRegistration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ExamCategory?,
      photoStart: null == photoStart
          ? _value.photoStart
          : photoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      photoFinish: null == photoFinish
          ? _value.photoFinish
          : photoFinish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamScheduleImpl implements _ExamSchedule {
  _$ExamScheduleImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'duration') @JsonIntConverter() this.duration,
      @JsonKey(name: 'notes') this.notes,
      @JsonKey(name: 'schedule_request_id')
      @JsonIntConverter()
      this.scheduleRequestId,
      @JsonKey(name: 'schedule_id') @JsonIntConverter() this.scheduleId,
      @JsonKey(name: 'location_id') @JsonIntConverter() this.locationId,
      @JsonKey(name: 'category_id') @JsonIntConverter() this.categoryId,
      @JsonKey(name: 'open_registration')
      @JsonDateTimeConverter()
      this.openRegistration,
      @JsonKey(name: 'close_registration')
      @JsonDateTimeConverter()
      this.closeRegistration,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'photo_start') this.photoStart = false,
      @JsonKey(name: 'photo_finish') this.photoFinish = false});

  factory _$ExamScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamScheduleImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'duration')
  @JsonIntConverter()
  final int? duration;
  @override
  @JsonKey(name: 'notes')
  final String? notes;
  @override
  @JsonKey(name: 'schedule_request_id')
  @JsonIntConverter()
  final int? scheduleRequestId;
  @override
  @JsonKey(name: 'schedule_id')
  @JsonIntConverter()
  final int? scheduleId;
  @override
  @JsonKey(name: 'location_id')
  @JsonIntConverter()
  final int? locationId;
  @override
  @JsonKey(name: 'category_id')
  @JsonIntConverter()
  final int? categoryId;
  @override
  @JsonKey(name: 'open_registration')
  @JsonDateTimeConverter()
  final DateTime? openRegistration;
  @override
  @JsonKey(name: 'close_registration')
  @JsonDateTimeConverter()
  final DateTime? closeRegistration;
  @override
  @JsonKey(name: 'state')
  final String? state;
  @override
  @JsonKey(name: 'category')
  final ExamCategory? category;
  @override
  @JsonKey(name: 'photo_start')
  final bool photoStart;
  @override
  @JsonKey(name: 'photo_finish')
  final bool photoFinish;

  @override
  String toString() {
    return 'ExamSchedule(name: $name, duration: $duration, notes: $notes, scheduleRequestId: $scheduleRequestId, scheduleId: $scheduleId, locationId: $locationId, categoryId: $categoryId, openRegistration: $openRegistration, closeRegistration: $closeRegistration, state: $state, category: $category, photoStart: $photoStart, photoFinish: $photoFinish)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamScheduleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.scheduleRequestId, scheduleRequestId) ||
                other.scheduleRequestId == scheduleRequestId) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.openRegistration, openRegistration) ||
                other.openRegistration == openRegistration) &&
            (identical(other.closeRegistration, closeRegistration) ||
                other.closeRegistration == closeRegistration) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.photoStart, photoStart) ||
                other.photoStart == photoStart) &&
            (identical(other.photoFinish, photoFinish) ||
                other.photoFinish == photoFinish));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      duration,
      notes,
      scheduleRequestId,
      scheduleId,
      locationId,
      categoryId,
      openRegistration,
      closeRegistration,
      state,
      category,
      photoStart,
      photoFinish);

  /// Create a copy of ExamSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamScheduleImplCopyWith<_$ExamScheduleImpl> get copyWith =>
      __$$ExamScheduleImplCopyWithImpl<_$ExamScheduleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamScheduleImplToJson(
      this,
    );
  }
}

abstract class _ExamSchedule implements ExamSchedule {
  factory _ExamSchedule(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'duration') @JsonIntConverter() final int? duration,
      @JsonKey(name: 'notes') final String? notes,
      @JsonKey(name: 'schedule_request_id')
      @JsonIntConverter()
      final int? scheduleRequestId,
      @JsonKey(name: 'schedule_id') @JsonIntConverter() final int? scheduleId,
      @JsonKey(name: 'location_id') @JsonIntConverter() final int? locationId,
      @JsonKey(name: 'category_id') @JsonIntConverter() final int? categoryId,
      @JsonKey(name: 'open_registration')
      @JsonDateTimeConverter()
      final DateTime? openRegistration,
      @JsonKey(name: 'close_registration')
      @JsonDateTimeConverter()
      final DateTime? closeRegistration,
      @JsonKey(name: 'state') final String? state,
      @JsonKey(name: 'category') final ExamCategory? category,
      @JsonKey(name: 'photo_start') final bool photoStart,
      @JsonKey(name: 'photo_finish')
      final bool photoFinish}) = _$ExamScheduleImpl;

  factory _ExamSchedule.fromJson(Map<String, dynamic> json) =
      _$ExamScheduleImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'duration')
  @JsonIntConverter()
  int? get duration;
  @override
  @JsonKey(name: 'notes')
  String? get notes;
  @override
  @JsonKey(name: 'schedule_request_id')
  @JsonIntConverter()
  int? get scheduleRequestId;
  @override
  @JsonKey(name: 'schedule_id')
  @JsonIntConverter()
  int? get scheduleId;
  @override
  @JsonKey(name: 'location_id')
  @JsonIntConverter()
  int? get locationId;
  @override
  @JsonKey(name: 'category_id')
  @JsonIntConverter()
  int? get categoryId;
  @override
  @JsonKey(name: 'open_registration')
  @JsonDateTimeConverter()
  DateTime? get openRegistration;
  @override
  @JsonKey(name: 'close_registration')
  @JsonDateTimeConverter()
  DateTime? get closeRegistration;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  @JsonKey(name: 'category')
  ExamCategory? get category;
  @override
  @JsonKey(name: 'photo_start')
  bool get photoStart;
  @override
  @JsonKey(name: 'photo_finish')
  bool get photoFinish;

  /// Create a copy of ExamSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamScheduleImplCopyWith<_$ExamScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
