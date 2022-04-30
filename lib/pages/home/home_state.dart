part of 'home.dart';

abstract class _HomeState extends State<HomePage> {
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
    // context.openModalSheet(ReferralLoginSheet());
  }

  void onItemTap() {
    // context.openModalSheet(PartnerInfoSheetView());
  }


  void onSearchTap() {}

}
