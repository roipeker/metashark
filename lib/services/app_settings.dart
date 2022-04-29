import 'dart:convert';

import 'package:metashark/commons.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// local storage
class AppSettings extends ChangeNotifier {
  // GetStorage? _box;
  SharedPreferences? _box;
  int _numLaunches = -1;

  bool get inited => _box != null;

  SharedPreferences get box => _box!;

  FutureOr init() async {
    if (inited) return;
    _box = await SharedPreferences.getInstance();

    // _box = GetStorage(name);
    // var result = await _box!.initStorage;
    _numLaunches = box.getInt(_kNumLaunches) ?? 0;
    box.setInt(_kNumLaunches, _numLaunches + 1);
    reload();
  }

  FutureOr reload() async {
    await box.reload();

    if (box.getBool(_kResetApp) ?? false) {
      box.remove(_kResetApp);
      trace("Request app reset");
    }
    _numLaunches = box.getInt(_kNumLaunches) ?? 0;
    /*trace('settings::');
    trace("launches:", _numLaunches);
    trace("Theme mode: ", box.getString(_kThemeMode));*/
  }

  String get build {
    return box.getString(_kBuild) ?? '-';
  }

  bool get firstLaunch => _numLaunches <= 1;

  ThemeMode get themeMode {
    var themeName = box.getString(_kThemeMode) ?? ThemeMode.light.name;
    // var themeName = _read(_KThemeMode, ThemeMode.system.name)!;
    return _kThemeModes[themeName]!;
  }

  set themeMode(ThemeMode value) {
    if (value == themeMode) return;
    box.setString(_kThemeMode, value.name);
    // _write(_kThemeMode, value.name);
    notifyListeners();
  }

  // String get locale {
  //   return _read(_kLocale, 'en-US')!;
  // }
  // set locale(String value) {
  //   _write(_kLocale, value);
  //   notifyListeners();
  // }

  void logout() {
    _remove(_kNumLaunches);
    _remove(_kThemeMode);
    _numLaunches = -1;
  }

  void clear() => _box?.clear();

  void _remove(String key) => _box?.remove(key);

  void _write<T>(String key, T val) {
    if (T is bool) {
      _box?.setBool(key, val as bool);
    } else if (T is double) {
      _box?.setDouble(key, val as double);
    } else if (T is int) {
      _box?.setInt(key, val as int);
    } else if (T is List<String>) {
      _box?.setStringList(key, val as List<String>);
    } else if (T is String) {
      _box?.setString(key, val as String);
    } else {
      _box?.setString(key, jsonEncode(val));
    }
  }

  T? _read<T>(String key, [T? val]) {
    // return _box?.read(key) ?? val;
    return _box?.get(key) as T? ?? val;
  }
}

// const _kFirstLaunch = 'firstLaunch';
const _kNumLaunches = 'numLaunches';
const _kThemeMode = 'themeMode';
const _kResetApp = 'resetApp';
const _kBuild = 'build';
// locale managed by EasyLocalization
// const _kLocale = 'locale';

const _kThemeModes = {
  'dark': ThemeMode.dark,
  'light': ThemeMode.light,
  'system': ThemeMode.system,
};
