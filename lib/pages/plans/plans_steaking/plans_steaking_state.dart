part of 'plans_steaking.dart';

abstract class _PlansSteakingState extends State<PlansSteakingPage> {
  int count = 6;
  final pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onBuyTap() {
    context.toastNotImplemented();
  }

  void onShowGifts() {
    context.toastNotImplemented();
  }
}
