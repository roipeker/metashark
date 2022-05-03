import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:metashark/commons.dart';
import 'package:rive/rive.dart';

part 'portfolio_state.dart';

part 'widgets.dart';

class PortfolioPage extends StatefulWidget {
  static const url = "Portfolio";

  const PortfolioPage({Key? key}) : super(key: key);

  @override
  createState() => _PortfolioPage();
}

class _PortfolioPage extends _PortfolioState {
  int count(String key, [int orCount = 3]) {
    var params = router.routerDelegate.matches.last.queryParams;
    return int.tryParse('${params[key]}') ?? orCount;
  }

  @override
  Widget build(BuildContext context) {
    ///http://localhost:58980/#/portfolio?nft=6&products=3&cinema=0&subscription=5
    ///http://localhost:58980/#/portfolio?nft=5&products=9&cinema=6&subscriptions=2
    var countNft = count('nft', 4);
    var countCinema = count('cinema', 3);
    var countProducts = count('products', 6);
    var countSubscription = count('subscriptions', 2);
    return Scaffold(
      appBar: const CommonAppBar(title: 'Portfolio'),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: SafeArea(
              child: ListView(
                // padding: kPad16,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                clipBehavior: Clip.none,
                shrinkWrap: true,
                children: [
                  kGap16,
                  _PortfolioSection(
                    /// padding 16.
                    itemCount: countNft,
                    title: 'NFT',
                    emptyHelpTitle: 'NFT',
                    emptyHelpText:
                        'By purchasing staking packages, you will be credited with NFT lottery cards',
                    emptyButtonText: 'Go to farming packages',
                    emptyButtonOnTap: () {
                      context.go('/plans/tab/farming');
                    },
                    itemBuilder: (ctx, idx) {
                      return VoucherCard.collection(
                        imageUrl: MockupImages.mockCardNft,
                        collection: 'Collection: Name',
                        id: '# 784344',
                        status: 'Status: VIP',
                        strength: 'Strength: 156',
                        onTap: _onItemTap,
                        tag: VoucherObjectCardTag.text(text: 'NFT'),
                      ).paddingSymmetric(horizontal: 16);
                    },
                    onAllTap: onNFTAllTap,
                  ),
                  // kGap16,
                  _PortfolioSection(
                    itemCount: countProducts,
                    title: 'Products',
                    emptyHelpText:
                        'Confirm the conditions for completing quests and get prizes',
                    emptyButtonText: 'Go to quests',
                    emptyButtonOnTap: () => context.go('/quest'),
                    itemBuilder: (ctx, idx) {
                      return VoucherCard.present(
                        imageUrl: MockupImages.mockIphone,
                        title: 'iPhone 11',
                        type: ObjectPresentCard.small,
                        body: MockDataFactory.loremWords(30),
                        onTap: _onItemTap,
                      ).paddingSymmetric(horizontal: 16);
                    },
                    onAllTap: onProductsAllTap,
                  ),
                  _PortfolioSection(
                    itemCount: countCinema,
                    title: 'Cinema ticket',
                    emptyHelpText:
                        'By purchasing staking packages, you can get tickets to the online cinema as a gift',
                    emptyButtonText: 'Go to farming plans',
                    emptyButtonOnTap: () =>
                        context.go('/plans/tab/farming'),
                    itemBuilder: (ctx, idx) {
                      return VoucherCard.network(
                        title: 'Cinema ticket',
                        line1: 'Action: 3 months',
                        line2: 'Activate until: 05/23/2022',
                        tile: const VoucherIconTile(
                          color: Color(0xff18CBC7),
                          iconData: AppIcons.park_tickets_couple,
                        ),
                        tag: VoucherObjectCardTag.text(text: 'Cinema'),
                        onTap: _onItemTap,
                      ).paddingSymmetric(horizontal: 16);
                    },
                    onAllTap: onCinemaAllTap,
                  ),
                  _PortfolioSection(
                    itemCount: countSubscription,
                    title: 'Subscriptions',
                    emptyHelpTitle: 'Subscription',
                    emptyHelpText:
                        'Subscription activates all bonuses and makes it possible to earn more',
                    emptyButtonText: 'Go to subscription plans',
                    emptyButtonOnTap: () => context.go('/plans/tab/subscribe'),
                    itemBuilder: (ctx, idx) {
                      return VoucherCard.network(
                        title: 'Subscription',
                        line1: 'Action: 1 months',
                        line2: 'Activate until: 07/12/2022',
                        tile: const VoucherIconTile(
                          color: Color(0xffFF6C2C),
                          iconData: AppIcons.subscriptions,
                        ),
                        tag: VoucherObjectCardTag.text(text: 'Activation'),
                        onTap: _onItemTap,
                      ).paddingSymmetric(horizontal: 16);
                    },
                    onAllTap: onSubscriptionAllTap,
                  ),

                  kGap16,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
