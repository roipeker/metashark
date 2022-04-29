part of 'settings.dart';

abstract class _SettingsState extends State<SettingsPage> {
  
  String get titleText => 'Settings page';

  @override
  void initState(){
    super.initState();  
  }

  @override
  void dispose(){
    super.dispose();  
  }


  Future<void> onGoogleAuthTap() async {
    if (appData.hasGoogleAuth()) {
      /// open the alert dialog.
      final result = await context.openDialog<bool>(
        const DeactivateGoogleAuthDialog(),
      );
      if (result == true) {
        appData.hasGoogleAuth(false);
        context.pushNamed(GoogleAuthCancellationPage.url);
      }
    } else {
      context.pushNamed(GoogleAuthPage.url);
    }
  }

  Future<void> onRefreshPull() async {
    await 2.seconds.delay();
    return;
  }

}

