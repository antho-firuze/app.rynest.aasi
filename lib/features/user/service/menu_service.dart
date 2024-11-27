// ignore_for_file: invalid_annotation_target

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_service.g.dart';

@JsonLiteral('../repository/app_menus.json', asConst: true)
const appMenus = _$appMenusJsonLiteral;

class MenuService {
  Ref ref;
  MenuService(this.ref);

  List<Map<String, Object>> getAppMenus() => appMenus;
}

final menuServiceProvider = Provider(MenuService.new);
