import 'package:metashark/commons.dart';

part 'withdraw_confirmation_state.dart';

class WithdrawConfirmationPage extends StatefulWidget {
  static const url = "/withdraw-confirmation";

  const WithdrawConfirmationPage({Key? key}) : super(key: key);

  @override
  createState() => _WithdrawConfirmationPage();
}

class _WithdrawConfirmationPage extends _WithdrawConfirmationState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Confirmation'),
      body: Scrollbar(
        child: ListView(
          padding: kPad16,
          physics: const AlwaysScrollableScrollPhysics(),
          clipBehavior: Clip.none,
          shrinkWrap: true,
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
              textControl: emailTec,
            ),
            kGap16,
            AppElevatedButton.primary(
              child: const Text('Save'),
              onTap: onSaveTap,
              extended: true,
            ),
          ],
        ),
      ),
    );
  }
}
