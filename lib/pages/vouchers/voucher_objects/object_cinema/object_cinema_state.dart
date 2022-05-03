part of 'object_cinema.dart';

abstract class _ObjectCinemaState extends State<ObjectCinemaPage> {

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

