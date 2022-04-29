import 'package:metashark/commons.dart';

part 'change_email_state.dart';

class ChangeEmailPage extends StatefulWidget {
  static const url = "/change-email";

  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  createState() => _ChangeEmailPage();
}

class _ChangeEmailPage extends _ChangeEmailState {
  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: '11%3A2427',
      child: Scaffold(
        appBar: CommonAppBar(title: 'Change email'),
        body: ListView(
          padding: kPad16.copyWith(top: 24),
          shrinkWrap: true,
          children: [
            AppTextField(
              label: 'Current email',
              hint: 'Email@gmail.com',
            ),
            kGap16,
            AppTextField(
              label: 'Enter a new email',
              hint: 'Enter email',
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

  void onSaveTap() {
    context.pushNamed(ChangeEmailConfirmationPage.url);
  }
}
