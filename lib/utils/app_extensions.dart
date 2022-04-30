import 'package:metashark/commons.dart';

extension AppBuildContextExt on BuildContext {
  /// shows a toast  with the message "Not implemented".
  void toastNotImplemented() {
    AppToast.infoIcon(
      icon: Icons.warning,
      important: true,
      message: 'Feature not implemented',
      // message: Strings.commons.messages.notImplemented.tr(),
    );
  }

  TextDirection get textDirection {
    return Directionality.of(this);
  }

  /// tricky one, check the Name of the Widget.
  // void popUntilName(
  //   String name, {
  //   bool rootNavigator = false,
  // }) {
  //   if (!canPop(rootNavigator: rootNavigator)) return;
  //   name = name.trim().toLowerCase();
  //   final callback = (route) {
  //     return route.settings.name.toLowerCase() == name;
  //   };
  //   navigator(rootNavigator).popUntil(callback);
  // }

  Future<T?> openModalSheet<T>(Widget child) {
    return showMaterialModalBottomSheet<T>(
      context: this,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      isDismissible: true,
      expand: false,
      bounce: false,
      elevation: 0,
      builder: (context) => child,
    );
  }

  /// customize the color.
  Future<T?> openDialog<T>(Widget child, {T? orReturn}) async {
    final res = await showDialog<T>(
      context: this,
      builder: (_) => child,
    );
    return res ?? orReturn;
    // showGeneralDialog(context: context, pageBuilder: pageBuilder);
    // showDialog(builder: (BuildContext context) {  });
    // return showMaterialModalBottomSheet<T>(
    //   context: this,
    //   builder: (context) => child,
    // );
  }

  bool canPop({bool rootNavigator = false}) {
    final nav = navigator(rootNavigator: rootNavigator);
    return nav?.canPop() ?? false;
  }

  /// Uses GoRouter navigator (if any), fallbacks to regular Navigator.
  NavigatorState? navigator({
    bool rootNavigator = false,
  }) {
    return router.navigator ?? Navigator.of(this, rootNavigator: rootNavigator);
  }

// Future<T?> pushAndRemove<T>(
//   Widget page, {
//   RoutePredicate? popUntil,
//   bool rootNavigator = false,
//   bool isDialog = false,
//   String? name,
//   Object? args,
// }) {
//   /// TODO: allow CupertinoPageRoute, and other Route transitions.
//   name ??= page.toString();
//   final route = MaterialPageRoute<T>(
//     builder: (_) => page,
//     settings: RouteSettings(name: name, arguments: args),
//     fullscreenDialog: isDialog,
//   );
//
//   /// remove all routes.
//   popUntil ??= (r) => false;
//   return navigator(rootNavigator).pushAndRemoveUntil<T>(route, popUntil);
// }
}

extension AppWidgetExt on Widget {
  SliverToBoxAdapter toSliver() {
    return SliverToBoxAdapter(child: this);
  }

  Widget exp() {
    return Expanded(child: this);
  }

  Widget topRight() {
    return Align(
      alignment: Alignment.topRight,
      child: this,
    );
  }

  Widget topLeft() {
    return Align(
      alignment: Alignment.topLeft,
      child: this,
    );
  }

  Widget bottomLeft() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget bottomCenter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: this,
    );
  }

  Widget centerRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  Widget bottomRight() {
    return Align(
      alignment: Alignment.bottomRight,
      child: this,
    );
  }
}

/// date time
extension AppDateTimeExt on DateTime {
  String get formatEditProfile {
    return FormUtils.dateFormat.format(this);
  }
}

extension AppNumExt on num {
  // get as degrees
  double deg() => this / pi * 180;

  // get as radians
  double rad() => this * pi / 180;
}
