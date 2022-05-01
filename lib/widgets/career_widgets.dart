import 'package:metashark/commons.dart';

class CircularPercent extends StatelessWidget {
  final double percent, size;
  final Widget child;
  final Color foregroundColor, borderColor;

  const CircularPercent({
    Key? key,
    this.percent = 0.4,
    this.size = 56,
    this.foregroundColor = AppColors.primaryPurple,
    this.borderColor = Colors.grey,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        willChange: true,
        isComplex: false,
        foregroundPainter: _CircularPercentStarPainter(
          percent: percent,
          foregroundColor: foregroundColor,
          borderColor: borderColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _CircularPercentStarPainter extends CustomPainter {
  final double percent;
  final Color foregroundColor, borderColor;

  _CircularPercentStarPainter({
    this.percent = 0.5,
    this.foregroundColor = AppColors.primaryPurple,
    this.borderColor = const Color(0xffDBDFF1),
  });

  @override
  void paint(Canvas canvas, Size size) {
    var angle = (360 * percent).rad();

    /// inside ?

    final paint1 = Paint();
    paint1.color = borderColor;
    paint1.style = PaintingStyle.stroke;
    paint1.strokeWidth = 2;

    final paint2 = Paint();
    paint2.color = foregroundColor;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 5;
    paint2.strokeCap = StrokeCap.round;

    /// adjust for "inner" border. (Flutter only has "centered" lines)
    const max = 5;
    const off = max / 2;
    size = Size(size.width - max, size.height - max);
    const pos = Offset(off, off);

    canvas.drawCircle(size.center(pos), size.longestSide / 2, paint1);
    canvas.drawArc(pos & size, -pi / 2, angle, false, paint2);
  }

  @override
  bool shouldRepaint(_CircularPercentStarPainter oldDelegate) {
    return percent != oldDelegate.percent;
  }
}

class CircularPercentStar extends StatelessWidget {
  final double percent, size;
  final Color foregroundColor;
  final TextStyle? style;
  final Color borderColor;

  const CircularPercentStar({
    Key? key,
    required this.percent,
    required this.size,
    this.foregroundColor = AppColors.primaryPurple,
    this.style,
    this.borderColor = const Color(0xffDBDFF1),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercent(
      percent: percent,
      size: size,
      borderColor: borderColor,
      foregroundColor: foregroundColor,
      child: _CircularTitleStar(
        percent: percent,
        style: style,
        iconColor: foregroundColor,
      ),
    );
  }
}

/// child for circular preloader.
class _CircularTitleStar extends StatelessWidget {
  final double percent;
  final TextStyle? style;
  final Color iconColor;

  const _CircularTitleStar({
    Key? key,
    this.style,
    this.iconColor = AppColors.primaryPurple,
    required this.percent,
  }) : super(key: key);

  String get percentString =>
      (percent * 100).round().toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          AppIcons.star_2,
          // color: AppColors.primaryPurple,
          color: iconColor,
          size: 12,
        ),
        const Gap(3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              percentString,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1,
                // color: AppColors.appbarIconGrey,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ).merge(style),
            ),
            Text(
              "%",
              style: TextStyle(
                // color: AppColors.appbarIconGrey,
                fontSize: 10.11,
                height: 1,
                fontWeight: FontWeight.w600,
              ).merge(style),
            ),
          ],
        ),
      ],
    );
  }
}
