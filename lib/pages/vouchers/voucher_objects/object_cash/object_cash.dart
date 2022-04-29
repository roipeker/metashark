import 'package:metashark/commons.dart';

part 'object_cash_state.dart';

class ObjectCashPage extends StatefulWidget {
  static const url = "/object-cash";

  const ObjectCashPage({Key? key}) : super(key: key);

  @override
  createState() => _ObjectCashPage();
}

class _ObjectCashPage extends _ObjectCashState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Cash',
      ),
      body: const Center(
        child: Text('Content for Object Cash page'),
      ),
    );
  }
}
