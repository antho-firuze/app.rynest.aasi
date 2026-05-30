import 'package:app.rynest.aasi/common/exceptions/data_exeception_layout.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/user/controller/profile_ctrl.dart';
import 'package:app.rynest.aasi/features/user/views/widgets/back_card.dart';
import 'package:app.rynest.aasi/features/user/views/widgets/empty_card.dart';
import 'package:app.rynest.aasi/features/user/views/widgets/front_card.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CertificateView extends ConsumerWidget {
  const CertificateView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text("Kartu Lisensi")),
        body: RefreshIndicator(
          onRefresh: () async => await ref.refresh(fetchCertificateProvider),
          child: ListView(
            children: [
              10.height,
              const LogoArtWork(child: LogoApp()),
              10.height,
              ref.watch(fetchCertificateProvider).when(
                    skipLoadingOnRefresh: false,
                    data: (data) {
                      if (data == null) {
                        return Center(
                          child: SizedBox(
                            width: context.screenWidthRatio(.9, .65),
                            height: context.screenWidthRatio(.55, .4),
                            child: FlipCard(
                              front: EmptyCard(),
                              back: EmptyCard(),
                            ),
                          ),
                        );
                      }
                      // final certificate = data;
                      return Center(
                        child: SizedBox(
                          width: context.screenWidthRatio(.9, .65),
                          height: context.screenWidthRatio(.55, .4),
                          child: FlipCard(
                            front: const FrontCard(),
                            back: const BackCard(),
                          ),
                        ),
                      );
                    },
                    error: (error, stackTrace) => DataExceptionLayout(
                      error: error,
                      child: Container(),
                      onTap: () => ref.watch(fetchCertificateProvider),
                    ),
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}
