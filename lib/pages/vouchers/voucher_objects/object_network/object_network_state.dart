part of 'object_network.dart';

abstract class _ObjectNetworkState extends State<ObjectNetworkPage> {

  final activeItem1 = false.obs();
  final getRadio = VoucherCard.getRadio;

  @override
  void initState(){
    super.initState();  
  }

  @override
  void dispose(){
    activeItem1.dispose();
    super.dispose();  
  }
}

