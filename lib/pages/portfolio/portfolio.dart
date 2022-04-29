import 'package:metashark/commons.dart';
part 'portfolio_state.dart';

class PortfolioPage extends StatefulWidget {
  
   static const url = "Portfolio";
 
  const PortfolioPage({Key? key}) : super(key: key);
  
  @override
  createState() => _PortfolioPage();
}

class _PortfolioPage extends _PortfolioState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Portfolio page'),
      ),
    );
  }
}

