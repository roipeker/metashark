part of 'object_cash.dart';

abstract class _ObjectCashState extends State<ObjectCashPage> {
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
