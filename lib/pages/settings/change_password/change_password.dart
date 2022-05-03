import 'package:metashark/commons.dart';

part 'change_password_state.dart';

class ChangePasswordPage extends StatefulWidget {
  static const url = "/change-password";

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends _ChangePasswordState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Change password'),
      body: Scrollbar(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          shrinkWrap: true,
          padding: kPad16,
          children: [
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
              child: Text('Next'),
              onTap: onNextTap,
              extended: true,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onNextTap() async {
    var res = await context
        .openModalSheet<bool?>(const PasswordConfirmationFormSheet());
    if (res == true) {
      if (context.canPop()) {
        context.pop();
      }
    }
  }
}
