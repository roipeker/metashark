part of 'vouchers_operating.dart';

abstract class _VouchersOperatingState extends State<VouchersOperatingPage> {
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

  void onCreateVoucherTap() {
    context.push('/vouchers/create');
    // context.pushNamed(CreateVoucherPage.url);
    // context.toastNotImplemented();
  }

  void onVoucherTap({required String id}) {
    // context.toastNotImplemented();
    context.openModalSheet(
      VoucherDetailsSheet(
        voucherId: id,
        mode: VoucherMode.pay,
        type: VoucherType.other,
      ),
    );
  }
}
