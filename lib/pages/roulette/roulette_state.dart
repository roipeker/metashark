part of 'roulette.dart';

abstract class _RouletteState extends State<RoulettePage> {
  final pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  final onTwist = ChangeNotifier();

  var controllers = List.generate(3, (index) => FlipCardController());

  // temporal hack
  bool showCards = true;

  void onNoCardsTap() {
    onTakeTap();
  }

  void onTakeTap() {
    showCards = !showCards;
    update();
  }

  void onTwistTap() {
    var pageIndex = (pageController.page ?? 0).round();
    final controller = controllers[pageIndex];
    controller.toggleCard();
    // trace("Page index: ", pageIndex);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllers.clear();
    super.dispose();
  }
}
