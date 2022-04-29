import 'package:metashark/commons.dart';

/// Custom SnackBar implementation that acts globally on the app.
/// Used a quick Toast notification. Mostly to show API errors responses.
class AppToast extends StatefulWidget {
  final Widget child;
  static final toastKey = GlobalKey<_AppToastState>();

  const AppToast({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AppToast> createState() => _AppToastState();

  static void error({
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool important = false,
  }) {
    toastKey.currentState?.error(
      message: message,
      important: important,
      duration: duration,
    );
  }

  static void close() {
    toastKey.currentState?.close();
  }

  static void infoIcon({
    required String message,
    IconData icon = Icons.info_outlined,
    Color color = Colors.white, //TripmentorColors.green
    Duration duration = const Duration(seconds: 2),
    bool important = false,
  }) {
    toastKey.currentState?.show(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          kGap8,
          Flexible(
            child: Text(
              message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          kGap8,
        ],
      ),
      important: important,
      duration: duration,
    );
  }

  static void show({
    required Widget child,
    Duration duration = const Duration(seconds: 1),
    bool important = false,
  }) {
    toastKey.currentState?.show(
      child: child,
      important: important,
      duration: duration,
    );
  }
}

class _AppToastState extends State<AppToast> {
  /// default error message
  void error({
    required String message,
    Duration duration = const Duration(seconds: 1),
    bool important = false,
  }) {
    show(
      duration: duration,
      important: important,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          kGap8,
          Flexible(
            child: Text(
              message,
              maxLines: 4,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
          kGap8,
        ],
      ),
    );
  }

  /// default info wrapper.
  void show({
    required Widget child,
    Duration duration = const Duration(seconds: 1),
    bool important = false,
  }) {
    final msg = ScaffoldMessenger.of(context);
    if (important) {
      // msg.removeCurrentSnackBar();
      msg.clearSnackBars();
    }
    msg.showSnackBar(
      SnackBar(
        content: IntrinsicHeight(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 600),
              builder: (_, value, child) {
                return Transform.translate(
                  offset: Offset(0, 16 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.white),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: kBorderRadius8,
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: child,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: duration,
        padding: const EdgeInsets.all(12),
        dismissDirection: DismissDirection.down,
        // shape: RoundedRectangleBorder(borderRadius: kBorderRadius8),
        behavior: SnackBarBehavior.floating,
        // behavior: SnackBarBehavior.fixed,
        // animation: AlwaysStoppedAnimation(0),
      ),
    );
  }

  void close() {
    ScaffoldMessenger.of(context).clearSnackBars();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
