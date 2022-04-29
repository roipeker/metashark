import 'package:metashark/commons.dart';
part 'language_selection_state.dart';

class LanguageSelectionPage extends StatefulWidget {
  
   static const url = "/language-selection";
 
  const LanguageSelectionPage({Key? key}) : super(key: key);
  
  @override
  createState() => _LanguageSelectionPage();
}

class _LanguageSelectionPage extends _LanguageSelectionState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Language Selection page'),
      ),
    );
  }
}

