part of 'object_present.dart';

abstract class _ObjectPresentState extends State<ObjectPresentPage> {
  final scrollController = ScrollController();

  final activeItem1 = false.obs();
  final activeItem2 = false.obs();
  final activeItem3 = false.obs();
  final activeItem4 = false.obs();
  final activeItem5 = false.obs();
  final activeItem6 = false.obs();
  final activeItem7 = false.obs();
  final getRadio = VoucherCard.getRadio;

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    activeItem1.dispose();
    activeItem2.dispose();
    activeItem3.dispose();
    activeItem4.dispose();
    activeItem5.dispose();
    activeItem6.dispose();
    activeItem7.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void onCreateTap() {
    context.toastNotImplemented();
  }

  void onObjectsTap() {
    context.pushNamed(VoucherObjectsPage.url);
  }

  void onRecipientsTap() {
    context.pushNamed(VoucherRecipientsPage.url);
  }
}

