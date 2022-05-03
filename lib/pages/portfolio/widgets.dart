part of 'portfolio.dart';

class _PortfolioSection extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final String title;
  final String allLabel;
  final VoidCallback? onAllTap;
  final String? emptyHelpTitle;
  final String emptyHelpText;
  final String emptyButtonText;
  final VoidCallback? emptyButtonOnTap;

  const _PortfolioSection({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.title,
    this.allLabel = "All",
    this.onAllTap,
    this.emptyHelpTitle,
    required this.emptyHelpText,
    required this.emptyButtonText,
    required this.emptyButtonOnTap,
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

  bool get isEmpty => widget.itemCount == 0;

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
        ...(isEmpty ? getEmpty() : getContent()),
      ],
    );
  }

  List<Widget> getContent() {
    return <Widget>[
      ExpandablePageView.builder(
        clipBehavior: Clip.none,
        controller: controller,
        itemCount: widget.itemCount,
        pageSnapping: true,
        itemBuilder: widget.itemBuilder,
      ),
      kGap16,
      PageIndicator(
        controller: controller,
        count: widget.itemCount,
      ),
    ];
  }

  List<Widget> getEmpty() {
    return <Widget>[
      SafeArea(
        child: _EmptyCard(
          title: widget.emptyHelpTitle??widget.title,
          buttonText: widget.emptyButtonText,
          text: widget.emptyHelpText,
          onTap: widget.emptyButtonOnTap,
        ).paddingSymmetric(horizontal: 16),
      ),
      kGap8,
    ];
  }
}

class _EmptyCard extends StatelessWidget {
  final String title, text, buttonText;
  final VoidCallback? onTap;

  const _EmptyCard({
    Key? key,
    required this.title,
    required this.text,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 94,
                height: 94,
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius12,
                  color: AppColors.greyAccesoryIconColor.withOpacity(.2),
                  // color: Colors.white,
                ),
                clipBehavior: Clip.antiAlias,
                // alignment: Alignment.center,
                child: Transform.scale(
                  scale: 1.6,
                  child: const RiveAnimation.asset(
                    Rives.doryDemo,
                    // alignment: Alignment.topCenter,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              kGap16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kGap4,
                  Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.darkGrey,
                      fontSize: 14,
                    ),
                  )
                ],
              ).exp(),
            ],
          ),
          kGap16,
          OutlinedButton(
            // style: OutlinedButton.styleFrom(
            //   padding: const EdgeInsets.symmetric(vertical: 24),
            // ),
            onPressed: onTap,
            child: Text(buttonText),
          ),
        ],
      ),
      padding: kPad16,
      elevation: 4,
      borderRadius: kBorderRadius8,
      color: Colors.white,
    );
  }
}
