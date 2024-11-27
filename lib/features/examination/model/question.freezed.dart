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
  int? get id => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_a')
  String? get answerOptionA => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_b')
  String? get answerOptionB => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_c')
  String? get answerOptionC => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_d')
  String? get answerOptionD => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer_option_e')
  String? get answerOptionE => throw _privateConstructorUsedError;
  String? get answerKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'answered_key')
  String? get answeredKey => throw _privateConstructorUsedError;
  List<QuestionOption>? get options => throw _privateConstructorUsedError;

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
      {int? id,
      String? question,
      @JsonKey(name: 'answer_option_a') String? answerOptionA,
      @JsonKey(name: 'answer_option_b') String? answerOptionB,
      @JsonKey(name: 'answer_option_c') String? answerOptionC,
      @JsonKey(name: 'answer_option_d') String? answerOptionD,
      @JsonKey(name: 'answer_option_e') String? answerOptionE,
      String? answerKey,
      @JsonKey(name: 'answered_key') String? answeredKey,
      List<QuestionOption>? options});
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
    Object? answerOptionA = freezed,
    Object? answerOptionB = freezed,
    Object? answerOptionC = freezed,
    Object? answerOptionD = freezed,
    Object? answerOptionE = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
    Object? options = freezed,
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
      answerOptionE: freezed == answerOptionE
          ? _value.answerOptionE
          : answerOptionE // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKey: freezed == answerKey
          ? _value.answerKey
          : answerKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredKey: freezed == answeredKey
          ? _value.answeredKey
          : answeredKey // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>?,
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
      {int? id,
      String? question,
      @JsonKey(name: 'answer_option_a') String? answerOptionA,
      @JsonKey(name: 'answer_option_b') String? answerOptionB,
      @JsonKey(name: 'answer_option_c') String? answerOptionC,
      @JsonKey(name: 'answer_option_d') String? answerOptionD,
      @JsonKey(name: 'answer_option_e') String? answerOptionE,
      String? answerKey,
      @JsonKey(name: 'answered_key') String? answeredKey,
      List<QuestionOption>? options});
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
    Object? answerOptionA = freezed,
    Object? answerOptionB = freezed,
    Object? answerOptionC = freezed,
    Object? answerOptionD = freezed,
    Object? answerOptionE = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
    Object? options = freezed,
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
      answerOptionE: freezed == answerOptionE
          ? _value.answerOptionE
          : answerOptionE // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKey: freezed == answerKey
          ? _value.answerKey
          : answerKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredKey: freezed == answeredKey
          ? _value.answeredKey
          : answeredKey // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionImpl implements _Question {
  _$QuestionImpl(
      {this.id,
      this.question,
      @JsonKey(name: 'answer_option_a') this.answerOptionA,
      @JsonKey(name: 'answer_option_b') this.answerOptionB,
      @JsonKey(name: 'answer_option_c') this.answerOptionC,
      @JsonKey(name: 'answer_option_d') this.answerOptionD,
      @JsonKey(name: 'answer_option_e') this.answerOptionE,
      this.answerKey,
      @JsonKey(name: 'answered_key') this.answeredKey,
      final List<QuestionOption>? options})
      : _options = options;

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final int? id;
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
  @JsonKey(name: 'answer_option_e')
  final String? answerOptionE;
  @override
  final String? answerKey;
  @override
  @JsonKey(name: 'answered_key')
  final String? answeredKey;
  final List<QuestionOption>? _options;
  @override
  List<QuestionOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Question(id: $id, question: $question, answerOptionA: $answerOptionA, answerOptionB: $answerOptionB, answerOptionC: $answerOptionC, answerOptionD: $answerOptionD, answerOptionE: $answerOptionE, answerKey: $answerKey, answeredKey: $answeredKey, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.answerOptionE, answerOptionE) ||
                other.answerOptionE == answerOptionE) &&
            (identical(other.answerKey, answerKey) ||
                other.answerKey == answerKey) &&
            (identical(other.answeredKey, answeredKey) ||
                other.answeredKey == answeredKey) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      answerOptionA,
      answerOptionB,
      answerOptionC,
      answerOptionD,
      answerOptionE,
      answerKey,
      answeredKey,
      const DeepCollectionEquality().hash(_options));

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
      {final int? id,
      final String? question,
      @JsonKey(name: 'answer_option_a') final String? answerOptionA,
      @JsonKey(name: 'answer_option_b') final String? answerOptionB,
      @JsonKey(name: 'answer_option_c') final String? answerOptionC,
      @JsonKey(name: 'answer_option_d') final String? answerOptionD,
      @JsonKey(name: 'answer_option_e') final String? answerOptionE,
      final String? answerKey,
      @JsonKey(name: 'answered_key') final String? answeredKey,
      final List<QuestionOption>? options}) = _$QuestionImpl;

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  int? get id;
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
  @JsonKey(name: 'answer_option_e')
  String? get answerOptionE;
  @override
  String? get answerKey;
  @override
  @JsonKey(name: 'answered_key')
  String? get answeredKey;
  @override
  List<QuestionOption>? get options;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuestionOption _$QuestionOptionFromJson(Map<String, dynamic> json) {
  return _QuestionOption.fromJson(json);
}

/// @nodoc
mixin _$QuestionOption {
  int? get questionId => throw _privateConstructorUsedError;
  String? get optionKey => throw _privateConstructorUsedError;
  String? get answerKey => throw _privateConstructorUsedError;
  String? get answeredKey => throw _privateConstructorUsedError;
  String? get textOption => throw _privateConstructorUsedError;

  /// Serializes this QuestionOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionOptionCopyWith<QuestionOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionOptionCopyWith<$Res> {
  factory $QuestionOptionCopyWith(
          QuestionOption value, $Res Function(QuestionOption) then) =
      _$QuestionOptionCopyWithImpl<$Res, QuestionOption>;
  @useResult
  $Res call(
      {int? questionId,
      String? optionKey,
      String? answerKey,
      String? answeredKey,
      String? textOption});
}

/// @nodoc
class _$QuestionOptionCopyWithImpl<$Res, $Val extends QuestionOption>
    implements $QuestionOptionCopyWith<$Res> {
  _$QuestionOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? optionKey = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
    Object? textOption = freezed,
  }) {
    return _then(_value.copyWith(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      optionKey: freezed == optionKey
          ? _value.optionKey
          : optionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKey: freezed == answerKey
          ? _value.answerKey
          : answerKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredKey: freezed == answeredKey
          ? _value.answeredKey
          : answeredKey // ignore: cast_nullable_to_non_nullable
              as String?,
      textOption: freezed == textOption
          ? _value.textOption
          : textOption // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionOptionImplCopyWith<$Res>
    implements $QuestionOptionCopyWith<$Res> {
  factory _$$QuestionOptionImplCopyWith(_$QuestionOptionImpl value,
          $Res Function(_$QuestionOptionImpl) then) =
      __$$QuestionOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? questionId,
      String? optionKey,
      String? answerKey,
      String? answeredKey,
      String? textOption});
}

/// @nodoc
class __$$QuestionOptionImplCopyWithImpl<$Res>
    extends _$QuestionOptionCopyWithImpl<$Res, _$QuestionOptionImpl>
    implements _$$QuestionOptionImplCopyWith<$Res> {
  __$$QuestionOptionImplCopyWithImpl(
      _$QuestionOptionImpl _value, $Res Function(_$QuestionOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = freezed,
    Object? optionKey = freezed,
    Object? answerKey = freezed,
    Object? answeredKey = freezed,
    Object? textOption = freezed,
  }) {
    return _then(_$QuestionOptionImpl(
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int?,
      optionKey: freezed == optionKey
          ? _value.optionKey
          : optionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answerKey: freezed == answerKey
          ? _value.answerKey
          : answerKey // ignore: cast_nullable_to_non_nullable
              as String?,
      answeredKey: freezed == answeredKey
          ? _value.answeredKey
          : answeredKey // ignore: cast_nullable_to_non_nullable
              as String?,
      textOption: freezed == textOption
          ? _value.textOption
          : textOption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionOptionImpl implements _QuestionOption {
  _$QuestionOptionImpl(
      {this.questionId,
      this.optionKey,
      this.answerKey,
      this.answeredKey,
      this.textOption});

  factory _$QuestionOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionOptionImplFromJson(json);

  @override
  final int? questionId;
  @override
  final String? optionKey;
  @override
  final String? answerKey;
  @override
  final String? answeredKey;
  @override
  final String? textOption;

  @override
  String toString() {
    return 'QuestionOption(questionId: $questionId, optionKey: $optionKey, answerKey: $answerKey, answeredKey: $answeredKey, textOption: $textOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionOptionImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.optionKey, optionKey) ||
                other.optionKey == optionKey) &&
            (identical(other.answerKey, answerKey) ||
                other.answerKey == answerKey) &&
            (identical(other.answeredKey, answeredKey) ||
                other.answeredKey == answeredKey) &&
            (identical(other.textOption, textOption) ||
                other.textOption == textOption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, optionKey, answerKey, answeredKey, textOption);

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionOptionImplCopyWith<_$QuestionOptionImpl> get copyWith =>
      __$$QuestionOptionImplCopyWithImpl<_$QuestionOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionOptionImplToJson(
      this,
    );
  }
}

abstract class _QuestionOption implements QuestionOption {
  factory _QuestionOption(
      {final int? questionId,
      final String? optionKey,
      final String? answerKey,
      final String? answeredKey,
      final String? textOption}) = _$QuestionOptionImpl;

  factory _QuestionOption.fromJson(Map<String, dynamic> json) =
      _$QuestionOptionImpl.fromJson;

  @override
  int? get questionId;
  @override
  String? get optionKey;
  @override
  String? get answerKey;
  @override
  String? get answeredKey;
  @override
  String? get textOption;

  /// Create a copy of QuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionOptionImplCopyWith<_$QuestionOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
