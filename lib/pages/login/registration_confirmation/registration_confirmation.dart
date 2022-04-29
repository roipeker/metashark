import 'package:metashark/commons.dart';

part 'registration_confirmation_state.dart';

class RegistrationConfirmationPage extends StatefulWidget {
  static const name = "/registration-confirmation";

  const RegistrationConfirmationPage({Key? key}) : super(key: key);

  @override
  createState() => _RegistrationConfirmationPage();
}

class _RegistrationConfirmationPage extends _RegistrationConfirmationState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: 'Registration',
      figmaNode: '10%3A1347',
      body: [
        kGap16,
        AppTextField(
          label: 'Enter code from myemail***@gmail.com/',
          hint: 'Enter code',
          accessory: AppTextButton.accessory(label: '27 sec', onTap: () {}),
        ),
        kGap16,
        AppElevatedButton.primary(
          child: Text('Next'),
          onTap: onNextTap,
          extended: true,
        ),
      ],
    );
  }

  void onBackTap() {
    context.pop();
  }

  void onNextTap() {
    context.goNamed(EditProfilePage.name);
  }
}
