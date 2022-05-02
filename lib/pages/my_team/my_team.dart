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
                  child: MyTeamWidget(
                    gradient: HomeCardWidget.getLinearGradient(
                      const [
                        Color(0xffDE8114),
                        Color(0xffDC6E2E),
                        Color(0xffD32A86),
                      ],
                      stops: [0, .2, 1],
                    ),
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
                    onTap: onReferralTap,
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
                      child: AppElevatedButton.primary(
                        onTap: onMyPartnersTap,
                        child: Text('My registered partners'),
                      ),
                    ),
                  ),
                ),
                kGap16,
                SafeArea(
                  child: Padding(
                    padding: kPadH16,
                    child: SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: onBinarTap,
                        child: Text('Go to binar'),
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
                        ...List.generate(20, (index) {
                          var vo = searchData[index];
                          return TeamLoginItem(
                            title: vo.name,
                            subtitle: vo.email,
                            rating: vo.rating,
                            onTap: () => onItemTap(vo),
                          );
                        }).separator(
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
