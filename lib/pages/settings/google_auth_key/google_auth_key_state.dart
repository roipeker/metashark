part of 'google_auth_key.dart';

abstract class _GoogleAuthKeyState extends State<GoogleAuthKeyPage> {
  
  @override
  void initState(){
    super.initState();  
  }

  @override
  void dispose(){
    super.dispose();  
  }


  final qrCode =  'HDIOELMCYASHUFTV';

  FutureOr onCodeCopy() async {
    await Clipboard.setData(ClipboardData(text: qrCode));
    AppToast.infoIcon(
      message: 'Code copied to clipboard!',
      icon: Icons.content_copy,
    );
  }

  void onNextTap() {
    context.pushNamed(GoogleAuthKeyConfirmationPage.url);
  }
}

