part of 'binary_statistics.dart';

abstract class _BinaryStatisticsState extends State<BinaryStatisticsPage> {
  String get titleText => 'Binary Statistics page';

  final scrollController = ScrollController();

  Future<void> onRefreshPull() async {
    await 2.seconds.delay();
  }

  void onUpgradeTap() {
    context.go('/plans/tab/farming?package_id=4');
    // context.goNamed(FarmingPage.url);
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
}
