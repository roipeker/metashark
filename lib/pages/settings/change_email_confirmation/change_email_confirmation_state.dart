part of 'change_email_confirmation.dart';

abstract class _ChangeEmailConfirmationState
    extends State<ChangeEmailConfirmationPage> {
  final code2faTec = AppTextControl(),
      email1Tec = AppTextControl(),
      email2Tec = AppTextControl();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    code2faTec.dispose();
    email1Tec.dispose();
    email2Tec.dispose();
    super.dispose();
  }

  void onSaveTap() {
    context.goNamed(SettingsPage.url);
  }
}
