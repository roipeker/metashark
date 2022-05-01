part of 'partner_login_sheet.dart';

abstract class _PartnerLoginSheetState extends State<PartnerLoginSheet> {
  final loginControl = AppTextControl();
  final passwordControl = AppTextControl();

  void onGoBinaryTap() {
    context.toastNotImplemented();
  }

  void onShowCommandTap() {
    context.toastNotImplemented();
  }

  FutureOr onShareTap() async {
    var result = await NativeUtils.share(
      subject: 'Metashark',
      message: 'Partner login',
    );
    trace("Share result: ", result.raw);
  }

  FutureOr onCopyTap() async {
    await Clipboard.setData(ClipboardData(text: 'Copied text'));
    AppToast.infoIcon(
      message: 'Partner login to clipboard!',
      icon: Icons.content_copy,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loginControl.dispose();
    passwordControl.dispose();
    super.dispose();
  }
}
