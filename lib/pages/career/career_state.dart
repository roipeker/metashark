part of 'career.dart';

abstract class _CareerState extends State<CareerPage> {
  final scrollController = ScrollController();
  final pageController = PageController();

  List<_TitleCardVo> get topCardsData => _kTopCards;

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void initState() {
    super.initState();
  }

  void onTopCardTap() {
    /// THIS PAGE DOESNT EXISTS.
    // context.pushNamed(MyPartnersPage.url);
  }

  void onItemTap() {
    context.openModalSheet(const PartnerInfoSheetView());
    // context.toastNotImplemented();
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    super.dispose();
  }
}

const _kTopCards = [
  _TitleCardVo(
      title: 'ROOKIE', subtitle: 'Lowest Rank', percent: 0.1, stars: 1),
  _TitleCardVo(
      title: 'BOSS', subtitle: 'Previous Rank', percent: 0.36, stars: 2),
  _TitleCardVo(title: 'KING', subtitle: 'Next Rank', percent: 0.59, stars: 3),
  _TitleCardVo(title: 'GOD', subtitle: 'Max Rank', percent: 0.84, stars: 4),
];

class _TitleCardVo {
  final String title, subtitle;
  final double percent;
  final int stars;

  const _TitleCardVo({
    required this.title,
    required this.subtitle,
    this.percent = 0.1,
    this.stars = 4,
  });
}
