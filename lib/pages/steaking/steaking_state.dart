part of 'steaking.dart';

abstract class _SteakingState extends State<SteakingPage> {
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

  void onPurchasePackageTap() {
    context.goNamed(PlansPage.url);
  }

  void onContractTap(String contractId) {
    context.pushNamed(SteakingContractPage.url, params: {'id': contractId});
  }
}
