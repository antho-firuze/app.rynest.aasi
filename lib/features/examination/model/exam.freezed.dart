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
  DateTime? get examStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_end')
  DateTime? get examEnd => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'exam_completed')
  bool? get examCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_of_question')
  int? get numOfQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_of_correct')
  int? get numOfCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_answered_question')
  int? get numAnsweredQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_remain_question')
  int? get numRemainQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_of_repeat')
  int? get numOfRepeat => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_of_answer')
  int? get minOfAnswer => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'exam_start') DateTime? examStart,
      @JsonKey(name: 'exam_end') DateTime? examEnd,
      int? duration,
      @JsonKey(name: 'exam_completed') bool? examCompleted,
      @JsonKey(name: 'num_of_question') int? numOfQuestion,
      @JsonKey(name: 'num_of_correct') int? numOfCorrect,
      @JsonKey(name: 'num_answered_question') int? numAnsweredQuestion,
      @JsonKey(name: 'num_remain_question') int? numRemainQuestion,
      @JsonKey(name: 'num_of_repeat') int? numOfRepeat,
      @JsonKey(name: 'min_of_answer') int? minOfAnswer,
      double? score});
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
    Object? examCompleted = freezed,
    Object? numOfQuestion = freezed,
    Object? numOfCorrect = freezed,
    Object? numAnsweredQuestion = freezed,
    Object? numRemainQuestion = freezed,
    Object? numOfRepeat = freezed,
    Object? minOfAnswer = freezed,
    Object? score = freezed,
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
      examCompleted: freezed == examCompleted
          ? _value.examCompleted
          : examCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      numOfQuestion: freezed == numOfQuestion
          ? _value.numOfQuestion
          : numOfQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfCorrect: freezed == numOfCorrect
          ? _value.numOfCorrect
          : numOfCorrect // ignore: cast_nullable_to_non_nullable
              as int?,
      numAnsweredQuestion: freezed == numAnsweredQuestion
          ? _value.numAnsweredQuestion
          : numAnsweredQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numRemainQuestion: freezed == numRemainQuestion
          ? _value.numRemainQuestion
          : numRemainQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfRepeat: freezed == numOfRepeat
          ? _value.numOfRepeat
          : numOfRepeat // ignore: cast_nullable_to_non_nullable
              as int?,
      minOfAnswer: freezed == minOfAnswer
          ? _value.minOfAnswer
          : minOfAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'exam_start') DateTime? examStart,
      @JsonKey(name: 'exam_end') DateTime? examEnd,
      int? duration,
      @JsonKey(name: 'exam_completed') bool? examCompleted,
      @JsonKey(name: 'num_of_question') int? numOfQuestion,
      @JsonKey(name: 'num_of_correct') int? numOfCorrect,
      @JsonKey(name: 'num_answered_question') int? numAnsweredQuestion,
      @JsonKey(name: 'num_remain_question') int? numRemainQuestion,
      @JsonKey(name: 'num_of_repeat') int? numOfRepeat,
      @JsonKey(name: 'min_of_answer') int? minOfAnswer,
      double? score});
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
    Object? examCompleted = freezed,
    Object? numOfQuestion = freezed,
    Object? numOfCorrect = freezed,
    Object? numAnsweredQuestion = freezed,
    Object? numRemainQuestion = freezed,
    Object? numOfRepeat = freezed,
    Object? minOfAnswer = freezed,
    Object? score = freezed,
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
      examCompleted: freezed == examCompleted
          ? _value.examCompleted
          : examCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      numOfQuestion: freezed == numOfQuestion
          ? _value.numOfQuestion
          : numOfQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfCorrect: freezed == numOfCorrect
          ? _value.numOfCorrect
          : numOfCorrect // ignore: cast_nullable_to_non_nullable
              as int?,
      numAnsweredQuestion: freezed == numAnsweredQuestion
          ? _value.numAnsweredQuestion
          : numAnsweredQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numRemainQuestion: freezed == numRemainQuestion
          ? _value.numRemainQuestion
          : numRemainQuestion // ignore: cast_nullable_to_non_nullable
              as int?,
      numOfRepeat: freezed == numOfRepeat
          ? _value.numOfRepeat
          : numOfRepeat // ignore: cast_nullable_to_non_nullable
              as int?,
      minOfAnswer: freezed == minOfAnswer
          ? _value.minOfAnswer
          : minOfAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamImpl implements _Exam {
  _$ExamImpl(
      {@JsonKey(name: 'exam_start') this.examStart,
      @JsonKey(name: 'exam_end') this.examEnd,
      this.duration,
      @JsonKey(name: 'exam_completed') this.examCompleted,
      @JsonKey(name: 'num_of_question') this.numOfQuestion,
      @JsonKey(name: 'num_of_correct') this.numOfCorrect,
      @JsonKey(name: 'num_answered_question') this.numAnsweredQuestion,
      @JsonKey(name: 'num_remain_question') this.numRemainQuestion,
      @JsonKey(name: 'num_of_repeat') this.numOfRepeat,
      @JsonKey(name: 'min_of_answer') this.minOfAnswer,
      this.score});

  factory _$ExamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamImplFromJson(json);

  @override
  @JsonKey(name: 'exam_start')
  final DateTime? examStart;
  @override
  @JsonKey(name: 'exam_end')
  final DateTime? examEnd;
  @override
  final int? duration;
  @override
  @JsonKey(name: 'exam_completed')
  final bool? examCompleted;
  @override
  @JsonKey(name: 'num_of_question')
  final int? numOfQuestion;
  @override
  @JsonKey(name: 'num_of_correct')
  final int? numOfCorrect;
  @override
  @JsonKey(name: 'num_answered_question')
  final int? numAnsweredQuestion;
  @override
  @JsonKey(name: 'num_remain_question')
  final int? numRemainQuestion;
  @override
  @JsonKey(name: 'num_of_repeat')
  final int? numOfRepeat;
  @override
  @JsonKey(name: 'min_of_answer')
  final int? minOfAnswer;
  @override
  final double? score;

  @override
  String toString() {
    return 'Exam(examStart: $examStart, examEnd: $examEnd, duration: $duration, examCompleted: $examCompleted, numOfQuestion: $numOfQuestion, numOfCorrect: $numOfCorrect, numAnsweredQuestion: $numAnsweredQuestion, numRemainQuestion: $numRemainQuestion, numOfRepeat: $numOfRepeat, minOfAnswer: $minOfAnswer, score: $score)';
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
            (identical(other.examCompleted, examCompleted) ||
                other.examCompleted == examCompleted) &&
            (identical(other.numOfQuestion, numOfQuestion) ||
                other.numOfQuestion == numOfQuestion) &&
            (identical(other.numOfCorrect, numOfCorrect) ||
                other.numOfCorrect == numOfCorrect) &&
            (identical(other.numAnsweredQuestion, numAnsweredQuestion) ||
                other.numAnsweredQuestion == numAnsweredQuestion) &&
            (identical(other.numRemainQuestion, numRemainQuestion) ||
                other.numRemainQuestion == numRemainQuestion) &&
            (identical(other.numOfRepeat, numOfRepeat) ||
                other.numOfRepeat == numOfRepeat) &&
            (identical(other.minOfAnswer, minOfAnswer) ||
                other.minOfAnswer == minOfAnswer) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      examStart,
      examEnd,
      duration,
      examCompleted,
      numOfQuestion,
      numOfCorrect,
      numAnsweredQuestion,
      numRemainQuestion,
      numOfRepeat,
      minOfAnswer,
      score);

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
      {@JsonKey(name: 'exam_start') final DateTime? examStart,
      @JsonKey(name: 'exam_end') final DateTime? examEnd,
      final int? duration,
      @JsonKey(name: 'exam_completed') final bool? examCompleted,
      @JsonKey(name: 'num_of_question') final int? numOfQuestion,
      @JsonKey(name: 'num_of_correct') final int? numOfCorrect,
      @JsonKey(name: 'num_answered_question') final int? numAnsweredQuestion,
      @JsonKey(name: 'num_remain_question') final int? numRemainQuestion,
      @JsonKey(name: 'num_of_repeat') final int? numOfRepeat,
      @JsonKey(name: 'min_of_answer') final int? minOfAnswer,
      final double? score}) = _$ExamImpl;

  factory _Exam.fromJson(Map<String, dynamic> json) = _$ExamImpl.fromJson;

  @override
  @JsonKey(name: 'exam_start')
  DateTime? get examStart;
  @override
  @JsonKey(name: 'exam_end')
  DateTime? get examEnd;
  @override
  int? get duration;
  @override
  @JsonKey(name: 'exam_completed')
  bool? get examCompleted;
  @override
  @JsonKey(name: 'num_of_question')
  int? get numOfQuestion;
  @override
  @JsonKey(name: 'num_of_correct')
  int? get numOfCorrect;
  @override
  @JsonKey(name: 'num_answered_question')
  int? get numAnsweredQuestion;
  @override
  @JsonKey(name: 'num_remain_question')
  int? get numRemainQuestion;
  @override
  @JsonKey(name: 'num_of_repeat')
  int? get numOfRepeat;
  @override
  @JsonKey(name: 'min_of_answer')
  int? get minOfAnswer;
  @override
  double? get score;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
