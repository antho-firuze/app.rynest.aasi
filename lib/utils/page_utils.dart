import 'package:app.rynest.aasi/utils/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension PageUtilContext on BuildContext {
  Future goto({required Widget page}) async => await Navigator.of(this, rootNavigator: true).push(CupertinoPageRoute(
        builder: (context) => page,
      ));

  void popz() => Navigator.of(this).pop();
}

class PageUtils {
  Ref ref;
  PageUtils(this.ref);

  Future goto({required Widget page}) async =>
      await Navigator.of(rootNavigatorKey.currentContext!, rootNavigator: true).push(CupertinoPageRoute(
        builder: (context) => page,
      ));

  // Future replace({required Widget page}) async => await Navigator.of(rootNavigatorKey.currentContext!)
  //     .pushAndRemoveUntil(MaterialPageRoute(builder: (_) => page), (route) => false);
  // await Navigator.of(rootNavigatorKey.currentContext!, rootNavigator: true).pushReplacement(CupertinoPageRoute(
  //   builder: (context) => page,
  // ));
}

final pageUtilsProvider = Provider(PageUtils.new);
