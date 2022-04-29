import 'package:flutter/material.dart';

void trace2(
  dynamic arg1, [
  dynamic arg2,
  dynamic arg3,
  dynamic arg4,
  dynamic arg5,
  dynamic arg6,
]) {}

abstract class WebUtils {
  static void init() {}
  static final onRemoveKeyboardFocus = ChangeNotifier();

  static void computeSafeArea() {}
  static bool isIOS() => false;

  static EdgeInsets getSafeArea() => EdgeInsets.zero;
}
