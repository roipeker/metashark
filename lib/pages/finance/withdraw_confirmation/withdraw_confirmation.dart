import 'package:metashark/commons.dart';
part 'withdraw_confirmation_state.dart';

class WithdrawConfirmationPage extends StatefulWidget {
  
   static const url = "/withdraw-confirmation";
 
  const WithdrawConfirmationPage({Key? key}) : super(key: key);
  
  @override
  createState() => _WithdrawConfirmationPage();
}

class _WithdrawConfirmationPage extends _WithdrawConfirmationState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: const Center(
        child: Text('Content for Withdraw Confirmation page'),
      ),
    );
  }
}

