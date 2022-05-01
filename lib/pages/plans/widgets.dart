part of 'plans.dart';

/// ---

class PlanCardWidget extends StatelessWidget {
  final VoidCallback? onShowGiftsTap, onBuyTap;
  final PlanCardVo data;

  const PlanCardWidget({
    Key? key,
    required this.data,
    this.onShowGiftsTap,
    this.onBuyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 10,
      clip: Clip.antiAlias,
      color: Colors.white,
      borderRadius: kBorderRadius8,
      padding: EdgeInsets.zero,
      // padding: kPad16.copyWith(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(
            title: data.type,
            colors: data.colors,
            ranking: data.ranking,
          ),
          Padding(
            padding: kPadH16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                kGap16,
                Text(
                  data.title,
                  // "50-100 MTS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff5e5873),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                kGap32,
                Row(
                  children: [
                    SmallAppCardTextDetails(
                      label: 'Token Bonus:',
                      // value: '+20%',
                      value: data.tokenBonus,
                    ).exp(),
                    kGap16,
                    SmallAppCardTextDetails(
                      label: 'Staking:',
                      // value: '36% year',
                      value: data.staking,
                    ).exp(),
                  ],
                ),
                kGap16,
                SmallAppCardTextDetails(
                  label: 'Lock Up:',
                  value: data.lockup,
                  // value: '12 months',
                ),
                kGap16,
                Row(
                  children: [
                    SmallAppCardTextDetails(
                      label: 'Direct Bonus:',
                      // value: '11%',
                      value: data.directBonus,
                    ).exp(),
                    kGap16,
                    SmallAppCardTextDetails(
                      label: 'Binary Bonus:',
                      // value: '11%',
                      value: data.binaryBonus,
                    ).exp(),
                  ],
                ),
                kGap16,
                Row(
                  children: [
                    SmallAppCardTextDetails(
                      label: 'Binary Limit:',
                      // value: '150 MTS/day',
                      value: data.binaryLimit,
                    ).exp(),
                    kGap16,
                    SmallAppCardTextDetails(
                      label: 'Matching Bonus',
                      // value: '3 Levels',
                      value: data.matchingBonus,
                    ).exp(),
                  ],
                ),
                kGap16,
                SizedBox(
                  height: 47,
                  child: OutlinedButton.icon(
                    icon: const Icon(AppIcons.card_giftcard, size: 20),
                    onPressed: onShowGiftsTap,
                    label: const Text('Show gifts'),
                  ),
                ),
                kGap16,
                AppElevatedButton.primary(
                  child: const Text('Buy'),
                  onTap: onBuyTap,
                  extended: true,
                ),
                kGap16,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final List<Color> colors;
  final String title;
  final int ranking;

  const _Header({
    Key? key,
    required this.colors,
    required this.title,
    required this.ranking,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          kGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                ranking,
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