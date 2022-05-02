import 'package:metashark/commons.dart';
import 'package:metashark/pages/farming/farming_contract/farming_contract.dart';

part 'farming_state.dart';

part 'widgets.dart';

class FarmingPage extends StatefulWidget {
  static const url = "/farming";

  const FarmingPage({Key? key}) : super(key: key);

  @override
  createState() => _FarmingPage();
}

class _FarmingPage extends _FarmingState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Farming'),
      body: CommonScrollableBody(
        clipBehavior: Clip.none,
        padding: kPad16,
        children: [
          Gap(50 - 16),
          _AnimatedBall(
            title: "Your profit today:",
            subtitle: "1670.00 MTS",
          ),
          Gap(50),
          // _AnimatedBall2(
          //   title: "Your profit today:",
          //   subtitle: "1670.00 MTS",
          // ),
          // Gap(50),
          // kGap32,
          MyPlanInfoCard(
            onPurchasePackageTap: onPurchasePackageTap,
          ),
          kGap32,
          Text(
            "My contracts",
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          // kGap16,
          // PlanContractCard(type: kContractGold),
          kGap16,
          PlanContractCard(
            contractId: "# 12345",
            trendingIcon: AppIcons.trending_up,
            trendingValue: '36%',
            trendingColor: AppColors.green,
            barValue: '6,5 MTS',
            barPercent: 0.65,
            type: kContractBronze,
            onTap: () {
              onContractTap("12345");
            },
          ),
          // kGap16,
          kGap16,
          PlanContractCard(
            contractId: "# 23456",
            trendingIcon: AppIcons.trending_up,
            trendingValue: '36%',
            trendingColor: AppColors.green,
            barValue: '6,5 MTS',
            barPercent: 0.65,
            onTap: () {
              onContractTap("23456");
            },
          ),
          kGap16,
        ],
      ),
    );
  }


}
