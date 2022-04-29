part of 'binary_statistics.dart';

abstract class _BinaryStatisticsState extends State<BinaryStatisticsPage> {
  String get titleText => 'Binary Statistics page';

  final scrollController = ScrollController();

  Future<void> onRefreshPull() async {
    await 2.seconds.delay();
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
