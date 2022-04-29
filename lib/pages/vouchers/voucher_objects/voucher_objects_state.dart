part of 'voucher_objects.dart';

abstract class _VoucherObjectsState extends State<VoucherObjectsPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onSearchTap(){

  }

  @override
  void initState() {
    super.initState();
  }

  void onItemTap() {
    context.toastNotImplemented();
  }
}

