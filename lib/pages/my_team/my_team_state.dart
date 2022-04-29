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
    context.openModalSheet(ReferralLoginSheet());
  }

  void onItemTap() {
    context.openModalSheet(PartnerInfoSheetView());
  }


  void onSearchTap() {}

}
