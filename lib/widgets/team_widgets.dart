import 'package:metashark/commons.dart';

final _kTeamColors = {
  Brightness.light: [AppColors.primaryPurple10, AppColors.darkGrey],
  Brightness.dark: [AppColors.appbarIconGrey.withOpacity(.5), Colors.white],
};

class TeamRowCard extends StatelessWidget {
  final IconData iconData;
  final String label, value;
  final Brightness? brightness;

  const TeamRowCard({
    Key? key,
    this.brightness,
    required this.iconData,
    required this.label,
    required this.value,
  }) : super(key: key);

  List<Color> _getColors(Brightness? brightness) {
    brightness ??= Brightness.light;
    return _kTeamColors[brightness]!;
  }

  @override
  Widget build(BuildContext context) {
    var _brightness = brightness ?? context.theme.brightness;
    final _colors = _getColors(_brightness);
    final backgroundColor = _colors[0];
    final foregroundColor = _colors[1];
    return AppCard(
      padding: kPadH16V8,
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 18,
                color: foregroundColor,
              ),
              kGap8,
              Text(
                label,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: foregroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
