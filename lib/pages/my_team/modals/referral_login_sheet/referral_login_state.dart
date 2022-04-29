part of 'referral_login_sheet.dart';

abstract class _ReferralLoginSheetState extends State<ReferralLoginSheet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  FutureOr onShareTap() async {
    var result = await NativeUtils.share(
      subject: 'Metashark wallet address',
      message: 'Bitcoin wallet address:',
    );
    trace("Share result: ", result.raw);
  }

  FutureOr onCopyTap() async {
    await Clipboard.setData(ClipboardData(text: 'Login details here'));
    AppToast.infoIcon(
      message: 'Login copied to clipboard',
      icon: Icons.content_copy,
    );
  }
}
