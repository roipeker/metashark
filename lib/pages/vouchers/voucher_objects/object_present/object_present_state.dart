part of 'object_present.dart';

abstract class _ObjectPresentState extends State<ObjectPresentPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void onCreateTap() {
    context.toastNotImplemented();
  }

  void onObjectsTap() {
    context.pushNamed(VoucherObjectsPage.url);
  }

  void onRecipientsTap() {
    context.pushNamed(VoucherRecipientsPage.url);
  }
}

