part of 'plans.dart';

class _BronzeCard extends StatelessWidget {
  const _BronzeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff2E9FD9),
        borderRadius: kBorderRadius20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Row(
        children: [
          Image.asset(
            Images.briefcase,
            fit: BoxFit.contain,
            cacheHeight: 50,
            cacheWidth: 50,
            height: 50,
            width: 50,
          ),
          kGap16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "BRONZE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  kGap16,
                  ...List.generate(
                    3,
                    (index) => const Icon(
                      AppIcons.trophy,
                      size: 24,
                      color: AppColors.starOrange,
                    ),
                  ),
                ],
              ),
              const Text(
                "50-100 MTS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// ---

class PlanCardTitanium extends StatelessWidget {
  final VoidCallback? onShowGiftsTap, onBuyTap;

  const PlanCardTitanium({
    Key? key,
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
          const _Header(),
          Padding(
            padding: kPad16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "50-100 MTS",
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
                    const _SmallCard(
                      label: 'Token Bonus:',
                      value: '+20%',
                    ).exp(),
                    kGap16,
                    const _SmallCard(
                      label: 'Staking:',
                      value: '36% year',
                    ).exp(),
                  ],
                ),
                kGap16,
                const _SmallCard(
                  label: 'Lock Up:',
                  value: '12 months',
                ),
                kGap16,
                Row(
                  children: [
                    const _SmallCard(
                      label: 'Direct Bonus:',
                      value: '11%',
                    ).exp(),
                    kGap16,
                    const _SmallCard(
                      label: 'Direct Bonus:',
                      value: '11%',
                    ).exp(),
                  ],
                ),
                kGap16,
                Row(
                  children: [
                    const _SmallCard(
                      label: 'Binary Limit:',
                      value: '150 MTS/day',
                    ).exp(),
                    kGap16,
                    const _SmallCard(
                      label: 'Matching Bonus',
                      value: '3 Levels',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff29518d), Color(0xff1c3d6d)],
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
          const Text(
            "TITANIUM",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700,
            ),
          ),
          kGap8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                5,
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

class _SmallCard extends StatelessWidget {
  final String label, value;

  const _SmallCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: kPad8,
      borderRadius: kBorderRadius4,
      color: AppColors.primaryPurple10,
      clip: Clip.none,
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
