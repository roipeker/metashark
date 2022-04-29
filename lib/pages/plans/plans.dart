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
              padding: kPad16,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                _BronzeCard(),
                kGap16,
                _PlanInfoCard(),
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
                _ContractCard(type: kContractGold),
                kGap16,
                _ContractCard(type: kContractBronze),
                kGap16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
