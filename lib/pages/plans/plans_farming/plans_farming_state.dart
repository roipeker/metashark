part of 'plans_farming.dart';

abstract class _PlansFarmingState extends State<PlansFarmingPage> {
  final pageController = PageController(
    initialPage: 0,
    // viewportFraction: 0.8,
  );

  List<PlanCardVo> get cards => kPackageFarmingCards;

  int get count => cards.length;

  int get widgetIndex => widget.farmingIndex;

  int get currentPage =>
      pageController.hasClients ? (pageController.page?.round() ?? 0) : 0;

  @override
  void initState() {
    pageController.addListener(() {
      // var currentPage = pageController.page?.round() ?? 0;
      if (currentPage != widgetIndex) {
        context.go('/plans/tab/farming?package_id=$currentPage');
      }
    });
    _updatePage();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PlansFarmingPage oldWidget) {
    // trace("UPDATE WIDGET?", widget.farmingIndex, currentPage);
    _updatePage();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onBuyTap() {
    context.openModalSheet(const BuyingPackageSheetView());
  }

  void onShowGifts() {
    context.openModalSheet(const ShowGiftsSheet());
  }

  void _updatePage() {
    if (widget.farmingIndex != currentPage) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        pageController.jumpToPage(widget.farmingIndex);
      });
    }
  }
}
