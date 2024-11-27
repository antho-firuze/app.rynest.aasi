import 'package:app.rynest.aasi/ui/shared/ui_helper.dart';
import 'package:app.rynest.aasi/ui/views/profile/profile_edit_viewmodel.dart';
import 'package:app.rynest.aasi/ui/shared/widgets/readonly_field_label.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:app.rynest.aasi/helpers/extensions.dart';

import '../../shared/appbar_mee.dart';
import '../../shared/colors.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileEditViewModel>.reactive(
      viewModelBuilder: () => ProfileEditViewModel(),
      builder: (context, model, child) => Container(
        decoration: bgADecoration,
        child: Scaffold(
          appBar: const AppBarMee(
            title: 'Profil Member',
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

  final ProfileEditViewModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          // const LogoSignature(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ReadOnlyFieldLabel(
                  'Perusahaan',
                  value: model.profile?.company?.name?.toUpperCase(),
                  icon: const Icon(Icons.business),
                ),
                ReadOnlyFieldLabel(
                  'Kode Agen',
                  value: model.profile?.memberId?.toUpperCase(),
                  icon: const Icon(Icons.assignment_ind),
                ),
                ReadOnlyFieldLabel(
                  'Nama Lengkap',
                  value: model.profile?.fullName?.toUpperCase(),
                  icon: const Icon(Icons.person),
                ),
                ReadOnlyFieldLabel(
                  'Email',
                  value: model.profile?.email?.toLowerCase(),
                  icon: const Icon(Icons.email),
                ),
                ReadOnlyFieldLabel(
                  'No Telpon',
                  value: model.profile?.phone,
                  icon: const Icon(Icons.phone_android),
                ),
                ReadOnlyFieldLabel(
                  'Tempat Lahir',
                  value: model.profile?.placeOfBirth?.toUpperCase(),
                  icon: const Icon(Icons.place),
                ),
                ReadOnlyFieldLabel(
                  'Tanggal Lahir',
                  value: model.profile?.dateOfBirth?.asString(),
                  icon: const Icon(Icons.calendar_today),
                ),
                ReadOnlyFieldLabel(
                  'Jenis Kelamin',
                  value: model.profile?.gender,
                  icon: Image.asset(
                    'assets/icons/gender.png',
                    height: 25,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          vSpaceMedium,
        ],
      ),
    );
  }
}
