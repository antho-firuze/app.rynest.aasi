import 'package:app.rynest.aasi/common/controller/network_ctrl.dart';
import 'package:app.rynest.aasi/common/services/dialog_service.dart';
import 'package:app.rynest.aasi/common/views/overlay_container.dart';
import 'package:app.rynest.aasi/common/widgets/custom_dialog.dart';
import 'package:app.rynest.aasi/common/widgets/forms/field_list.dart';
import 'package:app.rynest.aasi/common/widgets/forms/ordered_list.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerWidget {
  const ConnectivityWrapper({
    super.key,
    this.enabled = true,
    this.caption = 'Perangkat anda tidak terhubung ke internet !',
    this.child,
  });

  final bool enabled;
  final String caption;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(isConnectedProvider) == false;

    if (!enabled) {
      isShowOverlay = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          child ?? const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  return DialogService(
                    title: Text('Informasi'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text('Kenapa perangkat saya tidak terhubung dengan internet?'),
                        OrderedList(
                          title: Text('Silahkan cek beberapa hal berikut ini :'),
                          children: [
                            Text('Pastikan perangkat anda tidak dalam mode pesawat.'),
                            Text('Pastikan anda terhubung dengan WiFi (Access Point) yang memiliki akses internet.'),
                            Text('Pastikan paket data anda, kuota dan masa berlakunya masih aktif.'),
                            Text('Pastikan sinyal WiFi atau sinyal provider bagus (diatas 2 bar).'),
                          ],
                        ),
                      ],
                    ),
                  ).showOk();
                },
                child: OverlayContainer(
                  isShowOverlay: isShowOverlay,
                  backgroundColor: oRed.withOpacity(.8),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wifi_off, color: oWhite),
                        Text(caption).clr(oWhite),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
