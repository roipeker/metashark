part of 'google_auth.dart';

extension MobileOsExt on MobileOs {
  bool get isIOS => this == MobileOs.ios;

  bool get isAndroid => this == MobileOs.android;

  bool get isOther => this == MobileOs.other;
}

abstract class _GoogleAuthState extends State<GoogleAuthPage> {
  String get titleText => 'Google Auth page';
  late final mobileOS = WebUtils.getMobileOs();

  bool get hasValidOS => !mobileOS.isOther;

  String get googleAuthText {
    if (mobileOS.isIOS) {
      return "Google Authenticator for iOS";
    } else if (mobileOS.isAndroid) {
      return "Google Authenticator for Android";
    }
    return "Google Authenticator not available\nfor your platform.";
  }

  void onNextTap() {
    context.pushNamed(GoogleAuthKeyPage.url);
  }

  void onDownloadTap() {
    if (mobileOS.isIOS) {
      NativeUtils.openUrl(AppStrings.googleAuthAppIOS);
    } else {
      NativeUtils.openUrl(AppStrings.googleAuthAppAndroid);
    }
    // context.toastNotImplemented();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
