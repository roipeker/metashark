part of 'object_nft.dart';

abstract class _ObjectNftState extends State<ObjectNftPage> {
  final activeItem1 = false.obs();
  final getRadio = VoucherCard.getRadio;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    activeItem1.dispose();
    super.dispose();
  }
}
