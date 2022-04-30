part of 'my_team.dart';

abstract class _MyTeamState extends State<MyTeamPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

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
    context.openModalSheet(const ReferralLoginSheet());
  }

  void onItemTap() {
    context.openModalSheet(const PartnerInfoSheetView());
  }

  List<String> get searchData => _kTeamData;

  FutureOr onSearchTap() async {
    final result = await showSearch<String?>(
      context: context,
      delegate: MyTeamSearchDelegate(searchData: searchData),
      query: lastSearch,
    );
    lastSearch = result ?? '';
    trace("Result... $result");
  }

  String lastSearch = '';
}

final _kTeamData = MockDataFactory.randomTeamSearchData();
