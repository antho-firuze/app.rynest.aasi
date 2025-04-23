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
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_at')
  @JsonDateTimeConverter()
  DateTime? get startAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'finish_at')
  @JsonDateTimeConverter()
  DateTime? get finishAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  @JsonIntConverter()
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'real_duration')
  String? get realDuration => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_ids')
  String? get questionIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_keys')
  String? get answerKeys => throw _privateConstructorUsedError;
  @JsonKey(name: 'sync_question')
  @JsonIntConverter()
  int? get syncQuestion => throw _privateConstructorUsedError;
  @JsonKey(name: 'click_score')
  @JsonIntConverter()
  int? get clickScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_score')
  @JsonIntConverter()
  int? get checkScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'questions')
  @JsonIntConverter()
  int? get questionCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered_count')
  @JsonIntConverter()
  int? get answeredCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'r_answered_count')
  @JsonIntConverter()
  int? get correctCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'w_answered_count')
  @JsonIntConverter()
  int? get wrongCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'passed_grade')
  @JsonDoubleConverter()
  double? get passedGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'score')
  @JsonDoubleConverter()
  double? get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'desc1')
  String? get desc1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'desc2')
  String? get desc2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'restart')
  int? get restart => throw _privateConstructorUsedError;
  @JsonKey(name: 'device')
  String? get device => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'ip_address')
  String? get ipAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_start')
  bool get photoStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_finish')
  bool get photoFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  List<int> get qids => throw _privateConstructorUsedError;
  List<String> get opts => throw _privateConstructorUsedError;
  List<String> get keys => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'start_at') @JsonDateTimeConverter() DateTime? startAt,
      @JsonKey(name: 'finish_at') @JsonDateTimeConverter() DateTime? finishAt,
      @JsonKey(name: 'duration') @JsonIntConverter() int? duration,
      @JsonKey(name: 'real_duration') String? realDuration,
      @JsonKey(name: 'question_ids') String? questionIds,
      @JsonKey(name: 'answer_keys') String? answerKeys,
      @JsonKey(name: 'sync_question') @JsonIntConverter() int? syncQuestion,
      @JsonKey(name: 'click_score') @JsonIntConverter() int? clickScore,
      @JsonKey(name: 'check_score') @JsonIntConverter() int? checkScore,
      @JsonKey(name: 'questions') @JsonIntConverter() int? questionCount,
      @JsonKey(name: 'answered_count') @JsonIntConverter() int? answeredCount,
      @JsonKey(name: 'r_answered_count') @JsonIntConverter() int? correctCount,
      @JsonKey(name: 'w_answered_count') @JsonIntConverter() int? wrongCount,
      @JsonKey(name: 'passed_grade') @JsonDoubleConverter() double? passedGrade,
      @JsonKey(name: 'score') @JsonDoubleConverter() double? score,
      @JsonKey(name: 'desc1') String? desc1,
      @JsonKey(name: 'desc2') String? desc2,
      @JsonKey(name: 'restart') int? restart,
      @JsonKey(name: 'device') String? device,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'ip_address') String? ipAddress,
      @JsonKey(name: 'photo_start') bool photoStart,
      @JsonKey(name: 'photo_finish') bool photoFinish,
      @JsonKey(name: 'state') String? state,
      List<int> qids,
      List<String> opts,
      List<String> keys});
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
    Object? id = freezed,
    Object? startAt = freezed,
    Object? finishAt = freezed,
    Object? duration = freezed,
    Object? realDuration = freezed,
    Object? questionIds = freezed,
    Object? answerKeys = freezed,
    Object? syncQuestion = freezed,
    Object? clickScore = freezed,
    Object? checkScore = freezed,
    Object? questionCount = freezed,
    Object? answeredCount = freezed,
    Object? correctCount = freezed,
    Object? wrongCount = freezed,
    Object? passedGrade = freezed,
    Object? score = freezed,
    Object? desc1 = freezed,
    Object? desc2 = freezed,
    Object? restart = freezed,
    Object? device = freezed,
    Object? location = freezed,
    Object? ipAddress = freezed,
    Object? photoStart = null,
    Object? photoFinish = null,
    Object? state = freezed,
    Object? qids = null,
    Object? opts = null,
    Object? keys = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishAt: freezed == finishAt
          ? _value.finishAt
          : finishAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      realDuration: freezed == realDuration
          ? _value.realDuration
          : realDuration // ignore: cast_nullable_to_non_nullable
              as String?,
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
      clickScore: freezed == clickScore
          ? _value.clickScore
          : clickScore // ignore: cast_nullable_to_non_nullable
              as int?,
      checkScore: freezed == checkScore
          ? _value.checkScore
          : checkScore // ignore: cast_nullable_to_non_nullable
              as int?,
      questionCount: freezed == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int?,
      answeredCount: freezed == answeredCount
          ? _value.answeredCount
          : answeredCount // ignore: cast_nullable_to_non_nullable
              as int?,
      correctCount: freezed == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int?,
      wrongCount: freezed == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int?,
      passedGrade: freezed == passedGrade
          ? _value.passedGrade
          : passedGrade // ignore: cast_nullable_to_non_nullable
              as double?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      desc1: freezed == desc1
          ? _value.desc1
          : desc1 // ignore: cast_nullable_to_non_nullable
              as String?,
      desc2: freezed == desc2
          ? _value.desc2
          : desc2 // ignore: cast_nullable_to_non_nullable
              as String?,
      restart: freezed == restart
          ? _value.restart
          : restart // ignore: cast_nullable_to_non_nullable
              as int?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      photoStart: null == photoStart
          ? _value.photoStart
          : photoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      photoFinish: null == photoFinish
          ? _value.photoFinish
          : photoFinish // ignore: cast_nullable_to_non_nullable
              as bool,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      qids: null == qids
          ? _value.qids
          : qids // ignore: cast_nullable_to_non_nullable
              as List<int>,
      opts: null == opts
          ? _value.opts
          : opts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keys: null == keys
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'start_at') @JsonDateTimeConverter() DateTime? startAt,
      @JsonKey(name: 'finish_at') @JsonDateTimeConverter() DateTime? finishAt,
      @JsonKey(name: 'duration') @JsonIntConverter() int? duration,
      @JsonKey(name: 'real_duration') String? realDuration,
      @JsonKey(name: 'question_ids') String? questionIds,
      @JsonKey(name: 'answer_keys') String? answerKeys,
      @JsonKey(name: 'sync_question') @JsonIntConverter() int? syncQuestion,
      @JsonKey(name: 'click_score') @JsonIntConverter() int? clickScore,
      @JsonKey(name: 'check_score') @JsonIntConverter() int? checkScore,
      @JsonKey(name: 'questions') @JsonIntConverter() int? questionCount,
      @JsonKey(name: 'answered_count') @JsonIntConverter() int? answeredCount,
      @JsonKey(name: 'r_answered_count') @JsonIntConverter() int? correctCount,
      @JsonKey(name: 'w_answered_count') @JsonIntConverter() int? wrongCount,
      @JsonKey(name: 'passed_grade') @JsonDoubleConverter() double? passedGrade,
      @JsonKey(name: 'score') @JsonDoubleConverter() double? score,
      @JsonKey(name: 'desc1') String? desc1,
      @JsonKey(name: 'desc2') String? desc2,
      @JsonKey(name: 'restart') int? restart,
      @JsonKey(name: 'device') String? device,
      @JsonKey(name: 'location') String? location,
      @JsonKey(name: 'ip_address') String? ipAddress,
      @JsonKey(name: 'photo_start') bool photoStart,
      @JsonKey(name: 'photo_finish') bool photoFinish,
      @JsonKey(name: 'state') String? state,
      List<int> qids,
      List<String> opts,
      List<String> keys});
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
    Object? id = freezed,
    Object? startAt = freezed,
    Object? finishAt = freezed,
    Object? duration = freezed,
    Object? realDuration = freezed,
    Object? questionIds = freezed,
    Object? answerKeys = freezed,
    Object? syncQuestion = freezed,
    Object? clickScore = freezed,
    Object? checkScore = freezed,
    Object? questionCount = freezed,
    Object? answeredCount = freezed,
    Object? correctCount = freezed,
    Object? wrongCount = freezed,
    Object? passedGrade = freezed,
    Object? score = freezed,
    Object? desc1 = freezed,
    Object? desc2 = freezed,
    Object? restart = freezed,
    Object? device = freezed,
    Object? location = freezed,
    Object? ipAddress = freezed,
    Object? photoStart = null,
    Object? photoFinish = null,
    Object? state = freezed,
    Object? qids = null,
    Object? opts = null,
    Object? keys = null,
  }) {
    return _then(_$ExamImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finishAt: freezed == finishAt
          ? _value.finishAt
          : finishAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      realDuration: freezed == realDuration
          ? _value.realDuration
          : realDuration // ignore: cast_nullable_to_non_nullable
              as String?,
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
      clickScore: freezed == clickScore
          ? _value.clickScore
          : clickScore // ignore: cast_nullable_to_non_nullable
              as int?,
      checkScore: freezed == checkScore
          ? _value.checkScore
          : checkScore // ignore: cast_nullable_to_non_nullable
              as int?,
      questionCount: freezed == questionCount
          ? _value.questionCount
          : questionCount // ignore: cast_nullable_to_non_nullable
              as int?,
      answeredCount: freezed == answeredCount
          ? _value.answeredCount
          : answeredCount // ignore: cast_nullable_to_non_nullable
              as int?,
      correctCount: freezed == correctCount
          ? _value.correctCount
          : correctCount // ignore: cast_nullable_to_non_nullable
              as int?,
      wrongCount: freezed == wrongCount
          ? _value.wrongCount
          : wrongCount // ignore: cast_nullable_to_non_nullable
              as int?,
      passedGrade: freezed == passedGrade
          ? _value.passedGrade
          : passedGrade // ignore: cast_nullable_to_non_nullable
              as double?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
      desc1: freezed == desc1
          ? _value.desc1
          : desc1 // ignore: cast_nullable_to_non_nullable
              as String?,
      desc2: freezed == desc2
          ? _value.desc2
          : desc2 // ignore: cast_nullable_to_non_nullable
              as String?,
      restart: freezed == restart
          ? _value.restart
          : restart // ignore: cast_nullable_to_non_nullable
              as int?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      ipAddress: freezed == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      photoStart: null == photoStart
          ? _value.photoStart
          : photoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      photoFinish: null == photoFinish
          ? _value.photoFinish
          : photoFinish // ignore: cast_nullable_to_non_nullable
              as bool,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      qids: null == qids
          ? _value._qids
          : qids // ignore: cast_nullable_to_non_nullable
              as List<int>,
      opts: null == opts
          ? _value._opts
          : opts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      keys: null == keys
          ? _value._keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamImpl implements _Exam {
  _$ExamImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'start_at') @JsonDateTimeConverter() this.startAt,
      @JsonKey(name: 'finish_at') @JsonDateTimeConverter() this.finishAt,
      @JsonKey(name: 'duration') @JsonIntConverter() this.duration,
      @JsonKey(name: 'real_duration') this.realDuration,
      @JsonKey(name: 'question_ids') this.questionIds,
      @JsonKey(name: 'answer_keys') this.answerKeys,
      @JsonKey(name: 'sync_question') @JsonIntConverter() this.syncQuestion,
      @JsonKey(name: 'click_score') @JsonIntConverter() this.clickScore,
      @JsonKey(name: 'check_score') @JsonIntConverter() this.checkScore,
      @JsonKey(name: 'questions') @JsonIntConverter() this.questionCount,
      @JsonKey(name: 'answered_count') @JsonIntConverter() this.answeredCount,
      @JsonKey(name: 'r_answered_count') @JsonIntConverter() this.correctCount,
      @JsonKey(name: 'w_answered_count') @JsonIntConverter() this.wrongCount,
      @JsonKey(name: 'passed_grade') @JsonDoubleConverter() this.passedGrade,
      @JsonKey(name: 'score') @JsonDoubleConverter() this.score,
      @JsonKey(name: 'desc1') this.desc1,
      @JsonKey(name: 'desc2') this.desc2,
      @JsonKey(name: 'restart') this.restart,
      @JsonKey(name: 'device') this.device,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'ip_address') this.ipAddress,
      @JsonKey(name: 'photo_start') this.photoStart = false,
      @JsonKey(name: 'photo_finish') this.photoFinish = false,
      @JsonKey(name: 'state') this.state,
      final List<int> qids = const [],
      final List<String> opts = const [],
      final List<String> keys = const []})
      : _qids = qids,
        _opts = opts,
        _keys = keys;

  factory _$ExamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'start_at')
  @JsonDateTimeConverter()
  final DateTime? startAt;
  @override
  @JsonKey(name: 'finish_at')
  @JsonDateTimeConverter()
  final DateTime? finishAt;
  @override
  @JsonKey(name: 'duration')
  @JsonIntConverter()
  final int? duration;
  @override
  @JsonKey(name: 'real_duration')
  final String? realDuration;
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
  @JsonKey(name: 'click_score')
  @JsonIntConverter()
  final int? clickScore;
  @override
  @JsonKey(name: 'check_score')
  @JsonIntConverter()
  final int? checkScore;
  @override
  @JsonKey(name: 'questions')
  @JsonIntConverter()
  final int? questionCount;
  @override
  @JsonKey(name: 'answered_count')
  @JsonIntConverter()
  final int? answeredCount;
  @override
  @JsonKey(name: 'r_answered_count')
  @JsonIntConverter()
  final int? correctCount;
  @override
  @JsonKey(name: 'w_answered_count')
  @JsonIntConverter()
  final int? wrongCount;
  @override
  @JsonKey(name: 'passed_grade')
  @JsonDoubleConverter()
  final double? passedGrade;
  @override
  @JsonKey(name: 'score')
  @JsonDoubleConverter()
  final double? score;
  @override
  @JsonKey(name: 'desc1')
  final String? desc1;
  @override
  @JsonKey(name: 'desc2')
  final String? desc2;
  @override
  @JsonKey(name: 'restart')
  final int? restart;
  @override
  @JsonKey(name: 'device')
  final String? device;
  @override
  @JsonKey(name: 'location')
  final String? location;
  @override
  @JsonKey(name: 'ip_address')
  final String? ipAddress;
  @override
  @JsonKey(name: 'photo_start')
  final bool photoStart;
  @override
  @JsonKey(name: 'photo_finish')
  final bool photoFinish;
  @override
  @JsonKey(name: 'state')
  final String? state;
  final List<int> _qids;
  @override
  @JsonKey()
  List<int> get qids {
    if (_qids is EqualUnmodifiableListView) return _qids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_qids);
  }

  final List<String> _opts;
  @override
  @JsonKey()
  List<String> get opts {
    if (_opts is EqualUnmodifiableListView) return _opts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opts);
  }

  final List<String> _keys;
  @override
  @JsonKey()
  List<String> get keys {
    if (_keys is EqualUnmodifiableListView) return _keys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keys);
  }

  @override
  String toString() {
    return 'Exam(id: $id, startAt: $startAt, finishAt: $finishAt, duration: $duration, realDuration: $realDuration, questionIds: $questionIds, answerKeys: $answerKeys, syncQuestion: $syncQuestion, clickScore: $clickScore, checkScore: $checkScore, questionCount: $questionCount, answeredCount: $answeredCount, correctCount: $correctCount, wrongCount: $wrongCount, passedGrade: $passedGrade, score: $score, desc1: $desc1, desc2: $desc2, restart: $restart, device: $device, location: $location, ipAddress: $ipAddress, photoStart: $photoStart, photoFinish: $photoFinish, state: $state, qids: $qids, opts: $opts, keys: $keys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.finishAt, finishAt) ||
                other.finishAt == finishAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.realDuration, realDuration) ||
                other.realDuration == realDuration) &&
            (identical(other.questionIds, questionIds) ||
                other.questionIds == questionIds) &&
            (identical(other.answerKeys, answerKeys) ||
                other.answerKeys == answerKeys) &&
            (identical(other.syncQuestion, syncQuestion) ||
                other.syncQuestion == syncQuestion) &&
            (identical(other.clickScore, clickScore) ||
                other.clickScore == clickScore) &&
            (identical(other.checkScore, checkScore) ||
                other.checkScore == checkScore) &&
            (identical(other.questionCount, questionCount) ||
                other.questionCount == questionCount) &&
            (identical(other.answeredCount, answeredCount) ||
                other.answeredCount == answeredCount) &&
            (identical(other.correctCount, correctCount) ||
                other.correctCount == correctCount) &&
            (identical(other.wrongCount, wrongCount) ||
                other.wrongCount == wrongCount) &&
            (identical(other.passedGrade, passedGrade) ||
                other.passedGrade == passedGrade) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.desc1, desc1) || other.desc1 == desc1) &&
            (identical(other.desc2, desc2) || other.desc2 == desc2) &&
            (identical(other.restart, restart) || other.restart == restart) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.photoStart, photoStart) ||
                other.photoStart == photoStart) &&
            (identical(other.photoFinish, photoFinish) ||
                other.photoFinish == photoFinish) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._qids, _qids) &&
            const DeepCollectionEquality().equals(other._opts, _opts) &&
            const DeepCollectionEquality().equals(other._keys, _keys));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        startAt,
        finishAt,
        duration,
        realDuration,
        questionIds,
        answerKeys,
        syncQuestion,
        clickScore,
        checkScore,
        questionCount,
        answeredCount,
        correctCount,
        wrongCount,
        passedGrade,
        score,
        desc1,
        desc2,
        restart,
        device,
        location,
        ipAddress,
        photoStart,
        photoFinish,
        state,
        const DeepCollectionEquality().hash(_qids),
        const DeepCollectionEquality().hash(_opts),
        const DeepCollectionEquality().hash(_keys)
      ]);

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
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'start_at')
      @JsonDateTimeConverter()
      final DateTime? startAt,
      @JsonKey(name: 'finish_at')
      @JsonDateTimeConverter()
      final DateTime? finishAt,
      @JsonKey(name: 'duration') @JsonIntConverter() final int? duration,
      @JsonKey(name: 'real_duration') final String? realDuration,
      @JsonKey(name: 'question_ids') final String? questionIds,
      @JsonKey(name: 'answer_keys') final String? answerKeys,
      @JsonKey(name: 'sync_question')
      @JsonIntConverter()
      final int? syncQuestion,
      @JsonKey(name: 'click_score') @JsonIntConverter() final int? clickScore,
      @JsonKey(name: 'check_score') @JsonIntConverter() final int? checkScore,
      @JsonKey(name: 'questions') @JsonIntConverter() final int? questionCount,
      @JsonKey(name: 'answered_count')
      @JsonIntConverter()
      final int? answeredCount,
      @JsonKey(name: 'r_answered_count')
      @JsonIntConverter()
      final int? correctCount,
      @JsonKey(name: 'w_answered_count')
      @JsonIntConverter()
      final int? wrongCount,
      @JsonKey(name: 'passed_grade')
      @JsonDoubleConverter()
      final double? passedGrade,
      @JsonKey(name: 'score') @JsonDoubleConverter() final double? score,
      @JsonKey(name: 'desc1') final String? desc1,
      @JsonKey(name: 'desc2') final String? desc2,
      @JsonKey(name: 'restart') final int? restart,
      @JsonKey(name: 'device') final String? device,
      @JsonKey(name: 'location') final String? location,
      @JsonKey(name: 'ip_address') final String? ipAddress,
      @JsonKey(name: 'photo_start') final bool photoStart,
      @JsonKey(name: 'photo_finish') final bool photoFinish,
      @JsonKey(name: 'state') final String? state,
      final List<int> qids,
      final List<String> opts,
      final List<String> keys}) = _$ExamImpl;

  factory _Exam.fromJson(Map<String, dynamic> json) = _$ExamImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'start_at')
  @JsonDateTimeConverter()
  DateTime? get startAt;
  @override
  @JsonKey(name: 'finish_at')
  @JsonDateTimeConverter()
  DateTime? get finishAt;
  @override
  @JsonKey(name: 'duration')
  @JsonIntConverter()
  int? get duration;
  @override
  @JsonKey(name: 'real_duration')
  String? get realDuration;
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
  @JsonKey(name: 'click_score')
  @JsonIntConverter()
  int? get clickScore;
  @override
  @JsonKey(name: 'check_score')
  @JsonIntConverter()
  int? get checkScore;
  @override
  @JsonKey(name: 'questions')
  @JsonIntConverter()
  int? get questionCount;
  @override
  @JsonKey(name: 'answered_count')
  @JsonIntConverter()
  int? get answeredCount;
  @override
  @JsonKey(name: 'r_answered_count')
  @JsonIntConverter()
  int? get correctCount;
  @override
  @JsonKey(name: 'w_answered_count')
  @JsonIntConverter()
  int? get wrongCount;
  @override
  @JsonKey(name: 'passed_grade')
  @JsonDoubleConverter()
  double? get passedGrade;
  @override
  @JsonKey(name: 'score')
  @JsonDoubleConverter()
  double? get score;
  @override
  @JsonKey(name: 'desc1')
  String? get desc1;
  @override
  @JsonKey(name: 'desc2')
  String? get desc2;
  @override
  @JsonKey(name: 'restart')
  int? get restart;
  @override
  @JsonKey(name: 'device')
  String? get device;
  @override
  @JsonKey(name: 'location')
  String? get location;
  @override
  @JsonKey(name: 'ip_address')
  String? get ipAddress;
  @override
  @JsonKey(name: 'photo_start')
  bool get photoStart;
  @override
  @JsonKey(name: 'photo_finish')
  bool get photoFinish;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  List<int> get qids;
  @override
  List<String> get opts;
  @override
  List<String> get keys;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
