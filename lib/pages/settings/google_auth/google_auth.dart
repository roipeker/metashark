import 'package:metashark/commons.dart';

part 'google_auth_state.dart';

class GoogleAuthPage extends StatefulWidget {
  static const url = "/google-auth";

  const GoogleAuthPage({Key? key}) : super(key: key);

  @override
  createState() => _GoogleAuthPage();
}

class _GoogleAuthPage extends _GoogleAuthState {
  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: '93%3A4357',
      child: Scaffold(
        appBar: CommonAppBar(
          title: 'Google Auth',
        ),
        body: Padding(
          padding: kPad16,
          child: Column(
            children: [
              // install card.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          SvgIcons.googleAuthIconBig,
                          width: 60,
                          height: 60,
                          semanticsLabel: 'Google Auth Logo',
                        ),
                        kGap16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Installation",
                                style: TextStyle(
                                  color: Color(0xff5e5873),
                                  fontSize: 16,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              kGap8,
                              Text(
                                "To get started, you need to install the Google Authenticator app on your phone",
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

                    /// download card.
                    AppCard.settings(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Google Authenticator for iOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff5e5873),
                              fontSize: 16,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          kGap16,
                          AppElevatedButton.primarySmall(
                            child: Text('Download'),
                            onTap: onDownloadTap,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

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

  void onNextTap() {
    context.pushNamed(GoogleAuthKeyPage.url);
  }

  void onDownloadTap() {
    context.toastNotImplemented();
  }
}
