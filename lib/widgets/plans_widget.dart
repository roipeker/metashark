
import 'package:metashark/commons.dart';

class MyPlanInfoCard extends StatelessWidget {
  const MyPlanInfoCard({Key? key}) : super(key: key);

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
              // CardBadgeGold(),
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
class PlanContractCard extends StatelessWidget {
  final ContractTypeData type;

  const PlanContractCard({
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
