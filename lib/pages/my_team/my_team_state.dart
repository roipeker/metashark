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
  void onBinarTap() {
    context.push('/binary/structure?id=2');
    // context.pushNamed(MyRegisteredPartnersPage.url);
  }

  void onShareTap() {
    NativeUtils.share(
      message: 'My team share!',
    );
  }

  void onTopCardTap() {
    context.openModalSheet(const ReferralLoginSheet());
  }

  FutureOr onItemTap() async {
    context.pushNamed(PartnerDetailsPage.url, params: {'id': '123'});
    // /// MOVEEED TO BINARY DETAILS!!!!
    // final result = await context
    //     .openModalSheet<PartnerResult?>(const PartnerInfoSheetView());
    // if (result == PartnerResult.command) {
    //   context.pushNamed(PartnerDetailsPage.url, params: {'id': '123'});
    // } else if (result == PartnerResult.binary) {
    //   context.push('/binary/structure?id=4');
    // }
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

class TeamMemberVo {
  final String name, email;
  final int id;
  final int rating;
  const TeamMemberVo({
    required this.name,
    required this.email,
    this.id = 0,
    this.rating = 0,
  });
}
