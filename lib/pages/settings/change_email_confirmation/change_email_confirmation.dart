import 'package:metashark/commons.dart';

part 'change_email_confirmation_state.dart';

class ChangeEmailConfirmationPage extends StatefulWidget {
  static const url = "/change-email-confirmation";

  const ChangeEmailConfirmationPage({Key? key}) : super(key: key);

  @override
  createState() => _ChangeEmailConfirmationPage();
}

class _ChangeEmailConfirmationPage extends _ChangeEmailConfirmationState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Confirmation'),
      body: Scrollbar(
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          shrinkWrap: true,
          padding: kPad16.copyWith(top: 24),
          children: [
            AppTextFieldInsert(
              label: 'Code 2-FA',
              hint: 'Enter Code',
              textControl: code2faTec,
            ),
            kGap16,
            AppTextFieldInsert(
              label: 'Enter code from Gma***@gmail.com',
              hint: 'Enter Code',
              textControl: email1Tec,
            ),
            kGap16,
            AppTextFieldInsert(
              label: 'Enter code from Jui***@gmail.com',
              hint: 'Enter Code',
              textControl: email2Tec,
            ),
            kGap16,
            AppElevatedButton.primary(
              child: Text('Save'),
              onTap: onSaveTap,
              extended: true,
            ),
          ],
        ),
      ),
    );
  }
}
