part of 'voucher_details_sheet.dart';

abstract class _VoucherDetailsSheetState extends State<VoucherDetailsSheet> {
  ScrollController? get scrollController {
    return ModalScrollController.of(context);
  }

  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency = currencyOptions.first.obs();
  final amountControl = AppTextControl();
  final activationCodeControl = AppTextControl();

  VoucherMode get mode => widget.mode;

  VoucherType get type => widget.type;

  String get buttonLabel {
    return mode.isCode() ? 'Activate' : 'Pay';
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      scrollController?.addListener(_onScrollUpdate);
    });
    super.initState();
  }

  void _onScrollUpdate() {
    final s = scrollController!;
    double maxScroll = s.position.maxScrollExtent;
    double currentScroll = s.position.pixels;
    if (currentScroll > maxScroll) {
      s.position.jumpTo(maxScroll);
    }
  }

  String get voucherTitle => 'Voucher ID: ${widget.voucherId}';

  Future<void> onPayTap() async {
    var result = await context
        .openModalSheet<bool?>(const ConfirmationFormSheet(showEmail2: false));
    if (result == true) {
      await 0.5.delay();
      context.navigator()?.pop();
    }
  }

  void onUserCardTap() {
    context.toastNotImplemented();
  }

  @override
  void dispose() {
    activationCodeControl.dispose();
    amountControl.dispose();
    currency.dispose();
    super.dispose();
  }

  FutureOr onShareTap() async {
    var result = await NativeUtils.share(
      subject: 'Metashark wallet address',
      message: 'Something to share.',
    );
  }

  FutureOr onCopyTap() async {
    await Clipboard.setData(ClipboardData(text: 'metashark'));
    AppToast.infoIcon(
      message: 'MetaShark copied to clipboard!',
      icon: Icons.content_copy,
    );
  }
}
