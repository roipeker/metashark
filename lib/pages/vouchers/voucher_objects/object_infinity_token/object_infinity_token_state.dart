part of 'object_infinity_token.dart';

abstract class _ObjectInfinityTokenState
    extends State<ObjectInfinityTokenPage> {
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

  void onCreateTap() {
    context.openModalSheet(const CreateTokenSheet());
  }
}
