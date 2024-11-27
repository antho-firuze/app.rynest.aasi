import 'package:app.rynest.aasi/common/widgets/logo/logo_art_work.dart';
import 'package:app.rynest.aasi/ui/shared/colors.dart';
import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/setting/setting_viewmodel.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/list_menu.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/list_switch.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/show_bottom_slide.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/text_field_mee.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

import '../../../helpers/F.dart';
import '../../shared/appbar_mee.dart';
import '../../shared/widgets/logos.dart';

class SettingView extends StatelessWidget {
  final bool showBack;
  const SettingView({super.key, this.showBack = false});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingViewModel>.reactive(
      viewModelBuilder: () => SettingViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgDDecoration,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: Scaffold(
            appBar: AppBarMee(
              title: 'Pengaturan',
              titleColor: kcPrimaryColor,
              showBack: true,
              forBottomNavigationBar: !showBack,
              backgroundColor: Colors.transparent,
              // onBackPressed:
              //     showBack ? () => Navigator.of(context).pop(false) : null,
            ),
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Center(
                  child: LogoArtWork(
                    color: kcPrimaryColor,
                    width: screenWidth(context),
                  ),
                ),
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

  final SettingViewModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            vSpaceSmall,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListMenu(
                    text: 'Ukuran Huruf',
                    iconData: Icons.font_download,
                    onPressed: () => showBottomSlide(
                      context: context,
                      title: 'Ukuran Huruf',
                      maxSize: 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ...List.generate(
                            model.fontSizes.length,
                            (index) => RadioListTile<int>(
                              dense: true,
                              title: Text(
                                model.fontSizes[index]['text'],
                                style: bodyStyle(context).copyWith(
                                  fontSize: F.toDouble(
                                      model.fontSizes[index]['value']),
                                ),
                              ),
                              value: model.fontSizes[index]['value'],
                              groupValue: model.fontSize,
                              onChanged: (value) {
                                model.fontSizeOnChanged(value!);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  vSpaceSmall,
                  ListSwitch(
                    text: 'Otomatis pindah pertanyaan',
                    iconData: Icons.question_answer,
                    value: model.autoNextQuestion,
                    onChanged: (val) async =>
                        await model.autoNextQuestionChanged(val),
                  ),
                  vSpaceSmall,
                  ListMenu(
                    text: 'Informasi Perangkat',
                    iconData: FontAwesomeIcons.mobileRetro,
                    onPressed: () => showBottomSlide(
                      context: context,
                      title: 'Informasi Perangkat',
                      maxSize: 0.45,
                      movable: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            vSpaceXSmall,
                            Text(
                              'Apps',
                              style: captionStyle(context),
                            ),
                            divider(),
                            vSpaceXSmall,
                            Column(
                              children: model.appInfo!.keys
                                  .map(
                                    (String property) => TextFieldMee(
                                      caption: property,
                                      value: '${model.appInfo![property]}',
                                    ),
                                  )
                                  .toList(),
                            ),
                            // vSpaceXSmall,
                            // TextFieldMee(
                            //   caption: 'IP Address',
                            //   value: '${model.ipAddress}',
                            // ),
                            vSpaceSmall,
                            Text(
                              'Perangkat',
                              style: captionStyle(context),
                            ),
                            divider(),
                            vSpaceXSmall,
                            Column(
                              children: model.deviceInfo!.keys
                                  .map(
                                    (String property) => TextFieldMee(
                                      caption: property,
                                      value: '${model.deviceInfo![property]}',
                                    ),
                                  )
                                  .toList(),
                            ),
                            vSpaceXSmall,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
