import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:metashark/commons.dart';

part 'portfolio_state.dart';

part 'widgets.dart';

class PortfolioPage extends StatefulWidget {
  static const url = "Portfolio";

  const PortfolioPage({Key? key}) : super(key: key);

  @override
  createState() => _PortfolioPage();
}

class _PortfolioPage extends _PortfolioState {
  @override
  Widget build(BuildContext context) {
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
                    itemCount: 3,
                    title: 'NFT',
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
                    itemCount: 5,
                    title: 'Products',
                    itemBuilder: (ctx, idx) {
                      return VoucherCard.present(
                        imageUrl: MockupImages.mockIphonePhoto,
                        title: 'iPhone 11',
                        type: ObjectPresentCard.small,
                        body: MockDataFactory.loremWords(30),
                        onTap: _onItemTap,
                      ).paddingSymmetric(horizontal: 16);
                    },
                    onAllTap: onProductsAllTap,
                  ),
                  _PortfolioSection(
                    itemCount: 3,
                    title: 'Subscription',
                    itemBuilder: (ctx, idx) {
                      return VoucherCard.network(
                        title: 'Subscription',
                        line1: 'Action: 3 months',
                        line2: 'Activate until: 05/23/2022',
                        tile: const VoucherIconTile(
                          color: Color(0xff18CBC7),
                          iconData: AppIcons.park_tickets_couple,
                        ),
                        tag: VoucherObjectCardTag.text(text: 'Activation'),
                        onTap: _onItemTap,
                      ).paddingSymmetric(horizontal: 16);
                    },
                    onAllTap: onSubscriptionAllTap,
                  ),
                  _PortfolioSection(
                    itemCount: 2,
                    title: 'Subscription',
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
