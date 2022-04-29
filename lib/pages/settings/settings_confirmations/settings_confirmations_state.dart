part of 'settings_confirmations.dart';

abstract class _SettingsConfirmationsState extends State<SettingsConfirmationsPage> {

  List<ConfirmationDataVo> get confirmationsData =>  const [
    ConfirmationDataVo('Active','1/5', AppColors.green),
    ConfirmationDataVo('Overdue','4/5', AppColors.red),
  ];


  @override
  void initState(){
    super.initState();  
  }

  @override
  void dispose(){
    super.dispose();  
  }
}


class ConfirmationDataVo {
  final String state;
  final String stateCount;
  final Color stateColor;
  const ConfirmationDataVo(this.state, this.stateCount, this.stateColor);


}