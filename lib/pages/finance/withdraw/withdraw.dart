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
      appBar: CommonAppBar(
        title: 'Withdraw',
      ),
      body: Column(
        children: [
          Expanded(
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
                AppTextField(
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
                  hint: 'Enter requisites',
                  accessory: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 50,
                    ),
                    child: Text(
                      "BTC",
                      textAlign: TextAlign.center,
                      style: kTextAccessoryStyle,
                    ).center(),
                  ),
                  bottom: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                    child: const Text(
                      "Commission: 0.0001 BTC",
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
          SafeArea(
            child: Padding(
              padding: kPad16,
              child: AppElevatedButton.primary(
                child: Text('Conclusion'),
                onTap: onConclusionTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onConclusionTap() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed(FinancePage.url);
    }
  }
}
