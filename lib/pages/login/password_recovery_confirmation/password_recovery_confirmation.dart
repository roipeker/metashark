import 'package:metashark/commons.dart';
part 'password_recovery_confirmation_state.dart';

class PasswordRecoveryConfirmationPage extends StatefulWidget {
  
   static const name = "/password-recovery-confirmation";
 
  const PasswordRecoveryConfirmationPage({Key? key}) : super(key: key);
  
  @override
  createState() => _PasswordRecoveryConfirmationPage();
}

class _PasswordRecoveryConfirmationPage extends _PasswordRecoveryConfirmationState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: 'Password recovery',
      // figmaNode: '282%3A4094',
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
    context.pushNamed(InvalidFormPage.name);
  }
}

