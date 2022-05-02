part of 'farming.dart';

abstract class _FarmingState extends State<FarmingPage> {
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
    context.pushNamed(FarmingContractPage.url, params: {'id': contractId});
  }
}
