part of 'deposit.dart';

abstract class _DepositState extends State<WalletDepositPage> {
  // final _qrCode = '1NeJEFzY8PbVS9RvYPfDP93iqXxHjav791'.obs();
  // String get qrCode =>_qrCode();
  // String qrCode = '1NeJEFzY8PbVS9RvYPfDP93iqXxHjav791';

  String get qrCode => currency().address;


  List<CurrencyVo> get currencyOptions => MockDataFactory.cryptoCurrencies;
  late final Rx<CurrencyVo> currency = currencyOptions.first.obs();

  List<String> get networkOptions => MockDataFactory.cryptoNetworkOptions;
  late final Rx<String> currencyNetwork = networkOptions.first.obs();

  @override
  void initState() {
    super.initState();
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
