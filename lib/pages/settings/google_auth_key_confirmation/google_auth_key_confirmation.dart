import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'google_auth_key_confirmation_state.dart';

class GoogleAuthKeyConfirmationPage extends StatefulWidget {
  static const url = "/google-auth-key-confirmation";

  const GoogleAuthKeyConfirmationPage({Key? key}) : super(key: key);

  @override
  createState() => _GoogleAuthKeyConfirmationPage();
}

class _GoogleAuthKeyConfirmationPage extends _GoogleAuthKeyConfirmationState {
  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: '93%3A4457',
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
                    SelectableText(
                      "Confirmation",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 20,
                        fontFamily: "Open Sans",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    kGap8,
                    SelectableText(
                      "Please enter the generated 6-digit code",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 14,
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
                      child: Text('Next'),
                      onTap: onNextTap,
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
