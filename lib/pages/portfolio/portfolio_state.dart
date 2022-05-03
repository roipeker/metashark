part of 'portfolio.dart';

abstract class _PortfolioState extends State<PortfolioPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onItemTap() {
    context.openModalSheet(
      const PlansSubscribeDetailsSheet(
        tile: VoucherIconTile(
          color: Color(0xffFF6C2C),
          iconData: AppIcons.subscriptions,
        ),
      ),
    );
  }

  void onCinemaAllTap() {
    context.pushNamed(
      PortfolioDetailsPage.url,
      params: {'category': 'cinema'},
    );
  }

  void onSubscriptionAllTap() {
    context.pushNamed(
      PortfolioDetailsPage.url,
      params: {'category': 'subscription'},
    );
  }

  void onNFTAllTap() {
    context.pushNamed(
      PortfolioDetailsPage.url,
      params: {'category': 'nft'},
    );
  }

  void onProductsAllTap() {
    context.pushNamed(
      PortfolioDetailsPage.url,
      params: {'category': 'products'},
    );
  }
}
