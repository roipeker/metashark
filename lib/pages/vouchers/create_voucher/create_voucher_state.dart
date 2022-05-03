part of 'create_voucher.dart';

abstract class _CreateVoucherState extends State<CreateVoucherPage> {
  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency;
  final activationType = ActivationType.code.obs();
  final scrollController = ScrollController();
  final amountTec = AppTextControl();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    amountTec.dispose();
    activationType.dispose();
    currency.dispose();
    super.dispose();
  }

  @override
  void initState() {
    currency = currencyOptions.first.obs();
    super.initState();
  }

  final voucherPersonal = false.obs();
  void onCreateTap() {
    var mode = activationType()==ActivationType.code ? VoucherMode.code : VoucherMode.pay;
    var type = voucherPersonal() ? VoucherType.me : VoucherType.other;
    context.openModalSheet(
      VoucherDetailsSheet(
        voucherId: '#0000000',
        mode: mode,
        type: type,
      ),
    );
    // if(context.canPop()){
    //   context.pop();
    // }
  }

  void onObjectsTap() {
    context.pushNamed(VoucherObjectsPage.url);
  }

  void onRecipientsTap() {
    context.pushNamed(VoucherRecipientsPage.url);
  }
}

enum ActivationType { code, payment }
