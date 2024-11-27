import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/utils/router.dart';
import 'package:flutter/cupertino.dart';

class AlertService {
  static Future<void> show({
    required String body,
    String title = 'Informasi',
    String? noCaption,
    String? okCaption,
    String? yesCaption,
    VoidCallback? onNo,
    VoidCallback? onOk,
    VoidCallback? onYes,
    bool showNo = false,
    bool showOk = false,
    bool showYes = false,
  }) async {
    showCupertinoModalPopup(
      context: rootNavigatorKey.currentContext!,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          if (showOk)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                if (onOk != null) onOk();
              },
              child: Text(okCaption ?? "Ok".hardcoded),
            ),
          if (showYes)
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                if (onYes != null) onYes();
              },
              child: Text(yesCaption ?? "Ya".hardcoded),
            ),
          if (showNo)
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
                if (onNo != null) onNo();
              },
              child: Text(noCaption ?? "Tidak".hardcoded),
            ),
        ],
      ),
    );
  }

  static Future<void> confirm({
    required String body,
    String title = 'Konfirmasi',
    String? noCaption,
    String? okCaption,
    String? yesCaption,
    VoidCallback? onNo,
    VoidCallback? onOk,
    VoidCallback? onYes,
    bool showNo = true,
    bool showOk = true,
    bool showYes = false,
  }) async {
    await AlertService.show(
      title: title,
      body: body,
      noCaption: noCaption,
      okCaption: okCaption,
      yesCaption: yesCaption,
      onNo: onNo,
      onOk: onOk,
      onYes: onYes,
      showNo: showNo,
      showOk: showOk,
      showYes: showYes,
    );
  }

  static Future<void> showOk({
    required String body,
    String title = 'Informasi',
    String? okCaption,
    VoidCallback? onOk,
  }) async {
    await AlertService.show(
      title: title,
      body: body,
      okCaption: okCaption,
      onOk: onOk,
      showOk: true,
    );
  }
}
