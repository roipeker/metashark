part of 'password_confirmation_form_sheet.dart';

class ChangePasswordTab1 extends StatefulWidget {
  const ChangePasswordTab1({Key? key}) : super(key: key);

  @override
  State<ChangePasswordTab1> createState() => _ChangePasswordTab1State();
}

class _ChangePasswordTab1State extends State<ChangePasswordTab1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadH16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          kGap24,
          AppTextField(
            label: 'Code 2-FA',
            hint: 'Enter code',
            accessory: AppTextButton.accessory(label: 'Insert', onTap: () {}),
          ),
          kGap16,
          AppTextField(
            label: 'Enter code from Gma***@gmail.com',
            hint: 'Enter code',
            accessory: AppTextButton.accessory(label: 'Insert', onTap: () {}),
          ),
          kGap16,
          AppTextField(
            label: 'Enter code from Jui***@gmail.com',
            hint: 'Enter code',
            accessory: AppTextButton.accessory(label: 'Insert', onTap: () {}),
          ),
          kGap16,
        ],
      ),
    );
  }

  void onSaveTap() {
    /// not good.
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed(SettingsPage.url);
    }
  }
}

/// tab 2
///
class ChangePasswordTab2 extends StatelessWidget {
  const ChangePasswordTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadH16,
      child: Column(
        children: [
          kGap24,
          AppTextField(
            label: 'Code 2-FA',
            hint: 'Enter code',
            accessory: AppTextButton.accessory(label: 'Insert', onTap: () {}),
          ),
          kGap16,
          AppTextField.password(
            label: 'Enter new password',
            hint: 'Enter password',
          ),
          kGap16,
          AppTextField.password(
            label: 'Repeat new password',
            hint: 'Enter password',
          ),
          kGap16,
        ],
      ),
    );
  }
}
