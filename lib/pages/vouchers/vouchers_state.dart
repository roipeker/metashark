part of 'vouchers.dart';

abstract class _VouchersState extends State<VouchersPage> {
  final scrollController = ScrollController();

  List<String> get searchData => kVouchersData;

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  FutureOr onSearchTap() async {
    // showModal(
    //   context: context,
    //   builder: (ctx) {
    //     return const VoucherSearchModal();
    //   },
    // );
    // showBarModalBottomSheet(
    //   context: context,
    //   builder: (ctx) {
    //     return const VoucherSearchModal();
    //   },
    // );
    // showCupertinoModalBottomSheet(
    //   context: context,
    //   builder: (ctx) {
    //     return const VoucherSearchModal();
    //   },
    // );
    // showCupertinoModalPopup(
    //   context: context,
    //   builder: (ctx) {
    //     return const VoucherSearchModal();
    //   },
    // );
    // showCupertinoDialog(
    //   context: context,
    //   builder: (ctx) {
    //     return const VoucherSearchModal();
    //   },
    // );
    // showMaterialModalBottomSheet(
    //   context: context,
    //   builder: (ctx) {
    //     return const VoucherSearchModal();
    //   },
    // );
    // context.openModalSheet(child);
    // AppToast.infoIcon(
    //   icon: Icons.warning,
    //   important: true,
    //   message: 'Search not implemented',
    // );
    final result = await showSearch<String?>(
      context: context,
      delegate: VoucherSearchDelegate(searchData: searchData),
      query: lastSearch,
    );
    lastSearch = result ?? '';
    trace("Result... $result");
  }

  String lastSearch = '';
}

final kVouchersData = MockDataFactory.randomVouchers();
