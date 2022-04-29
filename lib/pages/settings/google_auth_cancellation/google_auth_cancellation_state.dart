part of 'google_auth_cancellation.dart';

abstract class _GoogleAuthCancellationState
    extends State<GoogleAuthCancellationPage> {
  late final codeControl = AppTextControl();

  void onSendTap() {
    appData.hasGoogleAuth(false);
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

  void onSubmitCodeTap() {}

  @override
  void dispose() {
    codeControl.dispose();
    super.dispose();
  }
}
