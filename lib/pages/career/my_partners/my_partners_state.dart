part of 'my_partners.dart';

abstract class _MyPartnersState extends State<MyPartnersPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  void onLoginItemTap() {}

  void onAddLoginTap() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  void onPartnerItemTap() {}
  void onSearchTap() {
    AppToast.infoIcon(
      icon: Icons.warning,
      important: true,
      message: 'Search not implemented',
    );
  }
}
