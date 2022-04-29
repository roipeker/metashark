import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'google_auth_cancellation_state.dart';

class GoogleAuthCancellationPage extends StatefulWidget {
  static const url = "/google-auth-cancellation";

  const GoogleAuthCancellationPage({Key? key}) : super(key: key);

  @override
  createState() => _GoogleAuthCancellationPage();
}

class _GoogleAuthCancellationPage extends _GoogleAuthCancellationState {
  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: null,
      child: Scaffold(
        appBar: CommonAppBar(title: 'Settings'),
        body: Padding(
          padding: kPad16,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SelectableText(
                      "Confirmation",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 20,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    kGap16,
                    AppTextField(
                      label: 'Enter code from Gma***@gmail.com',
                      hint: 'Enter code',
                      // control: codeControl,
                      accessory: AppTextButton.accessory(
                        label: 'Submit Code',
                        onTap: onSubmitCodeTap,
                      ),
                    ),
                    kGap16,
                    AppTextField(
                      label: 'Google Verification',
                      hint: 'Enter code',
                      control: codeControl,
                      accessory: AppTextButton.accessory(
                        label: 'Insert',
                        onTap: onInsertTap,
                      ),
                    ),
                    kGap16,
                    AppElevatedButton.primary(
                      child: Text('Send'),
                      onTap: onSendTap,
                      extended: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
