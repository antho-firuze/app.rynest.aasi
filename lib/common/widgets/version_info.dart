import 'package:app.rynest.aasi/common/controller/version_ctrl.dart';
import 'package:app.rynest.aasi/common/widgets/skelton.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VersionInfo extends ConsumerWidget {
  const VersionInfo({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchVersionProvider).when(
          loading: () => const Skelton(),
          error: (Object error, StackTrace stackTrace) => Container(),
          data: (String data) => Text('Version $data').tsTitleM().clr(color).center(),
        );
  }
}
