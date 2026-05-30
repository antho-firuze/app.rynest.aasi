import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_input.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/auth/views/widgets/code_verify.dart';
import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PwdForgotView extends ConsumerWidget {
  const PwdForgotView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();

    if (ref.watch(verifyCodeProvider).isNotEmpty) {
      return CodeVerify();
    }

    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Lupa Kode Sandi'.hardcoded)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formStateKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LogoArtWork(child: LogoApp()),
                    10.height,
                    Text('Masukkan email yang terkait dengan akun Anda, berikut sandi baru yang anda kehendaki !'
                            .hardcoded)
                        .tsBodyM()
                        .center(),
                    20.height,
                    CustomInput(
                      onChanged: (val) => ref.read(textEmailProvider.notifier).state = val,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (p0) => p0!.isEmpty ? 'Kolom email harap di isi'.hardcoded : null,
                    ),
                    20.height,
                    CustomInput(
                      onChanged: (val) => ref.read(textPasswordProvider.notifier).state = val,
                      hintText: 'Sandi Baru'.hardcoded,
                      isPassword: true,
                      validator: (p0) => p0!.isEmpty ? 'Kolom sandi harap di isi'.hardcoded : null,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    20.height,
                    CustomInput(
                      onChanged: (val) => ref.read(textPasswordConfirmProvider.notifier).state = val,
                      hintText: 'Ulangi Sandi Baru'.hardcoded,
                      isPassword: true,
                      validator: (p0) => p0!.isEmpty
                          ? 'Kolom sandi harap di isi'.hardcoded
                          : p0 != ref.read(textPasswordProvider)
                              ? "Konfirmasi harus sama dengan Sandi Baru"
                              : null,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    20.height,
                    Center(
                      child: CustomButton(
                        // busy: state.isLoading,
                        width: double.infinity,
                        child: Text('Kirim Kode Verifikasi!'.hardcoded),
                        onPressed: () async {
                          if (formStateKey.currentState!.validate() == false) {
                            return;
                          }

                          await ref.read(authCtrlProvider).sendForgotCode();

                          // var result = await context.push('/code_verify');
                          // if (result == true) {
                          //   // ignore: use_build_context_synchronously
                          //   context.pop(true);
                          // }
                        },
                      ),
                    ),
                    60.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
