// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_menu.freezed.dart';
part 'app_menu.g.dart';

@freezed
class AppMenu with _$AppMenu {
  factory AppMenu({
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String title,
    @JsonKey(name: 'desc') String? tooltip,
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
    @JsonKey(name: 'is_show') @Default(true) bool isShow,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
  }) = _AppMenu;

  factory AppMenu.fromJson(Map<String, dynamic> json) => _$AppMenuFromJson(json);
}
