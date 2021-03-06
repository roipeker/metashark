part of 'buying_package_sheet.dart';

abstract class _BuyingPackageSheetState extends State<BuyingPackageSheetView> {
  final amountTec = AppTextControl();

  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency = currencyOptions.first.obs();

  void onPayTap() {
    context.navigator()?.pop();
  }

  void onMaxTap() {
    amountTec.text = '1000000';
    amountTec.editor.selection = TextSelection.collapsed(
      offset: amountTec.text.length,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    amountTec.dispose();
    currency.dispose();
    super.dispose();
  }
}
