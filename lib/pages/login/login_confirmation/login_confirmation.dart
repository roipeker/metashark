import 'package:metashark/commons.dart';

part 'login_confirmation_state.dart';

class LoginConfirmationPage extends StatefulWidget {
  static const name = "/login-confirmation";

  const LoginConfirmationPage({Key? key}) : super(key: key);

  @override
  createState() => _LoginConfirmationPage();
}

class _LoginConfirmationPage extends _LoginConfirmationState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: 'Login Confirmation',
      figmaNode: '10%3A268',
      body: [
        kGap16,
        AppTextField(
          label: 'Enter code from myemail***@gmail.com/',
          hint: 'Enter code',
          accessory: AppTextButton.accessory(label: '27 sec', onTap: () {}),
        ),
        kGap16,
        AppTextField(
          label: 'Code 2-FA',
          hint: 'Enter code',
          accessory: AppTextButton.accessory(label: 'Paste', onTap: () {}),
        ),
        kGap16,
        AppElevatedButton.primary(
          child: Text('Next'),
          onTap: onNextTap,
          extended: true,
        ),
        kGap16,
        if (context.canPop())
          AppElevatedButton.secondary(
            child: Text('Back'),
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
    context.pushNamed(LinkProfilePage.name);
  }
}
