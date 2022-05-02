part of 'plans_subscribe_details_sheet.dart';

abstract class _PlansSubscribeDetailsSheetState
    extends State<PlansSubscribeDetailsSheet> {
  final amountTec = AppTextControl();
  final automaticActivation = true.obs();

  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency = currencyOptions.first.obs();

  void onCardTap() {
    context.navigator()?.pop();
  }

  void onActivateTap() {
    context.navigator()?.pop();
  }

  @override
  void initState() {
    amountTec.text = '0.0589';
    super.initState();
  }

  @override
  void dispose() {
    amountTec.dispose();
    automaticActivation.dispose();
    currency.dispose();
    super.dispose();
  }
}
