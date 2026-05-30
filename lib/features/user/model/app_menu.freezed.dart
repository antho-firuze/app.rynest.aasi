// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppMenu _$AppMenuFromJson(Map<String, dynamic> json) {
  return _AppMenu.fromJson(json);
}

/// @nodoc
mixin _$AppMenu {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'desc')
  String? get tooltip => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_show')
  bool get isShow => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_favorite')
  bool get isFavorite => throw _privateConstructorUsedError;

  /// Serializes this AppMenu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppMenuCopyWith<AppMenu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMenuCopyWith<$Res> {
  factory $AppMenuCopyWith(AppMenu value, $Res Function(AppMenu) then) =
      _$AppMenuCopyWithImpl<$Res, AppMenu>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String title,
      @JsonKey(name: 'desc') String? tooltip,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'is_show') bool isShow,
      @JsonKey(name: 'is_favorite') bool isFavorite});
}

/// @nodoc
class _$AppMenuCopyWithImpl<$Res, $Val extends AppMenu>
    implements $AppMenuCopyWith<$Res> {
  _$AppMenuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? tooltip = freezed,
    Object? isDefault = null,
    Object? isShow = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppMenuImplCopyWith<$Res> implements $AppMenuCopyWith<$Res> {
  factory _$$AppMenuImplCopyWith(
          _$AppMenuImpl value, $Res Function(_$AppMenuImpl) then) =
      __$$AppMenuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String title,
      @JsonKey(name: 'desc') String? tooltip,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'is_show') bool isShow,
      @JsonKey(name: 'is_favorite') bool isFavorite});
}

/// @nodoc
class __$$AppMenuImplCopyWithImpl<$Res>
    extends _$AppMenuCopyWithImpl<$Res, _$AppMenuImpl>
    implements _$$AppMenuImplCopyWith<$Res> {
  __$$AppMenuImplCopyWithImpl(
      _$AppMenuImpl _value, $Res Function(_$AppMenuImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? title = null,
    Object? tooltip = freezed,
    Object? isDefault = null,
    Object? isShow = null,
    Object? isFavorite = null,
  }) {
    return _then(_$AppMenuImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tooltip: freezed == tooltip
          ? _value.tooltip
          : tooltip // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppMenuImpl implements _AppMenu {
  _$AppMenuImpl(
      {@JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'name') this.title = '',
      @JsonKey(name: 'desc') this.tooltip,
      @JsonKey(name: 'is_default') this.isDefault = false,
      @JsonKey(name: 'is_show') this.isShow = true,
      @JsonKey(name: 'is_favorite') this.isFavorite = false});

  factory _$AppMenuImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppMenuImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'name')
  final String title;
  @override
  @JsonKey(name: 'desc')
  final String? tooltip;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'is_show')
  final bool isShow;
  @override
  @JsonKey(name: 'is_favorite')
  final bool isFavorite;

  @override
  String toString() {
    return 'AppMenu(code: $code, title: $title, tooltip: $tooltip, isDefault: $isDefault, isShow: $isShow, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppMenuImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, title, tooltip, isDefault, isShow, isFavorite);

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppMenuImplCopyWith<_$AppMenuImpl> get copyWith =>
      __$$AppMenuImplCopyWithImpl<_$AppMenuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppMenuImplToJson(
      this,
    );
  }
}

abstract class _AppMenu implements AppMenu {
  factory _AppMenu(
      {@JsonKey(name: 'code') final String code,
      @JsonKey(name: 'name') final String title,
      @JsonKey(name: 'desc') final String? tooltip,
      @JsonKey(name: 'is_default') final bool isDefault,
      @JsonKey(name: 'is_show') final bool isShow,
      @JsonKey(name: 'is_favorite') final bool isFavorite}) = _$AppMenuImpl;

  factory _AppMenu.fromJson(Map<String, dynamic> json) = _$AppMenuImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'name')
  String get title;
  @override
  @JsonKey(name: 'desc')
  String? get tooltip;
  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'is_show')
  bool get isShow;
  @override
  @JsonKey(name: 'is_favorite')
  bool get isFavorite;

  /// Create a copy of AppMenu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppMenuImplCopyWith<_$AppMenuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
