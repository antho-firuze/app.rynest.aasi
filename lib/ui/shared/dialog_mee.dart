import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui_helper.dart';

class DialogMee {
  static Future<void> show(
    String? message, {
    String? title,
    String? okTitle,
    Widget? messageW,
  }) async {
    await Get.defaultDialog(
      title: '',
      backgroundColor: Colors.transparent,
      onWillPop: () => Future.value(false),
      barrierDismissible: true,
      content: UIDialog(
        title: title ?? 'Informasi',
        message: message,
        messageW: messageW,
        okTitle: okTitle ?? 'OK',
      ),
    );
  }

  static Future<bool?> showRetry(
    String? message, {
    String? title,
    String? okTitle,
  }) async {
    bool? result;

    await Get.defaultDialog(
      title: '',
      backgroundColor: Colors.transparent,
      // onWillPop: () => Future.value(false),
      barrierDismissible: true,
      content: UIDialog(
        title: title ?? 'Informasi',
        message: message,
        // okTitle: okTitle ?? 'Coba Lagi',
        yesTitle: okTitle ?? 'Coba Lagi',
        noTitle: 'Tutup',
        isConfirmDialog: true,
        onResult: (p0) async => result = p0,
      ),
    );

    return result;
  }

  static Future<bool?> confirm(
    String? message, {
    String? title,
    String? yesTitle,
    String? noTitle,
  }) async {
    bool? result;

    await Get.defaultDialog(
      title: '',
      backgroundColor: Colors.transparent,
      // onWillPop: () => Future.value(false),
      barrierDismissible: true,
      content: UIDialog(
        title: title ?? 'Konfirmasi',
        message: message,
        yesTitle: yesTitle ?? 'Ya',
        noTitle: noTitle ?? 'Tidak',
        isConfirmDialog: true,
        onResult: (p0) async => result = p0,
      ),
    );

    return result;
  }
}

class UIDialog extends StatelessWidget {
  const UIDialog({
    super.key,
    this.title,
    this.message,
    this.okTitle,
    this.yesTitle,
    this.noTitle,
    this.isConfirmDialog = false,
    this.onResult,
    this.messageW,
  });

  final String? title;
  final String? message;
  final String? okTitle;
  final String? yesTitle;
  final String? noTitle;
  final bool? isConfirmDialog;
  final Function(bool)? onResult;
  final Widget? messageW;

  @override
  Widget build(BuildContext context) {
    bool isConfirmDialog = this.isConfirmDialog ?? false;
    var noButton = OutlinedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () {
        onResult!(false);
        if (Get.isDialogOpen!) Get.back();
      },
      child: Text(
        noTitle ?? 'Tidak',
        style: bodyStyle(context).copyWith(
          color: const Color(0x9DFF0000),
        ),
      ),
    );

    var yesButton = OutlinedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () {
        onResult!(true);
        if (Get.isDialogOpen!) Get.back();
      },
      child: Text(yesTitle ?? 'Ya', style: bodyStyle(context)),
    );

    var okButton = OutlinedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      onPressed: () {
        if (Get.isDialogOpen!) Get.back();
      },
      child: Text(okTitle ?? 'OK', style: bodyStyle(context)),
    );

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null && title!.isNotEmpty)
              Column(
                children: [
                  Text(
                    title ?? '',
                    style: captionStyle(context),
                  ),
                  vSpaceXSmall,
                ],
              ),
            messageW ?? const SizedBox(),
            if (message != null && message!.isNotEmpty)
              Column(
                children: [
                  Text(
                    message ?? '',
                    textAlign: TextAlign.center,
                    style: bodyStyle(context),
                  ),
                  vSpaceSmall,
                ],
              ),
            if (isConfirmDialog)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: noButton),
                  hSpace(5),
                  Expanded(child: yesButton),
                ],
              ),
            if (!isConfirmDialog)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: okButton),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
