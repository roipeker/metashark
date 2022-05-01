part of 'wallet.dart';

abstract class _WalletState extends State<WalletPage> {
  List<TransactionHistoryVo> get transactions => [
        ..._kTransactionHistory,
        // ..._kTransactionHistory,
        // ..._kTransactionHistory,
      ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onRefreshPull() async {
    await 2.seconds.delay();
    return;
  }

  void onAssetTap(int index) {
    context.pushNamed(WalletPage.url);
  }

  void onWithdrawTap() {
    context.pushNamed(WalletWithdrawPage.url);
  }

  void onDepositTap() {
    context.pushNamed(WalletDepositPage.url);
  }

  void onTransactionTap(TransactionHistoryVo vo) {
    context.openModalSheet(
      WalletDetailsSheet(
        // title: vo.title,
        title: "TXID: ${vo.transactionId}",
      ),
    );
  }
}

final _kTransactionHistory = [
  TransactionHistoryVo(
    // iconId: SvgIcons.send2,
    transactionId: '7284783742',
    iconId: SvgIcons.send2,
    iconData: AppIcons.icon_send2,
    title: 'Translation',
    subtitle: '00:00',
    amount: '-1.00000000',
    amountColor: AppColors.darkGrey,
  ),
  TransactionHistoryVo(
    transactionId: '842222742',
    iconId: SvgIcons.binary,
    iconData: AppIcons.icon_binary,
    title: 'Income',
    subtitle: '00:00',
    amount: '+1.00000000',
    amountColor: AppColors.green,
  ),
];

class TransactionHistoryVo {
  final String iconId, title, subtitle;
  final String amount;
  final String transactionId;
  final Color? amountColor;
  final IconData iconData;

  TransactionHistoryVo({
    required this.iconData,
    required this.iconId,
    required this.title,
    required this.transactionId,
    required this.amount,
    this.subtitle = '00:00',
    this.amountColor,
  });
}
