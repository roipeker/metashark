import 'package:metashark/commons.dart';

part 'steaking_state.dart';

class SteakingPage extends StatefulWidget {
  static const url = "/steaking";

  const SteakingPage({Key? key}) : super(key: key);

  @override
  createState() => _SteakingPage();
}

class _SteakingPage extends _SteakingState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Steaking'),
      body: CommonScrollableBody(
        clipBehavior: Clip.none,
        padding: kPad16,
        children: [
          MyPlanInfoCard(),
          kGap32,
          Text(
            "My contracts",
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          kGap16,
          PlanContractCard(type: kContractGold),
          kGap16,
          PlanContractCard(type: kContractBronze),
          kGap16,
        ],
      ),
    );
  }
}
