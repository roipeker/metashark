import 'package:metashark/commons.dart';

import '../my_team_search.dart';

part 'partner_details_state.dart';

class PartnerDetailsPage extends StatefulWidget {
  static const url = "/partner-details";
  final String teamId;

  const PartnerDetailsPage({Key? key, this.teamId = ''}) : super(key: key);

  @override
  createState() => _PartnerDetailsPage();
}

class _PartnerDetailsPage extends _PartnerDetailsState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: CommonAppBar(
          title: 'Login (username)',
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
                    title: 'Some User First & last name',
                    subtitle: 'Login',
                    imageUrl: '',
                    rating: 3,
                  ).paddingSymmetric(horizontal: 16),
                ),
                kGap16,
                SafeArea(
                  child: MyTeamWidget(
                    gradient: HomeCardWidget.getLinearGradient(
                      const [
                        Color(0xff14A2DE),
                        Color(0xff7433FF),
                      ],
                      stops: [0, 1],
                    ),
                    title: "Team",
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
                        ...List.generate(
                          5,
                          (index) => TeamLoginItem(
                            onTap: () {
                              onItemTap();
                            },
                          ),
                        ).separator(
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
