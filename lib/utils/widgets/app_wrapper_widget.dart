import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

/// Core widget that wraps all Navigation screens.
/// Used to put Widgets common to all app pages.
/// Like focus management and AppToast.
class AppWrapperWidget extends StatelessWidget {
  final Widget child;

  static Widget builder(BuildContext context, Widget? child) {
    NativeUtils.removeSplash();
    late Widget _child;
    if (child == null) {
      _child = const Center(
        child: Text('No page available.'),
      );
    } else {
      _child = AppWrapperWidget(child: child);
    }
    return CupertinoTheme(
      data: lightThemeCupertino,
      child: SafeAreaWebFixer(
        child: _child,
      ),
    );
  }

  const AppWrapperWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppVersionWrapper(
      child: AppFocusWidget(
        child: AppToast(
          key: AppToast.toastKey,
          child: child,
        ),
      ),
    );
  }
}

class AppVersionWrapper extends StatelessWidget {
  final Widget child;

  const AppVersionWrapper({Key? key, required this.child}) : super(key: key);

  String get versionText {
    var engine = WebUtils.getEngine();
    // var parts = [NativeUtils.packageVersion, NativeUtils.packageBuildNumber];
    // var versions = parts.join('.').split('.');
    // var result = versions.map((e) => e.padLeft(2, '0')).join('.');
    // var result = parts.join('.');
    var result = NativeUtils.buildVersion;
    var str = 'v.' + result;
    if (engine.isNotEmpty) {
      str = '$engine ' + str;
    }
    // if (AppStrings.buildVersion == '#replace_build_version') {
    //   str += '| ?';
    // } else {
    // str += ' | ${AppStrings.buildVersion}';
    // }
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned(
          top: 0,
          right: 0,
          child: SafeArea(
            child: Material(
              color: Colors.white38,
              type: MaterialType.canvas,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  versionText,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ).ignorePointer(true),
          ),
        ),
      ],
    );
  }
}

/// Wrapper to `unfocus()` text fields and other widget elements
/// when we tap anywhere on the screen EXCEPT the focusable actual widget.
/// Used to dismiss the keyboard.
class AppFocusWidget extends StatelessWidget {
  final Widget? child;

  const AppFocusWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// no inner TextField `context` available when using global focus.
        // [FocusScope.of(context).unfocus();] is a no go.
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}

class SafeAreaWebFixer extends StatefulWidget {
  final Widget child;

  const SafeAreaWebFixer({Key? key, required this.child}) : super(key: key);

  @override
  State<SafeAreaWebFixer> createState() => _SafeAreaWebFixerState();
}

class _SafeAreaWebFixerState extends State<SafeAreaWebFixer> {
  bool pendingIosFocusOut = false;

  @override
  void initState() {

    1.5.seconds.delay(() {
      update();
    });

    if (WebUtils.isIOS()) {
      WebUtils.onRemoveKeyboardFocus.addListener(_onSafariFocusChanged);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (WebUtils.isIOS()) {
      WebUtils.onRemoveKeyboardFocus.removeListener(_onSafariFocusChanged);
    }
    super.dispose();
  }

  void _onSafariFocusChanged() {
    pendingIosFocusOut = true;
  }

  void runUnfocus() {
    if (!isKeyboardOpen) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  bool isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return widget.child;

    /// fix mobile web insets. (notches)
    final query = MediaQuery.of(context);

    /// SUPER FIX, only for iOS devices.
    if (pendingIosFocusOut) {
      pendingIosFocusOut = false;
      isKeyboardOpen = query.viewInsets != EdgeInsets.zero;
      runUnfocus();
    }

    final area = WebUtils.getSafeArea();
    // final mq = query;
    // var str = [query.padding, query.viewInsets, query.viewPadding].join(',');
    // trace2('media padding', str);
    // /// [🦈] EdgeInsets(0.0, 47.0, 0.0, 34.0), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 34.0)
    // /// open keyboard.
    // /// [🦈] EdgeInsets(0.0, 47.0, 0.0, 34.0), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 34.0)
    // // [🦈] EdgeInsets(0.0, 47.0, 0.0, 32.1), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 32.1)
    // // [🦈] EdgeInsets(0.0, 47.0, 0.0, 11.2), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 11.2)
    // // [🦈] EdgeInsets(0.0, 47.0, 0.0, 0.0), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 0.0)
    // mq.viewPadding
    const maxEdge = EdgeInsets.all(double.infinity);
    var padding = area - query.viewInsets;
    padding = padding.clamp(EdgeInsets.zero, maxEdge) as EdgeInsets;
    // trace('1 - q1: $str');
    // trace2('1 - q2: $str');
    // trace2('1 - web: $area');
    // trace2('1 - final padding: $padding');
    // if( !padding.isNonNegative ){
    //   padding = EdgeInsets.zero;
    // }
    /// keyboard open?
    // if (query.viewPadding.bottom > padding.bottom) {
    //   padding = EdgeInsets.zero;
    // }
    return MediaQuery(
      data: query.copyWith(
        viewPadding: area,
        padding: padding,
      ),
      child: widget.child,
    );
  }
}
