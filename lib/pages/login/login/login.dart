import 'package:metashark/commons.dart';

part 'login_state.dart';

class LoginPage extends StatefulWidget {
  static const name = "login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  createState() => _LoginPage();
}

class _LoginPage extends _LoginState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: 'Login',
      figmaNode: '10%3A267',
      body: [
        const AppTextField(
          label: 'Enter login, email',
          hint: 'Enter data',
        ),
        kGap16,
        AppTextField.password(
          label: 'Password',
          hint: 'Enter password',
          bottom: AppTextButton.tiny(
            label: "Forgot your password?",
            onTap: onForgotTap,
          ).bottomRight(),
        ),
        kGap16,
        AppElevatedButton.primary(
          child: Text('Next'),
          onTap: onNextTap,
          extended: true,
        ),
        kGap16,
        AppElevatedButton.secondary(
          child: Text('Registration'),
          onTap: onRegistrationTap,
          extended: true,
        ),
      ],
    );
  }

  void onForgotTap() {
    context.pushNamed(PasswordRecoveryPage.name);
  }

  void onNextTap() {
    context.pushNamed(LoginConfirmationPage.name);
  }

  void onRegistrationTap() {
    context.pushNamed(RegistrationPage.name);
  }
}
