import 'package:metashark/commons.dart';
import 'package:metashark/data/countries.dart';

part 'profile_state.dart';

class SettingsProfilePage extends StatefulWidget {
  static const url = "/settings-profile";

  const SettingsProfilePage({Key? key}) : super(key: key);

  @override
  createState() => _ProfilePage();
}

class _ProfilePage extends _ProfileState {
  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      // node: '11%3A2100',
      node: null,
      child: Scaffold(
          appBar: CommonAppBar(
            title: 'Profile',
            actions: [
              IconButton(
                  onPressed: onShareTap,
                  color: AppColors.appbarIconGrey,
                  icon: Icon(AppIcons.share)),
            ],
          ),
          body: ListView(
            padding: kPad16,
            children: [
              kGap16,
              AppTextField(
                label: 'Login',
                hint: 'Enter login',
              ),
              kGap16,
              AppTextField(
                label: 'Name',
                hint: 'Enter your name',
              ),
              kGap16,
              AppTextField(
                label: 'Surname',
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
                child: Text('Save'),
                onTap: onNextTap,
                extended: true,
              ),
            ],
          )),
    );
  }

  void onNextTap() {
    appData.login();
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed(SettingsPage.url);
    }
  }

  final genderIndex = 0.obs();

  void onGenderSelection(int value) {
    genderIndex(value);
  }

  void onShareTap() {
    NativeUtils.share(
      subject: AppStrings.shareProfileTitle,
      message: AppStrings.shareProfileText,
    );
  }
}
