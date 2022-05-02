import 'package:metashark/commons.dart';
part 'settings_language_state.dart';

class SettingsLanguagePage extends StatefulWidget {
  
   static const url = "/settings-language";
 
  const SettingsLanguagePage({Key? key}) : super(key: key);
  
  @override
  createState() => _SettingsLanguagePage();
}

class _SettingsLanguagePage extends _SettingsLanguageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Settings Language page'),
      ),
    );
  }
}

