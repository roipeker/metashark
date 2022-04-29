import 'package:metashark/commons.dart';
part 'store_state.dart';

class StorePage extends StatefulWidget {
  
   static const url = "Store";
 
  const StorePage({Key? key}) : super(key: key);
  
  @override
  createState() => _StorePage();
}

class _StorePage extends _StoreState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Store page'),
      ),
    );
  }
}

