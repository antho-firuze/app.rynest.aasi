import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/photos/photo_card_viewmodel.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/button_mee.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/appbar_mee.dart';
import '../../shared/colors.dart';
import '../../shared/widgets/logos.dart';
import 'widgets/image_card.dart';

class PhotoCardView extends StatelessWidget {
  const PhotoCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotoCardViewModel>.reactive(
      viewModelBuilder: () => PhotoCardViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgBDecoration,
        child: Scaffold(
          appBar: const AppBarMee(
            title: 'Foto KTP',
            titleColor: kcPrimaryColor,
            backgroundColor: Colors.transparent,
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async => await model.refresh(),
                child: Body(model: model),
              ),
            ],
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

  final PhotoCardViewModel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const LogoSignature(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: screenProp(context, s: 250, m: 250, l: 550),
            child: ImageCard(
              image: model.photo,
            ),
          ),
        ),
        vSpaceSmall,
        ButtonMee(
          title: [null, ''].contains(model.profile?.photoIdCard)
              ? 'Ambil Foto KTP'
              : 'Update Foto KTP',
          onPressed: () async => await model.getPicture(),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 100),
        //   child: ButtonMee(
        //     title: [null, ''].contains(model.profile?.photoIdCard)
        //         ? 'Ambil Foto KTP'
        //         : 'Update Foto KTP',
        //     onPressed: () async => await model.getPicture(),
        //   ),
        // ),
      ],
    );
  }
}
