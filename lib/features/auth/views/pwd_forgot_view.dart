import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_input.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_app.dart';
import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
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
                    Text('Masukkan email yang terkait dengan akun Anda !'.hardcoded).tsBodyM(),
                    20.height,
                    CustomInput(
                      onChanged: (val) => ref.read(textEmailProvider.notifier).state = val,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                      validator: (p0) => p0!.isEmpty ? 'Kolom email harap di isi'.hardcoded : null,
                    ),
                    20.height,
                    CustomButton(
                      // busy: state.isLoading,
                      width: double.infinity,
                      child: Text('Kirim Kode Verifikasi!'.hardcoded),
                      onPressed: () async {
                        if (formStateKey.currentState!.validate() == false) {
                          return;
                        }

                        ref.read(authCtrlProvider).sendCode();

                        // var result = await context.push('/code_verify');
                        // if (result == true) {
                        //   // ignore: use_build_context_synchronously
                        //   context.pop(true);
                        // }
                      },
                    ),
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
