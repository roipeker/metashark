import 'package:metashark/commons.dart';

class WalletHeaderCard extends StatelessWidget {
  final VoidCallback? onDepositTap;
  final VoidCallback? onWithdrawTap;

  const WalletHeaderCard({
    Key? key,
    this.onDepositTap,
    this.onWithdrawTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadH16,
      child: Center(
        child: SizedBox(
          width: 343,
          child: Column(
            verticalDirection: VerticalDirection.up,
            children: [
              const WalletTopCard(
                title: "1.0000 BTC",
                subtitle: "3 000 USDT",
                iconId: SvgCryptos.btc,
              ),
              Transform.translate(
                offset: Offset(0, -16),
                child: AppCard(
                  clip: Clip.antiAlias,
                  borderRadius: kBorderRadius8,
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      _CardButton(
                        label: 'Deposit',
                        iconData: AppIcons.wallet,
                        // iconId: SvgIcons.finance,
                        onTap: onDepositTap,
                      ).exp(),
                      _CardButton(
                        label: 'Withdraw',
                        iconData: AppIcons.credit_card,
                        // iconId: SvgIcons.creditCard,
                        onTap: onWithdrawTap,
                      ).exp(),
                    ],
                  ),
                  elevation: 4,
                ),
              ),
            ].reversed.toList(),
          ),
        ),
      ),
    );
  }
}

class _CardButton extends StatelessWidget {
  // final String iconId;
  final IconData iconData;
  final String label;
  final VoidCallback? onTap;

  const _CardButton({
    Key? key,
    required this.iconData,
    // required this.iconId,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: kTextButtonStyleWalletBalance,
      child: Padding(
        /// special case for the card.
        padding: const EdgeInsets.only(top: 20.0, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgAvatarIcon(iconId: iconId),
            Circle(
              alignment: null,
              color: AppColors.primaryPurple,
              size: 32,
              child: Icon(
                iconData,
                size: 18,
                color: Colors.white,
              ),
            ),
            kGap8,
            Text(label),
          ],
        ),
      ),
      onPressed: onTap,
    );
  }
}

class WalletTopCard extends StatelessWidget {
  final String iconId;
  final String title, subtitle;

  const WalletTopCard({
    Key? key,
    required this.iconId,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 187,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius12,
        boxShadow: [
          BoxShadow(
            color: Color(0x337367f0),
            blurRadius: 6,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Color(0x4c7367f0),
            blurRadius: 10,
            offset: Offset(2, 1),
          ),
        ],
        gradient: RadialGradient(
          colors: [
            Color(0xff678DF0),
            Color(0xffA367F0),
          ],
          center: Alignment.topLeft,
          radius: 1,
        ),
      ),
      padding: kPad16.copyWith(bottom: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "General balance",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          kGap10,
          Row(
            children: [
              SizedBox(
                width: 44,
                height: 44,
                child: SvgPicture.asset(iconId),
              ),
              kGap8,
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "1.0000 BTC",
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    // "3 000 USDT",
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          kGap10,
          FittedBox(
            child: SvgPicture.asset(
              Svgs.walletBubbleChart,
              width: 311,
              height: 56,
            ),
          ),
        ],
      ),
    );
  }
}

/// -- item

class TransactionHistoryItem extends StatelessWidget {
  final String title, subtitle, amount;
  final Color? amountColor;

  // final String iconId;
  final IconData iconData;
  final VoidCallback? onTap;

  const TransactionHistoryItem({
    Key? key,
    this.onTap,
    // required this.iconId,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.amount,
    this.amountColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getAvatar(),
          kGap16,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: kFinanceAssetItemTitle,
                  textAlign: TextAlign.start,
                ),
                Text(
                  subtitle,
                  style: kFinanceAssetItemSubtitle,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Text(
            amount,
            textAlign: TextAlign.end,
            style: kWalletHistoryItemValueStyle.copyWith(color: amountColor),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: onTap,
    );
  }

  Widget getAvatar() {
    return AvatarIcon(
      iconData: iconData,
      backgroundColor: AppColors.primaryPurple10,
      foregroundColor: AppColors.appbarIconGrey,
      size: 32,
      iconSize: 18,
    );
    // return SizedBox(
    //   width: 32,
    //   height: 32,
    //
    //   child: SvgAvatarIcon(
    //     iconId: iconId,
    //     iconData: iconData,
    //     backgroundColor: AppColors.primaryPurple.withOpacity(.1),
    //     foregroundColor: AppColors.appbarIconGrey,
    //   ),
    // );
  }
}
