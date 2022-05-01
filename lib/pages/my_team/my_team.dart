import 'package:metashark/commons.dart';
import 'package:metashark/pages/my_team/my_team_search.dart';

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
        body: Scrollbar(
          controller: scrollController,
          child: RefreshIndicator(
            onRefresh: onRefreshPull,
            child: ListView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                kGap16,
                SafeArea(
                  child: UserTopCardShare(
                    onTap: onTopCardTap,
                    onShareTap: onShareTap,
                    title: 'First & last name',
                    subtitle: 'Login',
                    imageUrl: '',
                    rating: 5,
                  ).paddingSymmetric(horizontal: 16),
                ),
                kGap16,
                SafeArea(
                  child: const TeamCard(
                    title: "My team",
                    label1: 'Partners',
                    value1: '12',
                    label2: 'Structure',
                    value2: '10 000',
                    label3: 'Active',
                    value3: '3890',
                  ).paddingSymmetric(horizontal: 16),
                ),
                kGap16,
                SafeArea(
                  child: UserReferralCard(
                    onTap: onTopCardTap,
                    cardTitle: "Referral",
                    title: "First & last name",
                    subtitle: "Login",
                    imageUrl: null,
                    rating: 5,
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
                kGap16,
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
