import 'package:metashark/commons.dart';

part 'buying_package_sheet_state.dart';

class BuyingPackageSheetView extends StatefulWidget {
  const BuyingPackageSheetView({Key? key}) : super(key: key);

  @override
  createState() => _BuyingPackageSheetView();
}

class _BuyingPackageSheetView extends _BuyingPackageSheetState {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: true,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
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
                "Buying a package",
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
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
                textInputAction: TextInputAction.done,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                enabled: true,
                control: amountTec,
                label: 'Enter amount',
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
              AppCard(
                color: AppColors.primaryPurple10,
                elevation: 0,
                borderRadius: kBorderRadius8,
                padding: kPad16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ContractBadge.bronze(),
                    Text(
                      "57.00000000 MTS",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              kGap16,
              AppElevatedButton.primary(
                child: const Text('Pay'),
                onTap: onPayTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
