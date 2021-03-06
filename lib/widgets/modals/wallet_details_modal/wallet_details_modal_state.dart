part of 'wallet_details_modal.dart';

abstract class _WalletDetailsSheetState extends State<WalletDetailsSheet> {
  ScrollController? get scrollController {
    return ModalScrollController.of(context);
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      scrollController?.addListener(_onScrollUpdate);
    });
    super.initState();
  }

  void _onScrollUpdate() {
    final s = scrollController!;
    double maxScroll = s.position.maxScrollExtent;
    double currentScroll = s.position.pixels;
    if (currentScroll > maxScroll) {
      s.position.jumpTo(maxScroll);
    }
  }


  void onPayTap() {
    context.navigator()?.pop();
  }

  void onUserCardTap() {
    context.toastNotImplemented();
  }

  @override
  void dispose() {
    // scrollController?.removeListener(_onScrollUpdate);
    super.dispose();
  }
}
