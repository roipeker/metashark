import 'package:metashark/commons.dart';

part 'portfolio_details_state.dart';

class PortfolioDetailsPage extends StatefulWidget {
  static const url = "/portfolio-details";
  final String? type;

  const PortfolioDetailsPage({Key? key, this.type}) : super(key: key);

  @override
  createState() => _PortfolioDetailsPage();
}

class _PortfolioDetailsPage extends _PortfolioDetailsState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: appbarTitle),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: SafeArea(
              child: ListView(
                padding: kPad16,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                clipBehavior: Clip.none,
                shrinkWrap: true,
                children: [
                  VoucherCard.collection(
                    imageUrl: MockupImages.mockCardNft,
                    collection: 'Collection: Name',
                    id: '# 784344',
                    status: 'Status: VIP',
                    strength: 'Strength: 156',
                    onTap: () {},
                    tag: VoucherObjectCardTag.text(text: 'NFT'),
                  ),
                  kGap16,
                  VoucherCard.collection(
                    imageUrl: MockupImages.mockCardNft,
                    collection: 'Collection: Name',
                    id: '# 784344',
                    status: 'Status: VIP',
                    strength: 'Strength: 156',
                    onTap: () {},
                    tag: VoucherObjectCardTag.text(text: 'NFT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
