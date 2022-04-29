part of 'google_auth_key_confirmation.dart';

abstract class _GoogleAuthKeyConfirmationState
    extends State<GoogleAuthKeyConfirmationPage> {
  late final codeControl = AppTextControl();

  void onNextTap() {
    appData.hasGoogleAuth(true);
    context.goNamed(SettingsPage.url);
  }

  FutureOr onInsertTap() async {
    var data = await Clipboard.getData('text/plain');
    var text = data?.text ?? '';
    if (text.isNotEmpty) {
      codeControl.setFocus();
      codeControl.text = text;
      codeControl.editor.selection = TextSelection(
        baseOffset: text.length,
        extentOffset: text.length,
      );
    }
  }

  @override
  void dispose() {
    codeControl.dispose();
    // codeTec.dispose();
    super.dispose();
  }
}
