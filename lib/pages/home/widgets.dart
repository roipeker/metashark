part of 'home.dart';


class _HomeWidget extends StatelessWidget {
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

  const _HomeWidget({
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


class _MyTeamWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title, label1, value1, label2, value2, label3, value3;

  const _MyTeamWidget({
    Key? key,
    this.onTap,
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
    return _HomeWidget(
      onTap: onTap,
      inkForeground: false,
      background: BoxDecoration(
        gradient: _HomeWidget.getLinearGradient(
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

class _MyPackageWidget extends StatelessWidget {
  final PlanCardVo data;
  final VoidCallback? onTap;

  const _MyPackageWidget({Key? key, required this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _HomeWidget(
      onTap: onTap,
      background: BoxDecoration(
        gradient: _HomeWidget.getLinearGradient(data.colors),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "My package",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          kGap4,
          Text(
            data.type.toUpperCase(),
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          kGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...List.generate(
                data.ranking,
                    (index) => SvgPicture.asset(
                  SvgIcons.diamondBlue,
                ),
              ).separator(const Gap(2)),
            ],
          ),
        ],
      ),
    );
  }
}

///
///
///

class _MyPlanInfoWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title, earned, stalking;

  const _MyPlanInfoWidget({
    Key? key,
    required this.title,
    required this.earned,
    required this.stalking,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _HomeWidget(
      onTap: onTap,
      background: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // CardBadgeGold(),
            ],
          ),
          kGap16,
          CardRowTitle(
            label: "Total earned",
            value: earned,
          ),
          kGap16,
          CardRowTitle(
            label: "Total in Stalking",
            value: stalking,
          ),
        ],
      ),
    );
  }
}

///
///


class _MyRankWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String category;
  final int rating;
  final String nextCategory;
  final int nextRating;
  final double percent;

  const _MyRankWidget({
    Key? key,
    this.onTap,
    this.category = 'Boss',
    this.rating = 4,
    this.nextCategory = 'KING',
    this.nextRating = 5,
    this.percent = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _HomeWidget(
      onTap: onTap,
      background: BoxDecoration(
        gradient: _HomeWidget.getLinearGradient(
          const [Color(0xff7E4BEA), Color(0xff9A2ACE)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "My rank",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          _TitleStars(
            title: 'BOSS',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            gap: 16,
            rating: rating,
            starSize: 24,
          ),

          ///
          kGap16,
          const Divider(color: Colors.white54),
          kGap16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Next rank",
                    style: TextStyle(
                      color: Color(0xffb9b9c3),
                      fontSize: 16,
                    ),
                  ),
                  _TitleStars(
                    title: nextCategory,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    gap: 8,
                    rating: nextRating,
                    starSize: 18,
                  ),
                ],
              ),
              CircularPercentStar(
                percent: percent,
                style: TextStyle(
                  // AppColors.appbarIconGrey
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                borderColor: Color(0xffDBDFF1),
                foregroundColor: Color(0xffFF2CD0),
                size: 56,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _TitleStars extends StatelessWidget {
  final TextStyle style;
  final double starSize;
  final int rating;
  final String title;
  final double gap;

  const _TitleStars({
    Key? key,
    required this.title,
    required this.style,
    this.gap = 16,
    this.starSize = 24,
    this.rating = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            // fontSize: 24,
            // fontWeight: FontWeight.w700,
          ).merge(style),
        ),
        Gap(gap),
        StarRating(
          count: rating,
          size: starSize,
        ),
      ],
    );
  }
}

///
///


class _MyOfficeWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String barLabel;
  final double barPercent;
  final Color color;
  final VoidCallback? onTap;

  const _MyOfficeWidget({
    Key? key,
    this.onTap,
    this.title = 'My office',
    this.subtitle = 'Activated:04/23/2022',
    this.color = AppColors.green,
    this.status = 'Active',
    this.barLabel = '347 days',
    this.barPercent = 0.7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _HomeWidget(
      onTap: onTap,
      background: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.greyAccesoryIconColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                status,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ).copyWith(color: color),
              ),
            ],
          ),
          kGap16,
          CardLabelProgressBar(
            title: 'Left',
            label: barLabel,
            percent: barPercent,
            barForegroundColor: color,
          ),
        ],
      ),
    );
  }
}
