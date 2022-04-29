import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'deposit_state.dart';

class WalletDepositPage extends StatefulWidget {
  static const url = "/deposit";

  const WalletDepositPage({Key? key}) : super(key: key);

  @override
  createState() => _DepositPage();
}

class _DepositPage extends _DepositState {
  @override
  Widget build(BuildContext context) {
    // trace("WERASDASD", "1NeJEFzY8PbVS9RvYPfDP93iqXxHjav791".length);
    return Scaffold(
      appBar: CommonAppBar(title: 'Deposit'),
      body: SafeArea(
        child: ListView(
          padding: kPad16,
          children: [
            FormLabeledField(
              label: 'Select currency',
              input: Obs(
                () => CurrencyDropdown(
                  options: currencyOptions,
                  onChanged: currency,
                  current: currency(),
                ),
              ),
            ),
            kGap16,

            /// box with padding
            AppCard(
              color: Colors.white,
              borderRadius: kBorderRadius8,
              padding: kPad16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Obs(
                      () => QrCodeBox(
                        code: qrCode,
                        backgroundColor: AppColors.scaffold,
                      ),
                    ),
                  ),
                  kGap16,
                  const Text(
                    'Your wallet address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kGap16,
                  AppCard(
                    color: AppColors.primaryPurple.withOpacity(.1),
                    child: Obs(
                      () => Text(
                        qrCode,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.primaryPurple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  kGap4,
                  const Text(
                    "Commission for all incoming transactions: 0.001 MTS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.greyAccesoryIconColor,
                      fontSize: 10,
                    ),
                  ),
                  kGap16,
                  Row(
                    children: [
                      SizedBox(
                        height: 44,
                        child: OutlinedButton.icon(
                          onPressed: onShareTap,
                          icon: Icon(
                            AppIcons.share,
                            color: AppColors.primaryPurple,
                          ),
                          label: const Text('Share'),
                        ),
                      ).exp(),
                      kGap16,
                      SizedBox(
                        height: 44,
                        child: ElevatedButton.icon(
                          onPressed: onCopyTap,
                          icon: Icon(
                            AppIcons.content_copy,
                            color: Colors.white,
                          ),
                          label: const Text('Copy'),
                        ),
                      ).exp(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
