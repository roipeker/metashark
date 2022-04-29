import 'package:metashark/commons.dart';

part 'registration_state.dart';

class RegistrationPage extends StatefulWidget {
  static const name = "/registration";

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  createState() => _RegistrationPage();
}

class _RegistrationPage extends _RegistrationState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: 'Registration',
      figmaNode: '282%3A4094',
      body: [
        kGap16,
        AppTextField(
          label: 'Refferal',
          hint: 'Refferal login',
        ),
        kGap16,
        AppTextField(
          label: 'My login',
          hint: 'Enter login',
        ),
        kGap16,
        AppTextField.password(
          label: 'New Password',
          hint: 'Enter password',
        ),
        kGap16,
        AppTextField.password(
          label: 'Repeat new password',
          hint: 'Enter password',
        ),
        kGap16,
        AppElevatedButton.primary(
          child: Text('Next'),
          onTap: onNextTap,
          extended: true,
        ),
        kGap16,
        AppElevatedButton.secondary(
          child: Text('Login'),
          onTap: onBackTap,
          extended: true,
        ),
      ],
    );
  }

  void onBackTap() {
    context.pop();
  }

  void onNextTap() {
    context.pushNamed(RegistrationConfirmationPage.name);
  }
}
