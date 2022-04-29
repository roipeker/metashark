import 'package:metashark/commons.dart';

class CircularPercent extends StatelessWidget {
  final double percent, size;
  final Widget child;

  const CircularPercent({
    Key? key,
    this.percent = 0.4,
    this.size = 56,
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
        ),
        child: Center(child: child),
      ),
    );
  }
}

class _CircularPercentStarPainter extends CustomPainter {
  final double percent;

  _CircularPercentStarPainter({this.percent = 0.5});

  @override
  void paint(Canvas canvas, Size size) {
    var angle = (360 * percent).rad();

    /// inside ?

    final paint1 = Paint();
    paint1.color = const Color(0xffDBDFF1);
    paint1.style = PaintingStyle.stroke;
    paint1.strokeWidth = 2;

    final paint2 = Paint();
    paint2.color = AppColors.primaryPurple;
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

  const CircularPercentStar({
    Key? key,
    required this.percent,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercent(
      percent: percent,
      size: size,
      child: _CircularTitleStar(
        percent: percent,
      ),
    );
  }
}

/// child for circular preloader.
class _CircularTitleStar extends StatelessWidget {
  final double percent;

  const _CircularTitleStar({Key? key, required this.percent}) : super(key: key);

  String get percentString =>
      (percent * 100).round().toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(AppIcons.star_2, color: AppColors.primaryPurple, size: 12),
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
                color: AppColors.appbarIconGrey,
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "%",
              style: TextStyle(
                color: AppColors.appbarIconGrey,
                fontSize: 10.11,
                height: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
