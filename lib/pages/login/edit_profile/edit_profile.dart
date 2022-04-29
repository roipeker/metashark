import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';
import 'package:metashark/data/countries.dart';

import 'widgets.dart';

part 'edit_profile_state.dart';

class EditProfilePage extends StatefulWidget {
  static const name = "/edit-profile";

  const EditProfilePage({Key? key}) : super(key: key);

  @override
  createState() => _EditProfilePage();
}

class _EditProfilePage extends _EditProfileState {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Edit profile',
      color: AppColors.primaryPurple,
      child: LoginScaffold(
        showSupport: false,
        title: 'Edit profile',
        // figmaNode: '282%3A4094',
        body: [
          kGap16,
          AppTextField(
            label: 'First name',
            hint: 'Enter first name',
          ),
          kGap16,
          AppTextField(
            label: 'Last name',
            hint: 'Enter last name',
          ),
          kGap16,
          Obs(
            () => GenderPicker(
              selectedIndex: genderIndex.value,
              onChanged: onGenderSelection,
            ),
          ),
          kGap16,
          AppDateField(
            label: 'Birthday',
            selectedDate: DateTime.now(),
          ),
          kGap16,
          FormLabeledField(
            label: 'Country',
            input: Obs(
              () => CountryDropdown(
                onChanged: selectedCountry,
                current: selectedCountry(),
                options: countriesOptions,
              ),
            ),
          ),
          kGap16,
          AppElevatedButton.primary(
            child: Text('Next'),
            onTap: onNextTap,
            extended: true,
          ),
          kGap16,
          AppElevatedButton.secondary(
            child: Text('Skip'),
            onTap: onSkipTap,
            extended: true,
          ),
        ],
      ),
    );
  }

  void onSkipTap() {
    appData.login();
    context.goNamed(HomePage.url);
  }

  void onNextTap() {
    appData.login();
    context.goNamed(HomePage.url);
  }

  final genderIndex = 0.obs();

  void onGenderSelection(int value) {
    genderIndex(value);
  }
}
