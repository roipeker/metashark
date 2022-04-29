import 'package:flutter/gestures.dart';
import 'package:metashark/commons.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  }..addAll(super.dragDevices);
}
