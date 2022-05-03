class AppStrings {
  static const bundleId = 'com.roipeker.metashark.test';
  static const appName = 'Meta Shark';

  /// to be fullfil later.
  static var buildVersion = '#replace_build';

  static Map<String, String> get _buildVersionMap => {'v': buildVersion};

  static bool get isDev => _buildVersionMap['v']!.contains('#replace_');

  // static var buildVersion = '1.0.31+157';
  static const shareProfileText = 'Hey, check out my profile on MetaShark';
  static const shareProfileTitle = 'Super MetaShark promo';

  static const googleAuthAppAndroid =
      'https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=ru&gl=US';
  static const googleAuthAppIOS =
      'https://apps.apple.com/us/app/google-authenticator/id388497605';


}

class AppFonts {
  /// default fallback font stack for WEB.
  static const fallback = [
    'SF Pro Text',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Roboto',
    'Oxygen-Sans',
    'Ubuntu',
    'Cantarell',
    'Helvetica Neue',
    'sans-serif',
  ];

  static const openSans = 'Open Sans';
  static const poppins = 'Poppins';
}
