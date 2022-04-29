part of 'binary.dart';

abstract class _BinaryState extends State<BinaryPage> with AutomaticKeepAliveClientMixin {
  
  String get titleText => 'Binary page';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState(){
    super.initState();  
  }

  @override
  void dispose(){
    super.dispose();  
  }
}

