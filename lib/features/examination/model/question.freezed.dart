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
  @JsonKey(name: 'question')
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_a')
  String? get optionA => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_b')
  String? get optionB => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_c')
  String? get optionC => throw _privateConstructorUsedError;
  @JsonKey(name: 'option_d')
  String? get optionD => throw _privateConstructorUsedError;
  @JsonKey(name: 'shuffle_option_a')
  String? get shuffleOptionA => throw _privateConstructorUsedError;
  @JsonKey(name: 'shuffle_option_b')
  String? get shuffleOptionB => throw _privateConstructorUsedError;
  @JsonKey(name: 'shuffle_option_c')
  String? get shuffleOptionC => throw _privateConstructorUsedError;
  @JsonKey(name: 'shuffle_option_d')
  String? get shuffleOptionD => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'option_a') String? optionA,
      @JsonKey(name: 'option_b') String? optionB,
      @JsonKey(name: 'option_c') String? optionC,
      @JsonKey(name: 'option_d') String? optionD,
      @JsonKey(name: 'shuffle_option_a') String? shuffleOptionA,
      @JsonKey(name: 'shuffle_option_b') String? shuffleOptionB,
      @JsonKey(name: 'shuffle_option_c') String? shuffleOptionC,
      @JsonKey(name: 'shuffle_option_d') String? shuffleOptionD,
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
    Object? question = freezed,
    Object? optionA = freezed,
    Object? optionB = freezed,
    Object? optionC = freezed,
    Object? optionD = freezed,
    Object? shuffleOptionA = freezed,
    Object? shuffleOptionB = freezed,
    Object? shuffleOptionC = freezed,
    Object? shuffleOptionD = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      optionA: freezed == optionA
          ? _value.optionA
          : optionA // ignore: cast_nullable_to_non_nullable
              as String?,
      optionB: freezed == optionB
          ? _value.optionB
          : optionB // ignore: cast_nullable_to_non_nullable
              as String?,
      optionC: freezed == optionC
          ? _value.optionC
          : optionC // ignore: cast_nullable_to_non_nullable
              as String?,
      optionD: freezed == optionD
          ? _value.optionD
          : optionD // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionA: freezed == shuffleOptionA
          ? _value.shuffleOptionA
          : shuffleOptionA // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionB: freezed == shuffleOptionB
          ? _value.shuffleOptionB
          : shuffleOptionB // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionC: freezed == shuffleOptionC
          ? _value.shuffleOptionC
          : shuffleOptionC // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionD: freezed == shuffleOptionD
          ? _value.shuffleOptionD
          : shuffleOptionD // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'question') String? question,
      @JsonKey(name: 'option_a') String? optionA,
      @JsonKey(name: 'option_b') String? optionB,
      @JsonKey(name: 'option_c') String? optionC,
      @JsonKey(name: 'option_d') String? optionD,
      @JsonKey(name: 'shuffle_option_a') String? shuffleOptionA,
      @JsonKey(name: 'shuffle_option_b') String? shuffleOptionB,
      @JsonKey(name: 'shuffle_option_c') String? shuffleOptionC,
      @JsonKey(name: 'shuffle_option_d') String? shuffleOptionD,
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
    Object? question = freezed,
    Object? optionA = freezed,
    Object? optionB = freezed,
    Object? optionC = freezed,
    Object? optionD = freezed,
    Object? shuffleOptionA = freezed,
    Object? shuffleOptionB = freezed,
    Object? shuffleOptionC = freezed,
    Object? shuffleOptionD = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
  }) {
    return _then(_$QuestionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      optionA: freezed == optionA
          ? _value.optionA
          : optionA // ignore: cast_nullable_to_non_nullable
              as String?,
      optionB: freezed == optionB
          ? _value.optionB
          : optionB // ignore: cast_nullable_to_non_nullable
              as String?,
      optionC: freezed == optionC
          ? _value.optionC
          : optionC // ignore: cast_nullable_to_non_nullable
              as String?,
      optionD: freezed == optionD
          ? _value.optionD
          : optionD // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionA: freezed == shuffleOptionA
          ? _value.shuffleOptionA
          : shuffleOptionA // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionB: freezed == shuffleOptionB
          ? _value.shuffleOptionB
          : shuffleOptionB // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionC: freezed == shuffleOptionC
          ? _value.shuffleOptionC
          : shuffleOptionC // ignore: cast_nullable_to_non_nullable
              as String?,
      shuffleOptionD: freezed == shuffleOptionD
          ? _value.shuffleOptionD
          : shuffleOptionD // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'question') this.question,
      @JsonKey(name: 'option_a') this.optionA,
      @JsonKey(name: 'option_b') this.optionB,
      @JsonKey(name: 'option_c') this.optionC,
      @JsonKey(name: 'option_d') this.optionD,
      @JsonKey(name: 'shuffle_option_a') this.shuffleOptionA,
      @JsonKey(name: 'shuffle_option_b') this.shuffleOptionB,
      @JsonKey(name: 'shuffle_option_c') this.shuffleOptionC,
      @JsonKey(name: 'shuffle_option_d') this.shuffleOptionD,
      @JsonKey(name: 'answer_key') this.answerKey,
      @JsonKey(name: 'answered_key') this.answeredKey});

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  @JsonIntConverter()
  final int? id;
  @override
  @JsonKey(name: 'question')
  final String? question;
  @override
  @JsonKey(name: 'option_a')
  final String? optionA;
  @override
  @JsonKey(name: 'option_b')
  final String? optionB;
  @override
  @JsonKey(name: 'option_c')
  final String? optionC;
  @override
  @JsonKey(name: 'option_d')
  final String? optionD;
  @override
  @JsonKey(name: 'shuffle_option_a')
  final String? shuffleOptionA;
  @override
  @JsonKey(name: 'shuffle_option_b')
  final String? shuffleOptionB;
  @override
  @JsonKey(name: 'shuffle_option_c')
  final String? shuffleOptionC;
  @override
  @JsonKey(name: 'shuffle_option_d')
  final String? shuffleOptionD;
  @override
  @JsonKey(name: 'answer_key')
  final String? answerKey;
  @override
  @JsonKey(name: 'answered_key')
  final String? answeredKey;

  @override
  String toString() {
    return 'Question(id: $id, question: $question, optionA: $optionA, optionB: $optionB, optionC: $optionC, optionD: $optionD, shuffleOptionA: $shuffleOptionA, shuffleOptionB: $shuffleOptionB, shuffleOptionC: $shuffleOptionC, shuffleOptionD: $shuffleOptionD, answerKey: $answerKey, answeredKey: $answeredKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.optionA, optionA) || other.optionA == optionA) &&
            (identical(other.optionB, optionB) || other.optionB == optionB) &&
            (identical(other.optionC, optionC) || other.optionC == optionC) &&
            (identical(other.optionD, optionD) || other.optionD == optionD) &&
            (identical(other.shuffleOptionA, shuffleOptionA) ||
                other.shuffleOptionA == shuffleOptionA) &&
            (identical(other.shuffleOptionB, shuffleOptionB) ||
                other.shuffleOptionB == shuffleOptionB) &&
            (identical(other.shuffleOptionC, shuffleOptionC) ||
                other.shuffleOptionC == shuffleOptionC) &&
            (identical(other.shuffleOptionD, shuffleOptionD) ||
                other.shuffleOptionD == shuffleOptionD) &&
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
      question,
      optionA,
      optionB,
      optionC,
      optionD,
      shuffleOptionA,
      shuffleOptionB,
      shuffleOptionC,
      shuffleOptionD,
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
          @JsonKey(name: 'question') final String? question,
          @JsonKey(name: 'option_a') final String? optionA,
          @JsonKey(name: 'option_b') final String? optionB,
          @JsonKey(name: 'option_c') final String? optionC,
          @JsonKey(name: 'option_d') final String? optionD,
          @JsonKey(name: 'shuffle_option_a') final String? shuffleOptionA,
          @JsonKey(name: 'shuffle_option_b') final String? shuffleOptionB,
          @JsonKey(name: 'shuffle_option_c') final String? shuffleOptionC,
          @JsonKey(name: 'shuffle_option_d') final String? shuffleOptionD,
          @JsonKey(name: 'answer_key') final String? answerKey,
          @JsonKey(name: 'answered_key') final String? answeredKey}) =
      _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  @JsonIntConverter()
  int? get id;
  @override
  @JsonKey(name: 'question')
  String? get question;
  @override
  @JsonKey(name: 'option_a')
  String? get optionA;
  @override
  @JsonKey(name: 'option_b')
  String? get optionB;
  @override
  @JsonKey(name: 'option_c')
  String? get optionC;
  @override
  @JsonKey(name: 'option_d')
  String? get optionD;
  @override
  @JsonKey(name: 'shuffle_option_a')
  String? get shuffleOptionA;
  @override
  @JsonKey(name: 'shuffle_option_b')
  String? get shuffleOptionB;
  @override
  @JsonKey(name: 'shuffle_option_c')
  String? get shuffleOptionC;
  @override
  @JsonKey(name: 'shuffle_option_d')
  String? get shuffleOptionD;
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
