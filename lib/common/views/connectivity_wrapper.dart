import 'package:app.rynest.aasi/common/controller/network_controller.dart';
import 'package:app.rynest.aasi/common/views/overlay_container.dart';
import 'package:app.rynest.aasi/core/app_color.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityWrapper extends ConsumerWidget {
  const ConnectivityWrapper({
    super.key,
    this.enabled = true,
    this.caption = 'Koneksi internet anda terganggu !',
    this.child,
  });

  final bool enabled;
  final String caption;
  final Widget? child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isShowOverlay = ref.watch(isConnectedProvider) == false;

    if (!enabled) {
      return Container();
    }

    return Scaffold(
      body: Stack(
        children: [
          child ?? const SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OverlayContainer(
                isShowOverlay: isShowOverlay,
                backgroundColor: oRed.withOpacity(.8),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.wifi_off,
                        color: oWhite,
                      ),
                      10.width,
                      Text(caption).clr(oWhite),
                    ],
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
