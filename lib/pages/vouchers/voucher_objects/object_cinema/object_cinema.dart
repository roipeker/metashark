import 'package:metashark/commons.dart';
part 'object_cinema_state.dart';

class ObjectCinemaPage extends StatefulWidget {
  
   static const url = "/object-cinema";
 
  const ObjectCinemaPage({Key? key}) : super(key: key);
  
  @override
  createState() => _ObjectCinemaPage();
}

class _ObjectCinemaPage extends _ObjectCinemaState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Object Cinema page'),
      ),
    );
  }
}

