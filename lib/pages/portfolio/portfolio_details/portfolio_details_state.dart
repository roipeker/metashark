part of 'portfolio_details.dart';

abstract class _PortfolioDetailsState extends State<PortfolioDetailsPage> {
  final scrollController = ScrollController();

  String get appbarTitle {
    return _kTitleByCategory[widget.type ?? ''] ?? 'Portfolio';
  }

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

const _kTitleByCategory = {
  'subscription': 'Steaking',
  'nft': 'NFT',
  'products': 'Products',
};
