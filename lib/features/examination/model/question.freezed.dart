// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  @JsonIntConverter()
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String? get questionId => throw _privateConstructorUsedError;
  String? get shuffle => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_a')
  String? get answerOptionA => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_b')
  String? get answerOptionB => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_c')
  String? get answerOptionC => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_d')
  String? get answerOptionD => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_key')
  String? get answerKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered_key')
  String? get answeredKey => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      @JsonKey(name: 'question_id') String? questionId,
      String? shuffle,
      String? question,
      @JsonKey(name: 'answer_option_a') String? answerOptionA,
      @JsonKey(name: 'answer_option_b') String? answerOptionB,
      @JsonKey(name: 'answer_option_c') String? answerOptionC,
      @JsonKey(name: 'answer_option_d') String? answerOptionD,
      @JsonKey(name: 'answer_key') String? answerKey,
      @JsonKey(name: 'answered_key') String? answeredKey});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionId = freezed,
    Object? shuffle = freezed,
    Object? question = freezed,
    Object? answerOptionA = freezed,
    Object? answerOptionB = freezed,
    Object? answerOptionC = freezed,
    Object? answerOptionD = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffle: freezed == shuffle
          ? _value.shuffle
          : shuffle // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionA: freezed == answerOptionA
          ? _value.answerOptionA
          : answerOptionA // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionB: freezed == answerOptionB
          ? _value.answerOptionB
          : answerOptionB // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionC: freezed == answerOptionC
          ? _value.answerOptionC
          : answerOptionC // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionD: freezed == answerOptionD
          ? _value.answerOptionD
          : answerOptionD // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKey: freezed == answerKey
          ? _value.answerKey
          : answerKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredKey: freezed == answeredKey
          ? _value.answeredKey
          : answeredKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonIntConverter() int? id,
      @JsonKey(name: 'question_id') String? questionId,
      String? shuffle,
      String? question,
      @JsonKey(name: 'answer_option_a') String? answerOptionA,
      @JsonKey(name: 'answer_option_b') String? answerOptionB,
      @JsonKey(name: 'answer_option_c') String? answerOptionC,
      @JsonKey(name: 'answer_option_d') String? answerOptionD,
      @JsonKey(name: 'answer_key') String? answerKey,
      @JsonKey(name: 'answered_key') String? answeredKey});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? questionId = freezed,
    Object? shuffle = freezed,
    Object? question = freezed,
    Object? answerOptionA = freezed,
    Object? answerOptionB = freezed,
    Object? answerOptionC = freezed,
    Object? answerOptionD = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
  }) {
    return _then(_$QuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffle: freezed == shuffle
          ? _value.shuffle
          : shuffle // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionA: freezed == answerOptionA
          ? _value.answerOptionA
          : answerOptionA // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionB: freezed == answerOptionB
          ? _value.answerOptionB
          : answerOptionB // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionC: freezed == answerOptionC
          ? _value.answerOptionC
          : answerOptionC // ignore: cast_nullable_to_non_nullable
              as String?,
      answerOptionD: freezed == answerOptionD
          ? _value.answerOptionD
          : answerOptionD // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKey: freezed == answerKey
          ? _value.answerKey
          : answerKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredKey: freezed == answeredKey
          ? _value.answeredKey
          : answeredKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  _$QuestionImpl(
      {@JsonIntConverter() this.id,
      @JsonKey(name: 'question_id') this.questionId,
      this.shuffle,
      this.question,
      @JsonKey(name: 'answer_option_a') this.answerOptionA,
      @JsonKey(name: 'answer_option_b') this.answerOptionB,
      @JsonKey(name: 'answer_option_c') this.answerOptionC,
      @JsonKey(name: 'answer_option_d') this.answerOptionD,
      @JsonKey(name: 'answer_key') this.answerKey,
      @JsonKey(name: 'answered_key') this.answeredKey});

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  @JsonIntConverter()
  final int? id;
  @override
  @JsonKey(name: 'question_id')
  final String? questionId;
  @override
  final String? shuffle;
  @override
  final String? question;
  @override
  @JsonKey(name: 'answer_option_a')
  final String? answerOptionA;
  @override
  @JsonKey(name: 'answer_option_b')
  final String? answerOptionB;
  @override
  @JsonKey(name: 'answer_option_c')
  final String? answerOptionC;
  @override
  @JsonKey(name: 'answer_option_d')
  final String? answerOptionD;
  @override
  @JsonKey(name: 'answer_key')
  final String? answerKey;
  @override
  @JsonKey(name: 'answered_key')
  final String? answeredKey;

  @override
  String toString() {
    return 'Question(id: $id, questionId: $questionId, shuffle: $shuffle, question: $question, answerOptionA: $answerOptionA, answerOptionB: $answerOptionB, answerOptionC: $answerOptionC, answerOptionD: $answerOptionD, answerKey: $answerKey, answeredKey: $answeredKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.shuffle, shuffle) || other.shuffle == shuffle) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answerOptionA, answerOptionA) ||
                other.answerOptionA == answerOptionA) &&
            (identical(other.answerOptionB, answerOptionB) ||
                other.answerOptionB == answerOptionB) &&
            (identical(other.answerOptionC, answerOptionC) ||
                other.answerOptionC == answerOptionC) &&
            (identical(other.answerOptionD, answerOptionD) ||
                other.answerOptionD == answerOptionD) &&
            (identical(other.answerKey, answerKey) ||
                other.answerKey == answerKey) &&
            (identical(other.answeredKey, answeredKey) ||
                other.answeredKey == answeredKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionId,
      shuffle,
      question,
      answerOptionA,
      answerOptionB,
      answerOptionC,
      answerOptionD,
      answerKey,
      answeredKey);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  factory _Question(
          {@JsonIntConverter() final int? id,
          @JsonKey(name: 'question_id') final String? questionId,
          final String? shuffle,
          final String? question,
          @JsonKey(name: 'answer_option_a') final String? answerOptionA,
          @JsonKey(name: 'answer_option_b') final String? answerOptionB,
          @JsonKey(name: 'answer_option_c') final String? answerOptionC,
          @JsonKey(name: 'answer_option_d') final String? answerOptionD,
          @JsonKey(name: 'answer_key') final String? answerKey,
          @JsonKey(name: 'answered_key') final String? answeredKey}) =
      _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  @JsonIntConverter()
  int? get id;
  @override
  @JsonKey(name: 'question_id')
  String? get questionId;
  @override
  String? get shuffle;
  @override
  String? get question;
  @override
  @JsonKey(name: 'answer_option_a')
  String? get answerOptionA;
  @override
  @JsonKey(name: 'answer_option_b')
  String? get answerOptionB;
  @override
  @JsonKey(name: 'answer_option_c')
  String? get answerOptionC;
  @override
  @JsonKey(name: 'answer_option_d')
  String? get answerOptionD;
  @override
  @JsonKey(name: 'answer_key')
  String? get answerKey;
  @override
  @JsonKey(name: 'answered_key')
  String? get answeredKey;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
