import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/countdown_timer.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/numeric_pad.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/appbar_mee.dart';
import 'otp_viewmodel.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            appBar: const AppBarMee(title: 'Konfirmasi OTP'),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Body(model: model),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.model,
  });

  final OtpViewModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Kode OTP telah dikirim ke ',
                      style: oStyle.clr(Colors.black87),
                      children: [
                        TextSpan(
                          text: '${model.otpEmail}',
                          style: oStyle.bold,
                        )
                      ],
                    ),
                  ),
                ),
                vSpaceXSmall,
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // ignore: prefer_is_empty
                      BuildCodeNumberBox(model.code.length > 0
                          ? model.code.substring(0, 1)
                          : ""),
                      BuildCodeNumberBox(model.code.length > 1
                          ? model.code.substring(1, 2)
                          : ""),
                      BuildCodeNumberBox(model.code.length > 2
                          ? model.code.substring(2, 3)
                          : ""),
                      BuildCodeNumberBox(model.code.length > 3
                          ? model.code.substring(3, 4)
                          : ""),
                    ],
                  ),
                ),
                vSpaceXSmall,
                model.hasTimerStopped
                    ? RichText(
                        text: TextSpan(
                          text: 'Tidak menerima Kode ? ',
                          style: oStyle.clr(Colors.black87),
                          children: [
                            TextSpan(
                              text: 'Kirim ulang',
                              style: oStyle.bold,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async => await model.resendOTP(),
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          const Text('Kode ini akan kadaluarsa dalam'),
                          Container(
                            width: 60.0,
                            padding:
                                const EdgeInsets.only(top: 3.0, right: 4.0),
                            child: CountDownTimer(
                              secondsRemaining: 60,
                              whenTimeExpires: () {
                                model.hasTimerStopped = true;
                                model.notifyListeners();
                              },
                              countDownStyle: const TextStyle(
                                color: Color(0XFFf5a623),
                                fontSize: 17.0,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                vSpaceSmall,
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: SizedBox(
                //     height: 45,
                //     child: BusyButton(
                //         title: 'KONFIRMASI OTP !',
                //         onPressed: () async => await model.confirmOTP()),
                //   ),
                // ),
                // vSpaceXSmall,
              ],
            ),
          ),
          NumericPad(onNumberSelected: model.numberPress),
        ],
      ),
    );
  }
}

class BuildCodeNumberBox extends StatelessWidget {
  const BuildCodeNumberBox(
    this.codeNumber, {
    super.key,
  });

  final String codeNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF6F5FA),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25.0,
                  spreadRadius: 1,
                  offset: Offset(0.0, 0.75))
            ],
          ),
          child: Center(
            child: Text(
              codeNumber,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
