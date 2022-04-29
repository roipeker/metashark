import 'package:intl/intl.dart';
import 'package:metashark/commons.dart';

import 'app_settings.dart';

abstract class AppService {
  static final settings = AppSettings();

  static FutureOr init() async {
    Intl.defaultLocale = 'en_US';
    traceConfig(customTag: '🦈');
    WidgetsFlutterBinding.ensureInitialized();
    NativeUtils.initSplash();
    await NativeUtils.init();
    await settings.init();
    WebUtils.init();
  }
}
