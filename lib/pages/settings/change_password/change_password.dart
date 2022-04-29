import 'package:metashark/commons.dart';

part 'change_password_state.dart';
part 'widgets.dart';

class ChangePasswordPage extends StatefulWidget {
  static const url = "/change-password";

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends _ChangePasswordState {
  List<String> get tabsTitles => [
        'Password',
        '2-FA',
      ];

  List<Tab> get tabsData => tabsTitles.map2(
        (text) => Tab(text: text),
      );

  @override
  Widget build(BuildContext context) {
    return FigmaLink(
      node: null,
      child: Scaffold(
        appBar: CommonAppBar(
          title: 'Change password',
        ),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: tabsData,
              indicatorWeight: 3,
              indicatorColor: context.theme.primaryColor,
              onTap: onTabTap,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  _ChangePasswordTab1(),
                  _ChangePasswordTab2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTabTap(int value) {
    FocusScope.of(context).unfocus();
  }
}
