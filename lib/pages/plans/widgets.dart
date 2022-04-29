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

class _PlanInfoCard extends StatelessWidget {
  const _PlanInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 10,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "My Plan’s Info",
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CardBadgeGold(),
            ],
          ),
          // --
          kGap16,
          const CardLabelProgressBar(
            title: '30 456 MTS',
            label: '87%',
            percent: 0.87,
            barForegroundColor: AppColors.lightViolet,
          ),
          kGap16,
          const CardRowTitle(
            label: "Total in Stalking",
            value: "32 000 MTS",
          ),
        ],
      ),
    );
  }
}

/// --- contract card
///
class _ContractCard extends StatelessWidget {
  final ContractTypeData type;

  const _ContractCard({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 2,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContractBadge(type: type),
              const Text(
                "# 12354",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffb9b9c3),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    AppIcons.trending_up,
                    size: 16,
                    color: AppColors.green,
                  ),
                  kGap4,
                  Text(
                    "36%",
                    style: TextStyle(
                      color: Color(0xff28c76f),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // --
          kGap16,
          const CardLabelProgressBar(
            label: '6,5 MTS',
            percent: 0.6,
            barForegroundColor: AppColors.lightViolet,
          ),
        ],
      ),
    );
  }
}

/// ---

class ContractBadge extends StatelessWidget {
  final ContractTypeData type;

  const ContractBadge({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius4,
        gradient: type.gradient,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      child: Text(
        type.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
