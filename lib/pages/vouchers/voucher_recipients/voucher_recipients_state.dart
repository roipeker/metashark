part of 'voucher_recipients.dart';

abstract class _VoucherRecipientsState extends State<VoucherRecipientsPage> {
  final scrollController = ScrollController();

  final toggles = List.generate(3, (index) => false.obs());

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    for (final rx in toggles) {
      rx.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void onSearchTap() {}

  void onClearListTap() {
    for (final obj in toggles) {
      obj(false);
    }
  }
}
