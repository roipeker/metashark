part of 'withdraw_confirmation.dart';

abstract class _WithdrawConfirmationState
    extends State<WithdrawConfirmationPage> {
  final code2faTec = AppTextControl(), emailTec = AppTextControl();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    code2faTec.dispose();
    emailTec.dispose();
    super.dispose();
  }

  void onSaveTap() {
    // assure history matches!
    final matches = GoRouter.of(context).routerDelegate.matches;
    if(context.navigator()!.canPop() && matches.length > 2 ){
      context.pop();
      context.pop();
    } else {
      context.goNamed(WalletPage.url);
    }
    // for( var match in matches ){
    //   trace(match.subloc);
    // }
    // var index = matches.lastIndexOf('/finance/wallet');
    /// validate if last match fits.
    // if( matches.contains('/finance/wallet')){
    // }
    // matches.forEach((element) {
    //
    //   trace(element);
    // });

    // if (context.navigator()!.canPop()) {
    //   context.pop();
    // }
    // if (context.navigator()!.canPop()) {
    //   context.pop();
    // }
  }
}
