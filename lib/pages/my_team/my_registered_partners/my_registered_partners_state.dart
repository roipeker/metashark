part of 'my_registered_partners.dart';

abstract class _MyRegisteredPartnersState
    extends State<MyRegisteredPartnersPage> {

  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  void onLoginItemTap() {
    context.openModalSheet(PartnerLoginSheet());
  }

  void onAddLoginTap() {
    context.openModalSheet(PartnerLoginSheet());
    // context.toastNotImplemented();
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
