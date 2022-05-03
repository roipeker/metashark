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
                children: getItemsList().separator(kGap16),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getItemsList() {
    final builder = kWidgetBuilderMap[widget.type] ?? getCinemaTicket;
    return builder();
    // return getNft();
    // return getProducts();
    // return getCinemaTicket();
    // return getSubscriptionTicket();
  }

  late final kWidgetBuilderMap = <String?, List<Widget> Function()>{
    'subscription': getSubscriptionTicket,
    'cinema': getCinemaTicket,
    'products': getProducts,
    'nft': getNft,
  };

  List<Widget> getSubscriptionTicket() {
    return List.generate(
      3,
      (index) => VoucherCard.network(
        title: 'Subscription',
        line1: 'Action: 6 months',
        line2: 'Activate until: 07/12/2022',
        tile: const VoucherIconTile(
          color: Color(0xffFF6C2C),
          iconData: AppIcons.subscriptions,
        ),
        tag: VoucherObjectCardTag.text(text: 'Activation'),
        onTap: () {},
      ),
    );
  }

  List<Widget> getCinemaTicket() {
    return List.generate(
      5,
      (index) => VoucherCard.network(
        title: 'Cinema ticket',
        line1: 'Action: 3 months',
        line2: 'Activate until: 05/23/2022',
        tile: const VoucherIconTile(
          color: Color(0xff18CBC7),
          iconData: AppIcons.park_tickets_couple,
        ),
        tag: VoucherObjectCardTag.text(text: 'Cinema'),
        onTap: () {},
      ),
    );
  }

  List<Widget> getProducts() {
    return List.generate(
      4,
      (index) => VoucherCard.present(
        imageUrl: MockupImages.mockIphone,
        title: 'iPhone 11',
        type: ObjectPresentCard.small,
        body: MockDataFactory.loremWords(30),
        onTap: () {},
      ),
    );
  }

  List<Widget> getNft() {
    return List.generate(
      2,
      (index) => VoucherCard.collection(
        imageUrl: MockupImages.mockCardNft,
        collection: 'Collection: Name',
        id: '# 784344',
        status: 'Status: VIP',
        strength: 'Strength: 156',
        onTap: () {},
        tag: VoucherObjectCardTag.text(text: 'NFT'),
      ),
    );
  }
}
