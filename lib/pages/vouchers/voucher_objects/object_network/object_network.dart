import 'package:metashark/commons.dart';
part 'object_network_state.dart';

class ObjectNetworkPage extends StatefulWidget {
  
   static const url = "/object-network";
 
  const ObjectNetworkPage({Key? key}) : super(key: key);
  
  @override
  createState() => _ObjectNetworkPage();
}

class _ObjectNetworkPage extends _ObjectNetworkState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Object Network page'),
      ),
    );
  }
}

