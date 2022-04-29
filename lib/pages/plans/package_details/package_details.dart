import 'package:metashark/commons.dart';
part 'package_details_state.dart';

class PackageDetailsPage extends StatefulWidget {
  
   static const url = "/package-details";
 
  const PackageDetailsPage({Key? key}) : super(key: key);
  
  @override
  createState() => _PackageDetailsPage();
}

class _PackageDetailsPage extends _PackageDetailsState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Package Details page'),
      ),
    );
  }
}

