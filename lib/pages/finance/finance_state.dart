part of 'finance.dart';

abstract class _FinanceState extends State<FinancePage> {
  List<FinanceAssetVo> get myAssets => _kMyAssets;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onAssetTap(FinanceAssetVo vo) {
    context.pushNamed(WalletPage.url);
  }

  Future<void> onRefreshPull() async {
    await 2.seconds.delay();
    return;
  }
}

final _kMyAssets = [
  FinanceAssetVo(
    iconId: SvgCryptos.btc,
    title: 'BTC',
    subtitle: 'Bitcoin',
    value: '1.00000000',
    valueUsdt: '5 000 USDT',
  ),
  FinanceAssetVo(
    iconId: SvgCryptos.eth,
    title: 'ETH',
    subtitle: 'Ethereum',
    value: '300.00000000',
    valueUsdt: '6 000 USDT',
  ),
  FinanceAssetVo(
    iconId: SvgCryptos.mts,
    title: 'MTS',
    subtitle: 'MetaShark',
    value: '3 000.00000000',
    valueUsdt: '50 USDT',
  ),
  // FinanceAssetVo(
  //   iconId: SvgCryptos.dash,
  //   title: 'DASH',
  //   subtitle: 'Dash',
  //   value: '100.00000000',
  //   valueUsdt: '1000 USDT',
  // ),
  FinanceAssetVo(
    iconId: SvgCryptos.trx,
    title: 'TRX',
    subtitle: 'Tron',
    value: '12 000.00000000',
    valueUsdt: '423 USDT',
  ),
  FinanceAssetVo(
    iconId: SvgCryptos.usdt,
    title: 'USDT',
    subtitle: 'USDT',
    value: '324',
    valueUsdt: '1 USDT',
  ),
  FinanceAssetVo(
    iconId: SvgCryptos.ims,
    title: 'IMS',
    subtitle: 'Infinity MetaShark',
    value: '256 000',
    valueUsdt: '56.8 USDT',
  ),
];

class FinanceAssetVo {
  final String iconId, title, subtitle;
  final String value, valueUsdt;

  FinanceAssetVo({
    required this.iconId,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.valueUsdt,
  });
}
