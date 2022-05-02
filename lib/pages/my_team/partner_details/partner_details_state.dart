part of 'partner_details.dart';

abstract class _PartnerDetailsState extends State<PartnerDetailsPage> {
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

  void onShareTap() {
    NativeUtils.share(
      message: 'My team share!',
    );
  }

  void onTopCardTap() {
    // context.openModalSheet(const ReferralLoginSheet());
    context.openModalSheet(
      const ReferralLoginSheet(type: ReferralSheetType.login),
    );
  }

  void onBinarTap() {
    context.push('/binary/structure?id=2');
    // context.pushNamed(MyRegisteredPartnersPage.url);
  }

  FutureOr onItemTap(TeamMemberVo vo) async {
    context.pushNamed(PartnerDetailsPage.url, params: {
      'id': vo.username,
    });
    // final result = await context
    //     .openModalSheet<PartnerResult?>(const PartnerInfoSheetView());
    // if (result == PartnerResult.command) {
    //   context.pushNamed(PartnerDetailsPage.url, params: {'id': '123'});
    // } else if (result == PartnerResult.binary) {
    //   context.push('/binary/structure?id=4');
    // }
  }


  FutureOr onSearchTap() async {
    final result = await showSearch<TeamMemberVo?>(
      context: context,
      delegate: MyTeamSearchDelegate(searchData: searchData),
      query: lastSearch,
    );
    // lastSearch = result ?? '';
    trace("Result... $result");
  }

  String lastSearch = '';
}

// final _kTeamData = MockDataFactory.randomTeamSearchData();
// final _kTeamData = MockDataFactory.randomTeamMemberList();
