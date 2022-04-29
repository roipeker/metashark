part of 'withdraw.dart';

abstract class _WithdrawState extends State<WalletWithdrawPage> {
  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency;

  final amountTec = AppTextControl();

  @override
  void initState() {
    currency = currencyOptions.first.obs();
    super.initState();
  }

  @override
  void dispose() {
    currency.dispose();
    amountTec.dispose();
    super.dispose();
  }
}
