// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Exam _$ExamFromJson(Map<String, dynamic> json) {
  return _Exam.fromJson(json);
}

/// @nodoc
mixin _$Exam {
  @JsonKey(name: 'exam_start')
  @JsonDateTimeConverter()
  DateTime? get examStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_end')
  @JsonDateTimeConverter()
  DateTime? get examEnd => throw _privateConstructorUsedError;
  @JsonIntConverter()
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_ids')
  String? get questionIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_keys')
  String? get answerKeys => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_question')
  @JsonIntConverter()
  int? get syncQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_completed')
  bool? get examCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_of_repeat')
  @JsonIntConverter()
  int? get numOfRepeat => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_of_correct')
  @JsonIntConverter()
  int? get numOfCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_answered_question')
  @JsonIntConverter()
  int? get numAnsweredQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_of_question')
  @JsonIntConverter()
  int? get numOfQuestion => throw _privateConstructorUsedError;
  @JsonDoubleConverter()
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_grade')
  @JsonDoubleConverter()
  double? get passedGrade => throw _privateConstructorUsedError;

  /// Serializes this Exam to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamCopyWith<Exam> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamCopyWith<$Res> {
  factory $ExamCopyWith(Exam value, $Res Function(Exam) then) =
      _$ExamCopyWithImpl<$Res, Exam>;
  @useResult
  $Res call(
      {@JsonKey(name: 'exam_start')
      @JsonDateTimeConverter()
      DateTime? examStart,
      @JsonKey(name: 'exam_end') @JsonDateTimeConverter() DateTime? examEnd,
      @JsonIntConverter() int? duration,
      @JsonKey(name: 'question_ids') String? questionIds,
      @JsonKey(name: 'answer_keys') String? answerKeys,
      @JsonKey(name: 'sync_question') @JsonIntConverter() int? syncQuestion,
      @JsonKey(name: 'exam_completed') bool? examCompleted,
      @JsonKey(name: 'num_of_repeat') @JsonIntConverter() int? numOfRepeat,
      @JsonKey(name: 'num_of_correct') @JsonIntConverter() int? numOfCorrect,
      @JsonKey(name: 'num_answered_question')
      @JsonIntConverter()
      int? numAnsweredQuestion,
      @JsonKey(name: 'num_of_question') @JsonIntConverter() int? numOfQuestion,
      @JsonDoubleConverter() double? score,
      @JsonKey(name: 'passed_grade')
      @JsonDoubleConverter()
      double? passedGrade});
}

/// @nodoc
class _$ExamCopyWithImpl<$Res, $Val extends Exam>
    implements $ExamCopyWith<$Res> {
  _$ExamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? examStart = freezed,
    Object? examEnd = freezed,
    Object? duration = freezed,
    Object? questionIds = freezed,
    Object? answerKeys = freezed,
    Object? syncQuestion = freezed,
    Object? examCompleted = freezed,
    Object? numOfRepeat = freezed,
    Object? numOfCorrect = freezed,
    Object? numAnsweredQuestion = freezed,
    Object? numOfQuestion = freezed,
    Object? score = freezed,
    Object? passedGrade = freezed,
  }) {
    return _then(_value.copyWith(
      examStart: freezed == examStart
          ? _value.examStart
          : examStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      examEnd: freezed == examEnd
          ? _value.examEnd
          : examEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      questionIds: freezed == questionIds
          ? _value.questionIds
          : questionIds // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKeys: freezed == answerKeys
          ? _value.answerKeys
          : answerKeys // ignore: cast_nullable_to_non_nullable
              as String?,
      syncQuestion: freezed == syncQuestion
          ? _value.syncQuestion
          : syncQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      examCompleted: freezed == examCompleted
          ? _value.examCompleted
          : examCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      numOfRepeat: freezed == numOfRepeat
          ? _value.numOfRepeat
          : numOfRepeat // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfCorrect: freezed == numOfCorrect
          ? _value.numOfCorrect
          : numOfCorrect // ignore: cast_nullable_to_non_nullable
              as int?,
      numAnsweredQuestion: freezed == numAnsweredQuestion
          ? _value.numAnsweredQuestion
          : numAnsweredQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfQuestion: freezed == numOfQuestion
          ? _value.numOfQuestion
          : numOfQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      passedGrade: freezed == passedGrade
          ? _value.passedGrade
          : passedGrade // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExamImplCopyWith<$Res> implements $ExamCopyWith<$Res> {
  factory _$$ExamImplCopyWith(
          _$ExamImpl value, $Res Function(_$ExamImpl) then) =
      __$$ExamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'exam_start')
      @JsonDateTimeConverter()
      DateTime? examStart,
      @JsonKey(name: 'exam_end') @JsonDateTimeConverter() DateTime? examEnd,
      @JsonIntConverter() int? duration,
      @JsonKey(name: 'question_ids') String? questionIds,
      @JsonKey(name: 'answer_keys') String? answerKeys,
      @JsonKey(name: 'sync_question') @JsonIntConverter() int? syncQuestion,
      @JsonKey(name: 'exam_completed') bool? examCompleted,
      @JsonKey(name: 'num_of_repeat') @JsonIntConverter() int? numOfRepeat,
      @JsonKey(name: 'num_of_correct') @JsonIntConverter() int? numOfCorrect,
      @JsonKey(name: 'num_answered_question')
      @JsonIntConverter()
      int? numAnsweredQuestion,
      @JsonKey(name: 'num_of_question') @JsonIntConverter() int? numOfQuestion,
      @JsonDoubleConverter() double? score,
      @JsonKey(name: 'passed_grade')
      @JsonDoubleConverter()
      double? passedGrade});
}

/// @nodoc
class __$$ExamImplCopyWithImpl<$Res>
    extends _$ExamCopyWithImpl<$Res, _$ExamImpl>
    implements _$$ExamImplCopyWith<$Res> {
  __$$ExamImplCopyWithImpl(_$ExamImpl _value, $Res Function(_$ExamImpl) _then)
      : super(_value, _then);

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? examStart = freezed,
    Object? examEnd = freezed,
    Object? duration = freezed,
    Object? questionIds = freezed,
    Object? answerKeys = freezed,
    Object? syncQuestion = freezed,
    Object? examCompleted = freezed,
    Object? numOfRepeat = freezed,
    Object? numOfCorrect = freezed,
    Object? numAnsweredQuestion = freezed,
    Object? numOfQuestion = freezed,
    Object? score = freezed,
    Object? passedGrade = freezed,
  }) {
    return _then(_$ExamImpl(
      examStart: freezed == examStart
          ? _value.examStart
          : examStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      examEnd: freezed == examEnd
          ? _value.examEnd
          : examEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      questionIds: freezed == questionIds
          ? _value.questionIds
          : questionIds // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKeys: freezed == answerKeys
          ? _value.answerKeys
          : answerKeys // ignore: cast_nullable_to_non_nullable
              as String?,
      syncQuestion: freezed == syncQuestion
          ? _value.syncQuestion
          : syncQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      examCompleted: freezed == examCompleted
          ? _value.examCompleted
          : examCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      numOfRepeat: freezed == numOfRepeat
          ? _value.numOfRepeat
          : numOfRepeat // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfCorrect: freezed == numOfCorrect
          ? _value.numOfCorrect
          : numOfCorrect // ignore: cast_nullable_to_non_nullable
              as int?,
      numAnsweredQuestion: freezed == numAnsweredQuestion
          ? _value.numAnsweredQuestion
          : numAnsweredQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfQuestion: freezed == numOfQuestion
          ? _value.numOfQuestion
          : numOfQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      passedGrade: freezed == passedGrade
          ? _value.passedGrade
          : passedGrade // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamImpl implements _Exam {
  _$ExamImpl(
      {@JsonKey(name: 'exam_start') @JsonDateTimeConverter() this.examStart,
      @JsonKey(name: 'exam_end') @JsonDateTimeConverter() this.examEnd,
      @JsonIntConverter() this.duration,
      @JsonKey(name: 'question_ids') this.questionIds,
      @JsonKey(name: 'answer_keys') this.answerKeys,
      @JsonKey(name: 'sync_question') @JsonIntConverter() this.syncQuestion,
      @JsonKey(name: 'exam_completed') this.examCompleted,
      @JsonKey(name: 'num_of_repeat') @JsonIntConverter() this.numOfRepeat,
      @JsonKey(name: 'num_of_correct') @JsonIntConverter() this.numOfCorrect,
      @JsonKey(name: 'num_answered_question')
      @JsonIntConverter()
      this.numAnsweredQuestion,
      @JsonKey(name: 'num_of_question') @JsonIntConverter() this.numOfQuestion,
      @JsonDoubleConverter() this.score,
      @JsonKey(name: 'passed_grade') @JsonDoubleConverter() this.passedGrade});

  factory _$ExamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamImplFromJson(json);

  @override
  @JsonKey(name: 'exam_start')
  @JsonDateTimeConverter()
  final DateTime? examStart;
  @override
  @JsonKey(name: 'exam_end')
  @JsonDateTimeConverter()
  final DateTime? examEnd;
  @override
  @JsonIntConverter()
  final int? duration;
  @override
  @JsonKey(name: 'question_ids')
  final String? questionIds;
  @override
  @JsonKey(name: 'answer_keys')
  final String? answerKeys;
  @override
  @JsonKey(name: 'sync_question')
  @JsonIntConverter()
  final int? syncQuestion;
  @override
  @JsonKey(name: 'exam_completed')
  final bool? examCompleted;
  @override
  @JsonKey(name: 'num_of_repeat')
  @JsonIntConverter()
  final int? numOfRepeat;
  @override
  @JsonKey(name: 'num_of_correct')
  @JsonIntConverter()
  final int? numOfCorrect;
  @override
  @JsonKey(name: 'num_answered_question')
  @JsonIntConverter()
  final int? numAnsweredQuestion;
  @override
  @JsonKey(name: 'num_of_question')
  @JsonIntConverter()
  final int? numOfQuestion;
  @override
  @JsonDoubleConverter()
  final double? score;
  @override
  @JsonKey(name: 'passed_grade')
  @JsonDoubleConverter()
  final double? passedGrade;

  @override
  String toString() {
    return 'Exam(examStart: $examStart, examEnd: $examEnd, duration: $duration, questionIds: $questionIds, answerKeys: $answerKeys, syncQuestion: $syncQuestion, examCompleted: $examCompleted, numOfRepeat: $numOfRepeat, numOfCorrect: $numOfCorrect, numAnsweredQuestion: $numAnsweredQuestion, numOfQuestion: $numOfQuestion, score: $score, passedGrade: $passedGrade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamImpl &&
            (identical(other.examStart, examStart) ||
                other.examStart == examStart) &&
            (identical(other.examEnd, examEnd) || other.examEnd == examEnd) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.questionIds, questionIds) ||
                other.questionIds == questionIds) &&
            (identical(other.answerKeys, answerKeys) ||
                other.answerKeys == answerKeys) &&
            (identical(other.syncQuestion, syncQuestion) ||
                other.syncQuestion == syncQuestion) &&
            (identical(other.examCompleted, examCompleted) ||
                other.examCompleted == examCompleted) &&
            (identical(other.numOfRepeat, numOfRepeat) ||
                other.numOfRepeat == numOfRepeat) &&
            (identical(other.numOfCorrect, numOfCorrect) ||
                other.numOfCorrect == numOfCorrect) &&
            (identical(other.numAnsweredQuestion, numAnsweredQuestion) ||
                other.numAnsweredQuestion == numAnsweredQuestion) &&
            (identical(other.numOfQuestion, numOfQuestion) ||
                other.numOfQuestion == numOfQuestion) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.passedGrade, passedGrade) ||
                other.passedGrade == passedGrade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      examStart,
      examEnd,
      duration,
      questionIds,
      answerKeys,
      syncQuestion,
      examCompleted,
      numOfRepeat,
      numOfCorrect,
      numAnsweredQuestion,
      numOfQuestion,
      score,
      passedGrade);

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      __$$ExamImplCopyWithImpl<_$ExamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamImplToJson(
      this,
    );
  }
}

abstract class _Exam implements Exam {
  factory _Exam(
      {@JsonKey(name: 'exam_start')
      @JsonDateTimeConverter()
      final DateTime? examStart,
      @JsonKey(name: 'exam_end')
      @JsonDateTimeConverter()
      final DateTime? examEnd,
      @JsonIntConverter() final int? duration,
      @JsonKey(name: 'question_ids') final String? questionIds,
      @JsonKey(name: 'answer_keys') final String? answerKeys,
      @JsonKey(name: 'sync_question')
      @JsonIntConverter()
      final int? syncQuestion,
      @JsonKey(name: 'exam_completed') final bool? examCompleted,
      @JsonKey(name: 'num_of_repeat')
      @JsonIntConverter()
      final int? numOfRepeat,
      @JsonKey(name: 'num_of_correct')
      @JsonIntConverter()
      final int? numOfCorrect,
      @JsonKey(name: 'num_answered_question')
      @JsonIntConverter()
      final int? numAnsweredQuestion,
      @JsonKey(name: 'num_of_question')
      @JsonIntConverter()
      final int? numOfQuestion,
      @JsonDoubleConverter() final double? score,
      @JsonKey(name: 'passed_grade')
      @JsonDoubleConverter()
      final double? passedGrade}) = _$ExamImpl;

  factory _Exam.fromJson(Map<String, dynamic> json) = _$ExamImpl.fromJson;

  @override
  @JsonKey(name: 'exam_start')
  @JsonDateTimeConverter()
  DateTime? get examStart;
  @override
  @JsonKey(name: 'exam_end')
  @JsonDateTimeConverter()
  DateTime? get examEnd;
  @override
  @JsonIntConverter()
  int? get duration;
  @override
  @JsonKey(name: 'question_ids')
  String? get questionIds;
  @override
  @JsonKey(name: 'answer_keys')
  String? get answerKeys;
  @override
  @JsonKey(name: 'sync_question')
  @JsonIntConverter()
  int? get syncQuestion;
  @override
  @JsonKey(name: 'exam_completed')
  bool? get examCompleted;
  @override
  @JsonKey(name: 'num_of_repeat')
  @JsonIntConverter()
  int? get numOfRepeat;
  @override
  @JsonKey(name: 'num_of_correct')
  @JsonIntConverter()
  int? get numOfCorrect;
  @override
  @JsonKey(name: 'num_answered_question')
  @JsonIntConverter()
  int? get numAnsweredQuestion;
  @override
  @JsonKey(name: 'num_of_question')
  @JsonIntConverter()
  int? get numOfQuestion;
  @override
  @JsonDoubleConverter()
  double? get score;
  @override
  @JsonKey(name: 'passed_grade')
  @JsonDoubleConverter()
  double? get passedGrade;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
