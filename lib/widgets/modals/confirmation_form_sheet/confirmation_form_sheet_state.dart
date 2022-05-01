part of 'confirmation_form_sheet.dart';

abstract class _ConfirmationFormSheetState
    extends State<ConfirmationFormSheet> {
  final code2fa = AppTextControl();
  final codeEmail1 = AppTextControl();
  final codeEmail2 = AppTextControl();

  void onSaveTap() {
    context.navigator()?.pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    code2fa.dispose();
    codeEmail1.dispose();
    codeEmail2.dispose();
    super.dispose();
  }
}
