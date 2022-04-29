part of 'vouchers_logs.dart';

abstract class _VouchersLogsState extends State<VouchersLogsPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onSearchTap() {
    AppToast.infoIcon(
      icon: Icons.warning,
      important: true,
      message: 'Search not implemented',
    );
  }

  void onVoucherTap() {
    context.toastNotImplemented();
  }

}

