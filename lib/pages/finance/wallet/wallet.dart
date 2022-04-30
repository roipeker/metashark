import 'package:metashark/commons.dart';
import 'package:metashark/pages/finance/deposit/deposit.dart';

import 'widgets.dart';

part 'wallet_state.dart';

class WalletPage extends StatefulWidget {
  static const url = "/wallet";

  const WalletPage({Key? key}) : super(key: key);

  @override
  createState() => _WalletPage();
}

class _WalletPage extends _WalletState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: const CommonAppBar(title: 'Wallet'),
        body: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: SafeArea(
            bottom: false,
            child: Scrollbar(
              child: ListView(
                clipBehavior: Clip.none,
                shrinkWrap: true,
                children: [
                  kGap16,
                  WalletHeaderCard(
                    onDepositTap: onDepositTap,
                    onWithdrawTap: onWithdrawTap,
                  ),
                  BottomSheetCard(
                    title: "Transaction History",
                    child: Column(
                      children: [
                        Padding(
                          padding: kPadH16,
                          child: AppText(
                            "15.04.2022",
                            style: kFinanceAssetItemTitle,
                          ),
                        ),
                        kGap16,
                        ...transactions.map2((vo) {
                          return TransactionHistoryItem(
                            amount: vo.amount,
                            amountColor: vo.amountColor,
                            iconData: vo.iconData,
                            iconId: vo.iconId,
                            title: vo.title,
                            subtitle: vo.subtitle,
                            onTap: () {
                              onTransactionTap(vo);
                            },
                          );
                        }),
                        kGap32,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
