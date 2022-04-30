import 'package:metashark/commons.dart';

part 'model.dart';
part 'plans_state.dart';
part 'widgets.dart';

class PlansPage extends StatefulWidget {
  static const url = "Plans";

  static int getUrlIdAsTabIndex(String id) {
    return RouterUtils.getUrlIdAsTabIndex(_kBottomMenuNav, id);
  }

  static bool isValidUrlParam(String id) {
    return RouterUtils.isValidUrlParam(_kBottomMenuNav, id);
  }

  final int currentTab;

  const PlansPage({Key? key, this.currentTab = 0}) : super(key: key);

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
        child: IndexedStack(
          index: currentIndex,
          children: const [
            PlansSteakingPage(),
            PlansSubscribePage(),
          ],
        ),
      ),
      bottomNavigationBar: CommonBottomNavBar(
        items: _kBottomMenuNav,
        onTap: onBottomNavTap,
        currentIndex: currentIndex,
      ),
    );
  }


}
