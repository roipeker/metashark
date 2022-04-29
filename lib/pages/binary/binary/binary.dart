import 'package:metashark/commons.dart';

part 'binary_state.dart';

part 'model.dart';

class BinaryPage extends StatefulWidget {
  static const url = "/binary";

  static int getUrlIdAsTabIndex(String id) {
    return RouterUtils.getUrlIdAsTabIndex(_kBottomMenuNav, id);
  }

  static bool isValidUrlParam(String id) {
    return RouterUtils.isValidUrlParam(_kBottomMenuNav, id);
  }

  final int currentTab;

  const BinaryPage({Key? key, this.currentTab = 0}) : super(key: key);

  @override
  createState() => _BinaryPage();
}

class _BinaryPage extends _BinaryState {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: const CommonAppBar(
          title: 'Binary',
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [
            BinaryStatisticsPage(),
            BinaryStructurePage(),
          ],
        ),
        bottomNavigationBar: CommonBottomNavBar(
          items: _kBottomMenuNav,
          onTap: onBottomNavTap,
          currentIndex: currentIndex,
        ),
      ),
    );
  }

  int get currentIndex => widget.currentTab;
  void onBottomNavTap(int index) {
    var url = '/binary/' + _kBottomMenuNav[index].urlId;
    context.go(url);
  }
}
