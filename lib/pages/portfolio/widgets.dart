part of 'portfolio.dart';

class _PortfolioSection extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final String title;
  final String allLabel;
  final VoidCallback? onAllTap;

  const _PortfolioSection({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.title,
    this.allLabel = "All",
    this.onAllTap,
  }) : super(key: key);

  @override
  State<_PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<_PortfolioSection> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xff5e5873),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextButton(
              style: kTextButtonStyleRightAll,
              onPressed: widget.onAllTap,
              child: Text(widget.allLabel),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
        kGap8,
        ExpandablePageView.builder(
          clipBehavior: Clip.none,
          controller: controller,
          itemCount: widget.itemCount,
          pageSnapping: true,
          itemBuilder: widget.itemBuilder,
        ),
        // VoucherCard.collection(
        //   imageUrl: MockupImages.mockCardNft,
        //   collection: 'Collection: Name',
        //   id: '# 784344',
        //   status: 'Status: VIP',
        //   strength: 'Strength: 156',
        //   onTap: () {},
        //   tag: VoucherObjectCardTag.text(text: 'NFT'),
        // ),
        kGap16,
        PageIndicator(
          controller: controller,
          count: widget.itemCount,
        ),
      ],
    );
  }
}
