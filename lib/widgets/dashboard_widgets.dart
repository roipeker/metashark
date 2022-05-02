import 'package:metashark/commons.dart';

///
///

class HomeCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final BoxDecoration background;
  final Widget child;
  final EdgeInsets padding;
  final bool inkForeground;

  // utility
  static Gradient getLinearGradient(List<Color> colors, {List<double>? stops}) {
    return LinearGradient(
      colors: colors,
      stops: stops,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  const HomeCardWidget({
    Key? key,
    this.onTap,
    required this.child,
    required this.background,
    this.inkForeground = false,
    this.padding = kPad16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (inkForeground) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: background.color,
              borderRadius: kBorderRadius8,
              boxShadow: kBoxShadow10,
              gradient: background.gradient,
            ),
            padding: padding,
            child: child,
          ),
          Positioned.fill(
            child: Material(
              borderRadius: kBorderRadius8,
              type: MaterialType.transparency,
              elevation: 0,
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: kBorderRadius8,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: background.color,
          borderRadius: kBorderRadius8,
          boxShadow: kBoxShadow10,
          gradient: background.gradient,
        ),
        child: Material(
          borderRadius: kBorderRadius8,
          type: MaterialType.transparency,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: kBorderRadius8,
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      );
    }
  }
}

///
///
class MyTeamWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Gradient? gradient;
  final String title, label1, value1, label2, value2, label3, value3;

  const MyTeamWidget({
    Key? key,
    this.onTap,
    this.title = "Моя команда",
    this.label1 = 'Партнеры',
    this.value1 = '12',
    this.label2 = 'Структура',
    this.value2 = '10 000',
    this.label3 = 'Активные',
    this.value3 = '3890',
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCardWidget(
      onTap: onTap,
      inkForeground: false,
      background: BoxDecoration(
        gradient: gradient ??
            HomeCardWidget.getLinearGradient(
              const [
                Color(0xffDE8114),
                Color(0xffDC6E2E),
                Color(0xffD32A86),
              ],
              stops: [0, .2, 1],
            ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          TeamRowCard(
            label: label1,
            value: value1,
            iconData: AppIcons.person,
            brightness: Brightness.dark,
          ),
          TeamRowCard(
            label: label2,
            value: value2,
            iconData: AppIcons.people,
            brightness: Brightness.dark,
          ),
          TeamRowCard(
            label: label3,
            value: value3,
            iconData: AppIcons.power_settings_new,
            brightness: Brightness.dark,
          ),
        ].separator(kGap16),
      ),
    );
  }
}
