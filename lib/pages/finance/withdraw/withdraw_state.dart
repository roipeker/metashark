part of 'withdraw.dart';

abstract class _WithdrawState extends State<WalletWithdrawPage> {
  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency = currencyOptions.first.obs();

  List<String> get networkOptions => MockDataFactory.cryptoNetworkOptions;
  late final Rx<String> currencyNetwork = networkOptions.first.obs();

  final amountTec = AppTextControl();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    currency.dispose();
    currencyNetwork.dispose();
    amountTec.dispose();
    super.dispose();
  }

  void onNextTap() {
    // if (context.canPop()) {
    //   context.pop();
    // } else {
      context.pushNamed(WithdrawConfirmationPage.url);
      // context.goNamed(FinancePage.url);
    // }
  }

  void onMaxTap() {
    amountTec.text = '1000000';
    amountTec.editor.selection = TextSelection.collapsed(
      offset: amountTec.text.length,
    );
  }
}
