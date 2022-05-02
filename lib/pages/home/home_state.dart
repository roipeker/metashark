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

  void onMyUserTap() {
    context.openModalSheet(
      const ReferralLoginSheet(type: ReferralSheetType.login),
    );
  }

  void onMyPackageTap() {
    context.goNamed(PlansPage.url);
  }

  void onMyTeamTap() {
    context.goNamed(MyTeamPage.url);
  }

  void onMyRankTap() {
    context.goNamed(CareerPage.url);
  }

  void onMyPlanInfoPackageTap() {
    context.goNamed(PlansPage.url);
  }

  void onMyPlanInfoTap() {
    context.goNamed(SteakingPage.url);
  }

  void onMyOfficeTap() {
    context.go('/plans/tab/subscribe');
  }

  void onCurrencyTap() {
    context.openModalSheet(const ChartCurrencySheet());
  }

  void onEarnedTap() {
    context.openModalSheet(const ChartEarnedSheet());
    // context.toastNotImplemented();
  }
}
