import 'package:metashark/commons.dart';
import 'package:my_commons/utils/rect_layout_builder.dart';

import 'modals/modals.dart';

part 'my_team_state.dart';
part 'widgets.dart';

class MyTeamPage extends StatefulWidget {
  static const url = "My Team";

  const MyTeamPage({Key? key}) : super(key: key);

  @override
  createState() => _MyTeamPage();
}

class _MyTeamPage extends _MyTeamState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: CommonAppBar(
          title: 'My team',
          actions: [
            SearchButton(onTap: onSearchTap),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: ListView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                kGap16,
                SafeArea(
                  child: _UserCardTop(
                    onTap: onTopCardTap,
                    onShareTap: onShareTap,
                  ).paddingSymmetric(horizontal: 16),
                ),
                kGap16,
                SafeArea(child: _TeamCard().paddingSymmetric(horizontal: 16)),
                kGap16,
                SafeArea(
                  child: _UserCard(
                    onTap: onTopCardTap,
                  ).paddingSymmetric(horizontal: 16),
                ),
                kGap16,
                SafeArea(
                  child: Padding(
                    padding: kPadH16,
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: onMyPartnersTap,
                        child: Text('My registered partners'),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: SafeArea(
                    left: false,
                    right: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kGap16,
                        ...List.generate(
                            5,
                            (index) => _LoginItem(onTap: () {
                                  onItemTap();
                                })).separator(
                          kDivider1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
