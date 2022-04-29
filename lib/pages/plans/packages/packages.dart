import 'package:metashark/commons.dart';
part 'packages_state.dart';

class PackagesPage extends StatefulWidget {
  
   static const url = "/packages";
 
  const PackagesPage({Key? key}) : super(key: key);
  
  @override
  createState() => _PackagesPage();
}

class _PackagesPage extends _PackagesState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Packages page'),
      ),
    );
  }
}

