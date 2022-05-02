part of 'home.dart';

class _MyPackageWidget extends StatelessWidget {
  final PlanCardVo data;
  final VoidCallback? onTap;

  const _MyPackageWidget({Key? key, required this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCardWidget(
      onTap: onTap,
      background: BoxDecoration(
        gradient: HomeCardWidget.getLinearGradient(data.colors),
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
  final VoidCallback? onTap, onPurchasePackageTap;
  final String title, earned, stalking;

  const _MyPlanInfoWidget({
    Key? key,
    required this.title,
    required this.earned,
    required this.stalking,
    this.onTap,
    this.onPurchasePackageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCardWidget(
      onTap: onTap,
      background: const BoxDecoration(
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
          kGap16,
          SizedBox(
            height: 44,
            child: AppElevatedButton.primary(
              child: const Text('Purchase a package'),
              onTap: onPurchasePackageTap,
            ),
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
    return HomeCardWidget(
      onTap: onTap,
      background: BoxDecoration(
        gradient: HomeCardWidget.getLinearGradient(
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
    return HomeCardWidget(
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
