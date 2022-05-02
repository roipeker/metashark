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

// class TeamHistoryRecord {
//   final TeamMemberVo data;
//   TeamHistoryRecord({required this.data});
//   String get url {
//     return data.username;
//   }
// }

class _PartnerDetailsPage extends _PartnerDetailsState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: CommonAppBar(
          title: appbarTitle,
          leading: SpecialBackButton(
            onResolvePop: onResolvePop,
            history: _teamHistory,
            onSelected: onHistorySelect,
          ),
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
                          14,
                          (index) {
                            var vo = searchData[index];
                            return TeamLoginItem(
                              title: vo.name,
                              subtitle: vo.email,
                              rating: vo.rating,
                              onTap: () => onItemTap(vo),
                            );
                          },
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

class SpecialBackButton extends StatelessWidget {
  final List<TeamMemberVo> history;
  final ValueChanged<TeamMemberVo> onSelected;
  final VoidCallback? onResolvePop;

  const SpecialBackButton({
    Key? key,
    required this.onResolvePop,
    required this.history,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasHistory = history.isNotEmpty;
    final menu = RootMenu.of(context);
    final hasDrawer = menu != null;
    var canPop = Navigator.canPop(context);
    if (!hasHistory && !canPop && hasDrawer) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: menu.openDrawer,
      );
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: !hasHistory ? null : () => _openMenu(context),
      child: IconButton(
        icon: const BackButtonIcon(),
        onPressed: () {
          if (canPop) {
            /// special handler for pop.
            onResolvePop?.call();
            //// _matches.remove(_matches.last);
            // Navigator.maybePop(context);
          } else if (hasHistory) {
            _openMenu(context);
          } else {
            menu?.openDrawer();
          }
        },
      ),
    );
  }

  void _openMenu(BuildContext context) {
    showMenu(
      shape: kBorder8,
      elevation: 4,
      context: context,
      items: [
        ...history.map2(
          (e) {
            return PopupMenuItem(
              padding: kPad8,
              // enabled: e.username != current.username,
              textStyle: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              height: 35,
              onTap: () => onSelected(e),
              child: Row(
                children: [
                  Circle(
                    color: const Color(0xff9E95F5),
                    child: Text(
                      e.name[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  kGap16,
                  Text(
                    e.username,
                    style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 14,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              value: e,
            );
          },
        )
      ],
      position: RelativeRect.fill,
      // initialValue: current,
    );
  }
}
