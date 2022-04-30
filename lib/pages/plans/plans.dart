import 'package:metashark/commons.dart';

part 'plans_state.dart';
part 'widgets.dart';

class PlansPage extends StatefulWidget {
  static const url = "Plans";

  const PlansPage({Key? key}) : super(key: key);

  @override
  createState() => _PlansPage();
}

class _PlansPage extends _PlansState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Plans'),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: ListView(
              padding: kPadH16,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              clipBehavior: Clip.none,
              children: [
                kGap16,
                Text(
                  "Steaking",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff5e5873),
                    fontSize: 16,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                kGap16,

                /// build titanium card.
                PlanCardTitanium(
                  onBuyTap: () {},
                  onShowGiftsTap: () {},
                ),

                // _BronzeCard(),
                // kGap16,
                // MyPlanInfoCard(),
                // kGap32,
                // Text(
                //   "My contracts",
                //   style: TextStyle(
                //     color: AppColors.darkGrey,
                //     fontSize: 20,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // kGap16,
                // PlanContractCard(type: kContractGold),
                // kGap16,
                // PlanContractCard(type: kContractBronze),
                kGap16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
