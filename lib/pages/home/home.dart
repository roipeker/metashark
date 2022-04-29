import 'package:metashark/commons.dart';

part 'home_state.dart';

class HomePage extends StatefulWidget {
  static const url = "Dashboard";

  const HomePage({Key? key}) : super(key: key);

  @override
  createState() => _HomePage();
}

class _HomePage extends _HomeState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Dashboard'),
      body: const Center(
        child: Text('Content for Home page'),
      ),
    );
  }
}
