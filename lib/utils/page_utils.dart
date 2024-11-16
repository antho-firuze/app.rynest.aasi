import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension PageUtilContext on BuildContext {
  Future goto({required Widget page}) async => await Navigator.of(this, rootNavigator: true).push(CupertinoPageRoute(
        builder: (context) => page,
      ));

  void popz() => Navigator.of(this).pop();
}
