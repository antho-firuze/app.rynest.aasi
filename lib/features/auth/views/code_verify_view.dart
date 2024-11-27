import 'package:app.rynest.aasi/common/services/snackbar_service.dart';
import 'package:app.rynest.aasi/common/widgets/countdown_timer.dart';
import 'package:app.rynest.aasi/common/widgets/custom_rich_text.dart';
import 'package:app.rynest.aasi/common/widgets/forms/otp_fields.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CodeVerifyView extends ConsumerWidget {
  const CodeVerifyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCountdownExpired = ref.watch(isCountdownExpiredProvider);

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Verifikasi Kode'.hardcoded)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      10.height,
                      Text('Kode verifikasi telah dikirim'.hardcoded).tsBodyL(),
                      20.height,
                      Text('Silahkan masukkan kode verifikasi yang telah anda terima'.hardcoded).tsBodyM().center(),
                      15.height,
                    ],
                  ),
                ),
                // OTP Fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: OTPFields(
                    length: 6,
                    onCompleted: (pin) async {
                      debugPrint(pin);
                      if (pin!.length >= 6) {
                        if (pin == ref.read(verifyCodeProvider)) {
                          return context.pop(true);
                        }

                        SnackBarService.show(message: 'Kode yang anda masukkan salah !'.hardcoded);
                      }
                    },
                  ),
                ),
                20.height,
                20.height,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isCountdownExpired == false) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Kode akan kadaluarsa dalam '.hardcoded).tsBodyM(),
                            CountDownTimer(
                              secondsRemaining: ref.read(countdownTimerProvider),
                              countDownStyle: tsBodyM(),
                              whenTimeExpires: () => ref.read(isCountdownExpiredProvider.notifier).state = true,
                            ),
                          ],
                        ),
                        20.height,
                      ],
                      CustomRichText(
                        text: TextSpan(
                          text: 'Tidak terima kode verifikasi? '.hardcoded,
                          style: tsBodyM(),
                          children: [
                            TextSpan(
                              text: 'Kirim ulang !',
                              style: tsBodyM().link(),
                              recognizer: TapGestureRecognizer()
                                ..onTapDown = (details) async => await ref.read(authCtrlProvider).resendCode(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
