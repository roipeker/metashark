import 'package:metashark/commons.dart';

part 'create_token_sheet_state.dart';

class CreateTokenSheet extends StatefulWidget {
  const CreateTokenSheet({Key? key}) : super(key: key);

  @override
  createState() => _CreateTokenSheet();
}

class _CreateTokenSheet extends _CreateTokenSheetState {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.scaffold,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        padding: kPad16,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Create",
                style: TextStyle(
                  color: AppColors.darkGrey,
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
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
                textInputAction: TextInputAction.done,
                control: amountTec,
                label: 'Enter amount',
                hint: 'Enter amount',
                accessory: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      " BTC ",
                      textAlign: TextAlign.center,
                      style: kTextAccessoryStyle,
                    ),
                  ],
                ),
              ),
              kGap16,
              SizedBox(
                height: 44,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onAddTap,
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
