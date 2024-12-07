import 'package:app.rynest.aasi/common/widgets/button/custom_button.dart';
import 'package:app.rynest.aasi/common/widgets/custom_checkbox.dart';
import 'package:app.rynest.aasi/common/widgets/custom_input.dart';
import 'package:app.rynest.aasi/common/widgets/custom_rich_text.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/features/auth/views/pwd_forgot_view.dart';
import 'package:app.rynest.aasi/localization/string_hardcoded.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/logos.dart';
import 'package:app.rynest.aasi/utils/my_ui.dart';
import 'package:app.rynest.aasi/utils/page_utils.dart';
import 'package:app.rynest.aasi/utils/ui_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final formStateKey = GlobalKey<FormState>();

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  static const routeName = '/signin';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyUI(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: LogoSignature2(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -14,
                          left: 7,
                          child: SizedBox(
                            width: context.screenWidth - 14,
                            height: 50,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0x70FFFFFF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              40.height,
                              Align(
                                child: Column(
                                  children: [
                                    Text("Selamat Datang !".hardcoded).tsHeadlineL(),
                                    10.height,
                                    const Text("Silahkan Login untuk masuk ke akun anda").tsBodyL(),
                                  ],
                                ),
                              ),
                              40.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Form(
                                  key: formStateKey,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: <Widget>[
                                      CustomInput(
                                        initialValue: ref.read(textIdentifierProvider),
                                        onChanged: (val) => ref.read(textIdentifierProvider.notifier).state = val,
                                        hintText: 'Email/Phone/Username',
                                        keyboardType: TextInputType.emailAddress,
                                        prefixIcon: const Icon(Icons.email_outlined),
                                        validator: (p0) => p0!.isEmpty ? 'Kolom email harap di isi'.hardcoded : null,
                                      ),
                                      20.height,
                                      CustomInput(
                                        initialValue: ref.read(textPasswordProvider),
                                        onChanged: (val) => ref.read(textPasswordProvider.notifier).state = val,
                                        hintText: 'Sandi'.hardcoded,
                                        isPassword: true,
                                        validator: (p0) => p0!.isEmpty ? 'Kolom sandi harap di isi'.hardcoded : null,
                                        prefixIcon: const Icon(Icons.lock_outline),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              10.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: CustomCheckBox(
                                        caption: const Text('Ingatkan saya').link(),
                                        value: ref.watch(isRememberProvider),
                                        onChanged: (p0) =>
                                            ref.read(isRememberProvider.notifier).state = !ref.read(isRememberProvider),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // const result = true;
                                        final result = await context.goto(page: const PwdForgotView());
                                        if (result == true && context.mounted) {
                                          context.pop();
                                        }
                                      },
                                      child: const Text('Lupa sandi ?').tsBodyM().link(),
                                    ),
                                  ],
                                ),
                              ),
                              40.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: CustomButton(
                                  width: double.infinity,
                                  child: Text('Mari masuk'.hardcoded),
                                  onPressed: () async {
                                    if (formStateKey.currentState!.validate() == false) {
                                      return;
                                    }

                                    bool result = await ref.read(authCtrlProvider).signIn();
                                    if (result == true && context.mounted) {
                                      context.pop(true);
                                    }
                                  },
                                ),
                              ),
                              40.height,
                              CustomRichText(
                                text: TextSpan(
                                  text: 'Belum punya akun? '.hardcoded,
                                  style: tsBodyM(),
                                  children: [
                                    TextSpan(
                                      text: 'Cek disini !'.hardcoded,
                                      style: tsBodyM().link(),
                                      recognizer: TapGestureRecognizer()
                                        ..onTapDown = (details) async {
                                          bool result = await showModalBottomSheet(
                                            context: context,
                                            shape: const BeveledRectangleBorder(),
                                            builder: (context) => MyUI(
                                              isTransparent: true,
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    10.height,
                                                    const Text('Cara & Syarat Registrasi').tsTitleM().bold(),
                                                    30.height,
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                                      child: Column(
                                                        children: [
                                                          const Text(
                                                              "• Anda harus terdaftar sebagai Agen pada Perusahaan Asuransi Syariah."),
                                                          10.height,
                                                          const Text(
                                                              "• Melakukan pendaftaran sebagai Agen Asuransi Syariah pada Perusahaan Asuransi Syariah."),
                                                          10.height,
                                                          const Text(
                                                              "• Username dan Password akan dikirimkan kepada masing-masing user."),
                                                        ],
                                                      ),
                                                    ),
                                                    30.height,
                                                    const Text(
                                                        "Untuk informasi lebih lanjut anda bisa hubungi CS kami."),
                                                    20.height,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );

                                          if (result == true) {
                                            if (context.mounted) context.pop();
                                          }
                                          // var result = await context.goto(page: const SignupView());
                                          // if (result == true && context.mounted) {
                                          //   context.pop();
                                          // }
                                        },
                                    )
                                  ],
                                ),
                              ),
                              60.height,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
