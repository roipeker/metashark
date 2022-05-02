part of 'deposit.dart';

abstract class _DepositState extends State<WalletDepositPage> {
  // final _qrCode = '1NeJEFzY8PbVS9RvYPfDP93iqXxHjav791'.obs();
  // String get qrCode =>_qrCode();
  // String qrCode = '1NeJEFzY8PbVS9RvYPfDP93iqXxHjav791';

  // String get qrCode => currency().address;
  String get qrCode {
    /// hacky.
    isLoading();
    return _address;
  }

  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency = currencyOptions.first.obs();

  List<String> get networkOptions => MockDataFactory.cryptoNetworkOptions;
  late final Rx<String> currencyNetwork = networkOptions.first.obs();

  final isLoading = false.obs();

  @override
  void initState() {
    _address = currency().address;
    currency.addListener(onCurrencyChange);
    currencyNetwork.addListener(onCurrencyChange);
    super.initState();
  }

  Timer? _delay;
  String _address = '';
  //currency().address
  FutureOr onCurrencyChange() async {
    isLoading.value = true;
    if (_delay?.isActive == true) {
      _delay?.cancel();
    }
    _delay = Timer(const Duration(seconds: 2), () {
      _address = currency().address;
      isLoading.value = false;
    });
  }

  @override
  void dispose() {
    currency.dispose();
    currencyNetwork.dispose();
    super.dispose();
  }

  FutureOr onShareTap() async {
    var result = await NativeUtils.share(
      subject: 'Metashark wallet address',
      message: 'Bitcoin wallet address: $qrCode',
    );
  }

  FutureOr onCopyTap() async {
    await Clipboard.setData(ClipboardData(text: qrCode));
    AppToast.infoIcon(
      message: 'Wallet address copied to clipboard!',
      icon: Icons.content_copy,
    );
  }
}
