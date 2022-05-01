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
  final ContractTypeData? type;
  final VoidCallback? onTap;
  final String contractId;
  final IconData trendingIcon;
  final String trendingValue;
  final Color? trendingColor;
  final Color? barColor;
  final String barValue;
  final double barPercent;

  const PlanContractCard({
    Key? key,
    required this.trendingIcon,
    required this.contractId,
    required this.trendingValue,
    required this.trendingColor,
    required this.barValue,
    required this.barPercent,
    this.barColor,
    this.type,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return AppCard(
    //   elevation: 2,
    //   color: Colors.white,
    return AppMaterialButton(
      elevation: 2,
      onTap: onTap,
      color: Colors.white,
      padding: kPad16,
      shape: kBorder8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (type != null) ContractBadge(type: type!),
              Text(
                contractId,
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
                    trendingIcon,
                    size: 16,
                    color: trendingColor,
                  ),
                  kGap4,
                  Text(
                    trendingValue,
                    style: TextStyle(
                      color: trendingColor,
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
          CardLabelProgressBar(
            label: barValue,
            percent: barPercent,
            barForegroundColor: barColor??AppColors.lightViolet,
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

///
///
///

class VoucherIconTile extends StatelessWidget {
  final Color color;
  final IconData iconData;

  const VoucherIconTile({
    Key? key,
    this.iconData = AppIcons.subscriptions,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Icon(
        iconData,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}

///
///
/// /
///

class SmallAppCardTextDetails extends StatelessWidget {
  final String label, value;
  final String? helperText;

  const SmallAppCardTextDetails({
    Key? key,
    required this.label,
    required this.value,
    this.helperText,
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
          ),
          if (helperText != null)
            Text(
              helperText!,
              style: const TextStyle(
                color: Color(0xffb9b9c3),
                fontSize: 10,
              ),
            )
        ],
      ),
    );
  }
}
