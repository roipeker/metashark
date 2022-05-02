part of 'withdraw_confirmation.dart';

abstract class _WithdrawConfirmationState
    extends State<WithdrawConfirmationPage> {
  final code2faTec = AppTextControl(), emailTec = AppTextControl();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    code2faTec.dispose();
    emailTec.dispose();
    super.dispose();
  }

  void onSaveTap() {
    // context.goNamed(FinancePage.url);
    context.goNamed(WalletPage.url);
  }
}
