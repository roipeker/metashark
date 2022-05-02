part of 'partner_details.dart';

List<TeamMemberVo> _teamHistory = [];

abstract class _PartnerDetailsState extends State<PartnerDetailsPage> {
  String get appbarTitle {
    return widget.teamId;
  }

  void onResolvePop() {
    final matches = router.routerDelegate.matches;
    // pop to page that is not /team/
    var numPops = 0;
    for (var i = matches.length - 1; i >= 0; i--) {
      var match = matches[i];
      if (match.subloc.startsWith('/team/')) {
        ++numPops;
      } else {
        break;
      }
    }
    var diff = matches.length - numPops;
    if (diff > 0) {
      for (var i = 0; i < numPops; ++i) {
        context.pop();
      }
    } else {
      context.go('/myteam/');
    }
    // trace("DIFFF: ", diff, numPops);

    // trace(numPops);
    // for( var match in matches ){
    //   /// history.... remove all
    // }
    //
    // http://localhost:53351/#/myteam
    // Navigator.maybePop(context);
  }

  void onHistorySelect(TeamMemberVo vo) {
    // pop from stack?
    var index = _teamHistory.indexOf(vo);
    if (index > -1) {
      _teamHistory = _teamHistory.sublist(0, index).toList();
    }
    var url = '/team/${vo.username}';
    context.go(url);
  }

  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  List<TeamMemberVo> get searchData => _teamData;

  // late final _teamData = MockDataFactory.randomTeamMemberList();
  late final List<TeamMemberVo> _teamData;

  @override
  void initState() {
    _teamData = List.of(_kBaseTeamData)..shuffle();
    // take teamId and search for the record?
    var vo = _getCurrentModel(widget.teamId) ?? _teamData.last;
    _teamHistory.add(vo);
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
    context.go('/binary/structure?id=2');
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

  static TeamMemberVo? _getCurrentModel(String teamId) {
    for (var p in _kBaseTeamData) {
      if (p.username == teamId) return p;
    }
    return null;
  }
}

final _kBaseTeamData = MockDataFactory.randomTeamMemberList(quantity: 100);

// final _kTeamData = MockDataFactory.randomTeamSearchData();
// final _kTeamData = MockDataFactory.randomTeamMemberList();
