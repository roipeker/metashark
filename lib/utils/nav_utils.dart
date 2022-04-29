import 'package:metashark/commons.dart';


final kRootKey = GlobalKey<NavigatorState>(debugLabel: 'Root Wrapper');

BuildContext? get rootContext => kRootKey.currentContext;

class SharedAxisPageRoute<T> extends PageRouteBuilder<T> {
  SharedAxisPageRoute({
    required Widget page,
    required SharedAxisTransitionType transitionType,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation primaryAnimation,
            Animation secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> primaryAnimation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            // return FadeThroughTransition(
            //   animation: primaryAnimation,
            //   secondaryAnimation: secondaryAnimation,
            //   child: child,
            // );
            return SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: transitionType,
              child: child,
            );
          },
        );
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    // only return the child without warping it with animations
    return child!;
  }
}

const _kNoTransition = NoTransitionsBuilder();

Map<TargetPlatform, PageTransitionsBuilder> getPageTransitionBuilders() {
  return kIsWeb
      ? {
          TargetPlatform.android: _kNoTransition,
          TargetPlatform.iOS: _kNoTransition,
          TargetPlatform.linux: _kNoTransition,
          TargetPlatform.macOS: _kNoTransition,
          TargetPlatform.windows: _kNoTransition,
        }
      : {
          TargetPlatform.android: const FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: const FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: const FadeUpwardsPageTransitionsBuilder(),
        };
}



class RouterUtils {
  static int getUrlIdAsTabIndex(List<BottomNavItemVo> navItems, String id) {
    id = id.trim().toLowerCase();
    return navItems.indexWhere((o) => o.urlId == id, 0);
  }

  static bool isValidUrlParam(List<BottomNavItemVo> navItems, String id) {
    id = id.trim().toLowerCase();
    for (var o in navItems) {
      if (o.urlId == id) return true;
    }
    return false;
  }
}
