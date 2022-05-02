import 'package:metashark/commons.dart';

part 'plans_subscribe_details_sheet_state.dart';

class PlansSubscribeDetailsSheet extends StatefulWidget {
  final Widget tile;

  const PlansSubscribeDetailsSheet({
    Key? key,
    required this.tile,
  }) : super(key: key);

  @override
  createState() => _PlansSubscribeDetailsSheet();
}

class _PlansSubscribeDetailsSheet extends _PlansSubscribeDetailsSheetState {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: true,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 32),
        decoration: const BoxDecoration(
          color: AppColors.bottomSheet,
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        padding: kPad16,
        child: SafeArea(
          minimum: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Subscription",
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              kGap16,
              VoucherCard.subscribe(
                title: 'Subscription',
                line1: 'Action: 3 months',
                line2: '100 MTS',
                // tile: const PlansSubscriptionTile(color: Color(0xffFF6C2C)),
                tile: widget.tile,
                // tag: VoucherObjectCardTag.text(text: 'Activation'),
                onTap: onCardTap,
              ),
              kGap16,
              GestureDetector(
                onTap: automaticActivation.toggle,
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Automatic activation:",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 14,
                      ),
                    ),
                    Obs(
                      () => Switch(
                          value: automaticActivation(),
                          onChanged: automaticActivation),
                    ),
                  ],
                ),
              ),
              kGap8,
              // kGap16,
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
                textInputAction: TextInputAction.done,
                enabled: false,
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
                  ],
                ),
              ),
              kGap16,
              AppElevatedButton.primary(
                child: const Text('Activate'),
                onTap: onActivateTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
