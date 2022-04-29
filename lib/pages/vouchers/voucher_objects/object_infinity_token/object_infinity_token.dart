import 'package:metashark/commons.dart';

part 'object_infinity_token_state.dart';

class ObjectInfinityTokenPage extends StatefulWidget {
  static const url = "/object-infinity-token";

  const ObjectInfinityTokenPage({Key? key}) : super(key: key);

  @override
  createState() => _ObjectInfinityTokenPage();
}

class _ObjectInfinityTokenPage extends _ObjectInfinityTokenState {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        title: 'Infiniti Token',
      ),
      body: Center(
        child: Text('Content for Object Infinity Token page'),
      ),
    );
  }
}
