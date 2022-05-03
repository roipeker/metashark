part of 'create_token_sheet.dart';

abstract class _CreateTokenSheetState extends State<CreateTokenSheet> {
  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency = currencyOptions.first.obs();
  final amountTec = AppTextControl();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    currency.dispose();
    amountTec.dispose();
    super.dispose();
  }

  void onAddTap() {
    context.navigator()?.pop();
  }
}
