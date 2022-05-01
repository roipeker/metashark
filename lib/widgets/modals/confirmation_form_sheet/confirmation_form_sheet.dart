import 'package:metashark/commons.dart';

part 'confirmation_form_sheet_state.dart';

class ConfirmationFormSheet extends StatefulWidget {
  const ConfirmationFormSheet({Key? key}) : super(key: key);

  @override
  createState() => _ConfirmationFormSheetView();
}

class _ConfirmationFormSheetView extends _ConfirmationFormSheetState {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: kPad16,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Confirmation form",
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              kGap16,
              AppTextFieldInsert(
                label: 'Code 2-FA',
                hint: 'Enter Code',
                textControl: code2fa,
              ),
              kGap16,
              AppTextFieldInsert(
                label: 'Enter code from Gma***@gmail.com',
                hint: 'Enter code',
                textControl: codeEmail1,
              ),
              kGap16,
              AppTextFieldInsert(
                label: 'Enter another code from Gma***@gmail.com',
                hint: 'Enter code',
                textControl: codeEmail2,
              ),
              kGap16,
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
