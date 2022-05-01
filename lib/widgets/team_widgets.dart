import 'package:metashark/commons.dart';
import 'package:my_commons/utils/rect_layout_builder.dart';

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

/// -
///

class UserTopCardShare extends StatelessWidget {
  final VoidCallback? onShareTap;
  final VoidCallback? onTap;
  final String title, subtitle;
  final String? imageUrl;
  final int rating;

  const UserTopCardShare({
    Key? key,
    this.onTap,
    this.onShareTap,
    required this.rating,
    required this.title,
    required this.subtitle,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: kBorder8,
      onPressed: onTap,
      color: AppColors.appbarIconGrey,
      child: Padding(
        padding: kPad16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonAvatar(
                  radius: 32 / 2,
                  label: title,
                  imageUrl: imageUrl,
                ),
                kGap16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        kGap8,
                        StarRating(
                          count: rating,
                        ),
                      ],
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xffb9b9c3),
                        fontSize: 14,
                      ),
                    )
                  ],
                ).exp(),
              ],
            ).exp(),
            Transform.translate(
              offset: const Offset(10, -8),
              child: IconButton(
                onPressed: onShareTap,
                padding: EdgeInsets.zero,
                icon: const Icon(
                  AppIcons.share,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// --
///

class TeamCard extends StatelessWidget {
  final String title, label1, value1, label2, value2, label3, value3;

  const TeamCard({
    Key? key,
    this.title = "Моя команда",
    this.label1 = 'Партнеры',
    this.value1 = '12',
    this.label2 = 'Структура',
    this.value2 = '10 000',
    this.label3 = 'Активные',
    this.value3 = '3890',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return RectLayoutChangedBuilder(
      builder: (_, rect, child) {
        var ratio = rect.size.aspectRatio;
        return Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: kBoxShadow4,
            gradient: RadialGradient(
              center: Alignment.topLeft,
              colors: const [
                Color(0xffDE8114),
                Color(0xffD32A86),
              ],
              // radius: 2 * size.aspectRatio / 2,
              radius: 2 * ratio / 2,
            ),
          ),
          padding: kPad16,
          child: child,
        );
      },
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
