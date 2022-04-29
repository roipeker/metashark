import 'package:metashark/commons.dart';
part 'object_nft_state.dart';

class ObjectNftPage extends StatefulWidget {
  
   static const url = "/object-nft";
 
  const ObjectNftPage({Key? key}) : super(key: key);
  
  @override
  createState() => _ObjectNftPage();
}

class _ObjectNftPage extends _ObjectNftState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Object Nft page'),
      ),
    );
  }
}

