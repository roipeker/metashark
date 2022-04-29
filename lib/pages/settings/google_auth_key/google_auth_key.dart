import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'google_auth_key_state.dart';

class GoogleAuthKeyPage extends StatefulWidget {
  static const url = "/google-auth-key";

  const GoogleAuthKeyPage({Key? key}) : super(key: key);

  @override
  createState() => _GoogleAuthKeyPage();
}

class _GoogleAuthKeyPage extends _GoogleAuthKeyState {
  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: '93%3A4457',
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: kPad16,
          child: Column(
            children: [
              // install card.
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            SvgIcons.privacyTip,
                            width: 60,
                            height: 60,
                          ),
                          kGap16,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Private key",
                                  style: TextStyle(
                                    color: Color(0xff5e5873),
                                    fontSize: 16,
                                    fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                kGap8,
                                Text(
                                  "Please add your private key to the Google Authenticator app.",
                                  style: TextStyle(
                                    color: Color(0xff5e5873),
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      kGap32,
                      kGap16,
                      QrSection(
                        code: qrCode,
                        onCopyTap: onCodeCopy,
                      ),
                    ],
                  ),
                ),
              ),
              kGap16,
              AppElevatedButton.primary(
                child: Text('Next'),
                onTap: onNextTap,
                extended: true,
              ),
              kGap16,
            ],
          ),
        ),
      ),
    );
  }
}
