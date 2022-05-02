import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:metashark/commons.dart';

void trace2(
  dynamic arg1, [
  dynamic arg2,
  dynamic arg3,
  dynamic arg4,
  dynamic arg5,
  dynamic arg6,
]) {
  final outputList = <String>[
    '$arg1',
    if (arg2 != null) '$arg2',
    if (arg3 != null) '$arg3',
    if (arg4 != null) '$arg4',
    if (arg5 != null) '$arg5',
    if (arg6 != null) '$arg6',
  ];
  // •·
  var msg = outputList.join(', ');
  js.context.callMethod('trace', [msg]);
}

final _nav = html.window.navigator;

abstract class WebUtils {
  static late html.BodyElement body;
  static late html.Element div;

  // class DeviceInfo {
  // static bool isChromeInIOS() {
  // return isIOS() && !isSafari();
  // }
  static void init() {
    if (!kIsWeb) {
      return;
    }
    div =
        html.document.getElementsByTagName('flt-glass-pane')[0] as html.Element;
    body = html.document.getElementsByTagName('body')[0] as html.BodyElement;
    div.addEventListener('touchstart', _onTouch, true);

    /// inject viewport!
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      Timer(1000.milliseconds, () {
        _updateViewport();
        _startUpdateChecker();
      });
    });

    // final ua =_nav.userAgent;
    // trace2("APP NAME " +html.window.navigator.appName);
    // trace2("APP VERSION " +html.window.navigator.appVersion);
    // trace2("APP VERSION " +html.window.navigator.userAgent);
    // trace2(html.window.navigator.product);
    // trace2(html.window.navigator.vendor);
    // trace2(html.window.navigator.vendorSub);
    // trace2(html.window.navigator.maxTouchPoints.toString());
    // trace2(html.window.navigator.platform??'-');
    //
    // for safari.
    //Version/Safari.

    // for chrome..
    /// CriOS
    /// EdgiOS
    ///
    // var regexp = RegExp(r'/Version\/[\d\.]+.*Safari/');
    // var isSafari = regexp.hasMatch(ua);
    // is_safari = ua();
    // trace2("safari ua: $ua");
    // trace2("SO is safari: $isSafari");
    // keyboard DONE hack
    if (isIOS()) {
      trace2("Listen focus out!");
      // html.window.addEventListener('focusout', _removeFocus);
      // html.window.addEventListener('resize', (e) {
      //   trace2(
      //       "window resize: ", html.window.innerWidth, html.window.innerHeight);
      // });
    }

    // Periodic timer to check if there's a new version.
    // trace2("Is safari ios: ${isSafariIos()}");
    // if (isSafariIos()) {
    //   html.window.addEventListener('focusout', _removeFocus);
    // }
  }

  static String getEngine() {
    // js.allowInterop()
    var res = js.context.callMethod('getEngine');
    if (res != null) {
      return 'engine ' + res.toString();
    }
    return '';
  }

  static bool isIOS() {
    // final isIOS = _nav.appVersion.contains(r'iPhone|iPad|iPod');
    final _deviceMatch = RegExp(r'iphone|ipad|ipod');
    final isIOS = _deviceMatch.hasMatch(_nav.appVersion.toLowerCase());
    final isIOSSimulator =
        _nav.appVersion.contains('MacI') && (_nav.maxTouchPoints ?? 1) > 1;
    return isIOS || isIOSSimulator;
  }

  // static double _lastH=0;
  // static double _lastW=0;
  static final onRemoveKeyboardFocus = ChangeNotifier();

  static void _removeFocus(event) {
    // if (event is html.FocusEvent) {
    //   trace2('wtf event', event.type);
    // trace2(event.relatedTarget, event.path, event.timeStamp);
    // trace2((event.detail ?? 0).toString());
    // }
    // trace2("remove focus on window!");
    // SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
    onRemoveKeyboardFocus.notifyListeners();
    // });
    // Timer(1200.milliseconds, () {
    // trace2("SIZE:", html.window.visualViewport?.,
    //     html.window.visualViewport?.width);
    // });

    // trace2("HAS FOC:", FocusManager.instance.primaryFocus?.hasFocus);
    // trace2("REMOVE FOCUS! $event");

    /// call flutter to unfocus.
    // onRemoveKeyboardFocus.notifyListeners();
  }

  static void _onTouch(html.Event event) {
    if (event is html.TouchEvent) {
      var a = event.touches!.first;
      var touch = a.screen;
      var ratio = html.window.devicePixelRatio;
      trace2("Window ratio: ", ratio);

      /// considere the notch in landscape.
      if (touch.x < 30 * ratio) {
        trace2("Cancel back history.");
        event.preventDefault();
      }
    }
  }

  static EdgeInsets getSafeArea() {
    var jsArray = js.context.callMethod('getSafeArea') as js.JsArray;
    var stringValues = jsArray.cast<String>();
    // trace2('getSafeArea() $stringValues');
    // js.context.
    // top/right/bottom/left
    var doubleValues = stringValues.map2((e) {
      /// clean!
      var valString = e.replaceAll('px', '').replaceAll('%', '').trim();
      var valDouble = double.tryParse(valString);
      // trace2("VALS: ${valString}|${valDouble}");
      return valDouble ?? 0.0;
    });
    return EdgeInsets.fromLTRB(
      doubleValues[3],
      doubleValues[0],
      doubleValues[1],
      doubleValues[2],
    );
  }

  static void computeSafeArea() {
    if (!kIsWeb) {
      return;
    }
    var res = js.context.callMethod('computeValue');
    trace('computeSafeArea() $res');
  }

  static void _updateViewport() {
    var views = html.document.getElementsByName("viewport");
    if (views.isNotEmpty) {
      var e = views.first;
      if (e is html.Element) {
        const viewportContent =
            'width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0,viewport-fit=cover';
        e.setAttribute('content', viewportContent);
      }
    }
  }

  static Timer? _updateCheckTimer;
  static int updateCheckerDelay = 10;

  static void _cancelUpdateChecker() {
    if (_updateCheckTimer?.isActive == true) {
      trace2('canceling update checker');
      _updateCheckTimer?.cancel();
    }
  }

  static void _startUpdateChecker() {
    _cancelUpdateChecker();
    // if(AppStrings.buildVersion=='#replace_build'){
    if (AppStrings.isDev) {
      trace2('Using dev/local version. No need for update checker');
      return;
    }
    trace2('_startUpdateChecker in $updateCheckerDelay seconds');
    _updateCheckTimer = Timer(
      Duration(seconds: updateCheckerDelay),
      _requestUpdateCheck,
    );
  }

  static FutureOr _requestAppRefresh() {
    trace2('_requestAppRefresh');
    html.window.location.reload();
  }

  static FutureOr _requestUpdateCheck() async {
    trace2('_requestUpdateCheck');
    try {
      final remoteVersion = await _getVersion();
      trace2("Got remote version $remoteVersion");
      if (AppStrings.buildVersion != remoteVersion) {
        _requestAppRefresh();
      } else {
        trace2("no updates");
        _startUpdateChecker();
      }
    } catch (e) {
      trace2("Error requesting version: $e");
    }
  }

//
// static bool isSafariIos() =>
//     WebDeviceInfo.isIOS() && WebDeviceInfo.isSafari();
// static bool isChromeIos() => WebDeviceInfo.isChromeInIOS();

  static final _httpClient = http.Client();

  static Future<String> _getVersion() async {
    final res = await _httpClient.get(_versionJsonUrl());
    if (res.statusCode == 200) {
      var map = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
      final version = map['version'];
      final build = map['build_number'];
      return version + '+' + build;
    } else {
      return '';
    }
  }

  /// Get version.json full url.
  static Uri _versionJsonUrl() {
    final baseUrl = html.window.document.baseUri!;
    final cacheBuster = DateTime.now().millisecondsSinceEpoch;
    final baseUri = Uri.parse(baseUrl);
    final originPath = '${baseUri.origin}${baseUri.path}';
    final versionJson = 'version.json?cachebuster=$cacheBuster';
    return Uri.parse(originPath.endsWith('/')
        ? '$originPath$versionJson'
        : '$originPath/$versionJson');
  }
}
