part of 'voucher_details_sheet.dart';

class _Pane extends StatelessWidget {
  final String title;
  final Widget child;

  const _Pane({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.darkGrey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        kGap16,
        child,
      ],
    );
  }
}

class _UserCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String title, subtitle;
  final String? imageUrl;
  final IconData? subtitleIconData;

  const _UserCard({
    Key? key,
    this.onTap,
    this.title = "First & last name",
    this.subtitle = "Login",
    this.imageUrl,
    this.subtitleIconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      color: Colors.white,
      onPressed: onTap,
      elevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      shape: kBorder8,
      child: Padding(
        padding: kPad16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAvatar(
              radius: 32 / 2,
              label: title,
              imageUrl: imageUrl,
              backgroundColor: AppColors.primaryPurple,
            ),
            kGap12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff5e5873),
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    if (subtitleIconData != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          subtitleIconData,
                          size: 16,
                          color: AppColors.greyAccesoryIconColor,
                        ),
                      ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.greyAccesoryIconColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ).exp(),
          ],
        ),
      ),
    );
  }
}

class _LabelValueRow extends StatelessWidget {
  final String label, value;

  const _LabelValueRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: AppColors.darkGrey,
      fontSize: 14,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: style,
        ),
        Text(
          value,
          textAlign: TextAlign.end,
          style: style,
        )
      ],
    );
  }
}

class PageViewWithIndicator extends StatefulWidget {
  final PageController? controller;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Clip clipBehavior;
  final double indicatorGap;

  const PageViewWithIndicator({
    Key? key,
    this.controller,
    this.clipBehavior = Clip.none,
    this.indicatorGap = 8,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  State<PageViewWithIndicator> createState() => _PageViewWithIndicatorState();
}

class _PageViewWithIndicatorState extends State<PageViewWithIndicator> {
  late PageController controller;
  bool localController = false;

  @override
  void initState() {
    localController = widget.controller == null;
    if (localController) {
      controller = PageController();
    } else {
      controller = widget.controller!;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (localController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandablePageView.builder(
          clipBehavior: widget.clipBehavior,
          controller: controller,
          itemCount: widget.itemCount,
          pageSnapping: true,
          itemBuilder: widget.itemBuilder,
        ),
        Gap(widget.indicatorGap),
        PageIndicator(
          controller: controller,
          count: widget.itemCount,
        ),
      ],
    );
  }
}
