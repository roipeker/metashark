import 'package:metashark/commons.dart';

part 'withdraw_state.dart';

class WalletWithdrawPage extends StatefulWidget {
  static const url = "/withdraw";

  const WalletWithdrawPage({Key? key}) : super(key: key);

  @override
  createState() => _WithdrawPage();
}

class _WithdrawPage extends _WithdrawState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Withdraw'),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: SafeArea(
                child: ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
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
                    FormLabeledField(
                      label: 'Select processing',
                      input: Obs(
                        () => CurrencyNetworkDropdown(
                          options: networkOptions,
                          onChanged: currencyNetwork,
                          current: currencyNetwork(),
                        ),
                      ),
                    ),
                    kGap16,
                    const AppTextField(
                      label: 'Requisites',
                      hint: 'Enter requisites',
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    kGap16,
                    AppTextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true,
                        signed: false,
                      ),
                      textInputAction: TextInputAction.done,
                      control: amountTec,
                      label: 'Amount',
                      hint: 'Enter amount',
                      accessory: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            " BTC ",
                            textAlign: TextAlign.center,
                            style: kTextAccessoryStyle,
                          ).center(),
                          AppTextButton.accessory(
                            label: 'MAX',
                            onTap: onMaxTap,
                          ),
                        ],
                      ),
                      bottom: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Text(
                          "Commission: 0.0001 BTC\nReceive: 999.9999 MTS",
                          style: TextStyle(
                            color: AppColors.primaryPurple,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      // bottom: AppTextButton.tiny(
                      //   label: "Commission: 0.0001 BTC",
                      //   onTap: () {},
                      // ).bottomLeft(),
                    ),
                    // kGap16,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: kPad16,
              child: AppElevatedButton.primary(
                child: Text('Next'),
                onTap: onNextTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
