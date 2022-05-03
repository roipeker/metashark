import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:metashark/commons.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as $launcher;

export 'web/utils.dart';

class NativeUtils {
  static bool _splashInited = false;

  static void initSplash() {
    // return ;
    if (_splashInited) {
      return;
    }
    _splashInited = true;
    FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
    );
  }

  static void removeSplash() {
    // return ;
    if (!_splashInited) {
      return;
    }
    _splashInited = false;
    FlutterNativeSplash.remove();
  }

  static String get buildVersion {
    return packageVersion + '+' + packageBuildNumber;
  }

  static String get packageBuildNumber => _packageInfo.buildNumber;

  static String get packageVersion => _packageInfo.version;

  static late PackageInfo _packageInfo;

  static FutureOr init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static FutureOr openUrl(String url) async {
    if (await $launcher.canLaunch(url)) {
      await $launcher.launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
    }
  }

  static FutureOr openFigmaRef(String node) async {
    final url =
        'https://www.figma.com/file/3Qo18qFFUsANsKuQtGASmc/MetaShark?node-id=$node';
    // 103%3A2925
    if (await $launcher.canLaunch(url)) {
      await $launcher.launch(
        url,
        webOnlyWindowName: 'Figma',
        forceSafariVC: false,
        universalLinksOnly: true,
      );
    }
  }

  /// common share method.
  static FutureOr<ShareResult> share({
    required String message,
    String? subject,
    Rect? position,
  }) {
    return Share.shareWithResult(
      message,
      subject: subject,
      sharePositionOrigin: position,
    );
  }
}
