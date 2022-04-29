part of 'change_password.dart';
class _ChangePasswordTab1 extends StatefulWidget {
  const _ChangePasswordTab1({Key? key}) : super(key: key);

  @override
  State<_ChangePasswordTab1> createState() => _ChangePasswordTab1State();
}

class _ChangePasswordTab1State extends State<_ChangePasswordTab1> {
  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: '11%3A2306',
      child: Padding(
        padding: kPadH16,
        child: Column(
          children: [
            kGap24,
            AppTextField.password(
              label: 'Enter old Password',
              hint: 'Enter password',
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
            AppElevatedButton.primary(
              child: Text('Save'),
              onTap: onSaveTap,
              extended: true,
            ),
            kGap16,
          ],
        ),
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
class _ChangePasswordTab2 extends StatelessWidget {
  const _ChangePasswordTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: '11%3A2371',
      child: Padding(
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
            AppElevatedButton.primary(
              child: Text('Save'),
              onTap: () {
                /// not good.
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.goNamed(SettingsPage.url);
                }
              },
              extended: true,
            ),
            kGap16,
          ],
        ),
      ),
    );
  }
}
