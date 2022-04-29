import 'package:metashark/commons.dart';

part 'create_voucher_state.dart';

part 'widgets.dart';

class CreateVoucherPage extends StatefulWidget {
  static const url = "/create-voucher";

  const CreateVoucherPage({Key? key}) : super(key: key);

  @override
  createState() => _CreateVoucherPage();
}

class _CreateVoucherPage extends _CreateVoucherState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Create voucher'),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: Scrollbar(
          controller: scrollController,
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: onRefreshPull,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    padding: kPad16,
                    // clipBehavior: Clip.none,
                    // primary: true,
                    // shrinkWrap: true,
                    children: [
                      VoucherListItemButton.create(
                        title: 'Objects',
                        icon: AppIcons.list_alt,
                        onTap: onObjectsTap,
                      ),
                      kGap8,
                      VoucherListItemButton.create(
                        title: 'Recipients',
                        icon: AppIcons.people,
                        onTap: onRecipientsTap,
                      ),
                      kGap16,
                      // activation panel.
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Activation",
                            style: TextStyle(
                              color: Color(0xff5e5873),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          kGap8,
                          Obs(
                            () => Row(
                              children: [
                                _ActivationButton(
                                  label: "By code",
                                  icon: AppIcons.qr_code,
                                  value: ActivationType.code,
                                  groupValue: activationType(),
                                  onTap: activationType,
                                ).exp(),
                                kGap16,
                                _ActivationButton(
                                  label: "Payment",
                                  icon: AppIcons.payments,
                                  value: ActivationType.payment,
                                  groupValue: activationType(),
                                  onTap: activationType,
                                ).exp(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      kGap16,
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
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textInputAction: TextInputAction.done,
                        control: amountTec,
                        label: 'Enter amount',
                        hint: 'Enter amount',
                        accessory: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 50),
                          child: const Text(
                            "BTC",
                            textAlign: TextAlign.center,
                            style: kTextAccessoryStyle,
                          ).center(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 47,
                child: AppElevatedButton.primary(
                  onTap: onCreateTap,
                  child: const Text('Create'),
                  extended: true,
                ),
              ).padding(16),
            ],
          ),
        ),
      ),
    );
  }


}
