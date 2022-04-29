import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

import 'voucher_search.dart';

export 'voucher_search/voucher_search.dart';

part 'model.dart';
part 'vouchers_state.dart';

class VouchersPage extends StatefulWidget {
  static int getUrlIdAsTabIndex(String id) {
    return RouterUtils.getUrlIdAsTabIndex(_kBottomMenuNav, id);
  }

  static bool isValidUrlParam(String id) {
    return RouterUtils.isValidUrlParam(_kBottomMenuNav, id);
  }

  static const url = "Vouchers";

  final int currentTab;

  const VouchersPage({Key? key, this.currentTab = 0}) : super(key: key);

  @override
  createState() => _VouchersPage();
}

class _VouchersPage extends _VouchersState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Vouchers',
        actions: [
          SearchButton(
            onTap: onSearchTap,
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: IndexedStack(
          index: currentIndex,
          children: const [
            VouchersOperatingPage(),
            VouchersLogsPage(),
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

  int get currentIndex => widget.currentTab;

  void onBottomNavTap(int index) {
    var url = '/vouchers/tab/' + _kBottomMenuNav[index].urlId;
    context.go(url);
  }
}
