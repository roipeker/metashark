part of 'my_team.dart';

abstract class _MyTeamState extends State<MyTeamPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  List<TeamMemberVo> get searchData => _teamData;
  late final _teamData = MockDataFactory.randomTeamMemberList();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onMyPartnersTap() {
    context.pushNamed(MyRegisteredPartnersPage.url);
  }

  void onBinarTap() {
    context.go('/binary/structure?id=2');
    // context.pushNamed(MyRegisteredPartnersPage.url);
  }

  void onShareTap() {
    NativeUtils.share(
      message: 'My team share!',
    );
  }

  void onTopCardTap() {
    context.openModalSheet(
      const ReferralLoginSheet(type: ReferralSheetType.login),
    );
  }

  void onReferralTap() {
    context.openModalSheet(
      const ReferralLoginSheet(type: ReferralSheetType.referral),
    );
  }

  FutureOr onItemTap(TeamMemberVo vo) async {
    context.pushNamed(PartnerDetailsPage.url, params: {
      'id': vo.username,
    });
    // /// MOVEEED TO BINARY DETAILS!!!!
    // final result = await context
    //     .openModalSheet<PartnerResult?>(const PartnerInfoSheetView());
    // if (result == PartnerResult.command) {
    //   context.pushNamed(PartnerDetailsPage.url, params: {'id': '123'});
    // } else if (result == PartnerResult.binary) {
    //   context.push('/binary/structure?id=4');
    // }
  }

  // List<String> get searchData => _kTeamData;

  FutureOr onSearchTap() async {
    final result = await showSearch<TeamMemberVo?>(
      context: context,
      delegate: MyTeamSearchDelegate(searchData: searchData),
      // query: lastSearch,
      useRootNavigator: false,
    );
    if (result != null) {
      /// GO FOR THE ITEM
      onItemTap(result);
    }
    // lastSearch = result ?? '';
    // trace("Result... $result");
  }

  String lastSearch = '';
}

// final _kTeamData = MockDataFactory.randomTeamSearchData();
// final _kTeamData = MockDataFactory.randomTeamMemberList();

class TeamMemberVo {
  final String name, email, username;
  final int id;
  final int rating;

  const TeamMemberVo({
    required this.name,
    required this.email,
    required this.username,
    this.id = 0,
    this.rating = 0,
  });
}
