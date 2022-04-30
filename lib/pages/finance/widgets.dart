part of 'finance.dart';

class BottomSheetCard extends StatelessWidget {
  final String title;
  final Widget child;

  const BottomSheetCard({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      willChange: false,
      isComplex: false,
      painter: _BottomSheetBackgroundExtender(
        height: context.mediaQuery.size.height,
      ),
      child: Container(
        // decoration: const BoxDecoration(
        //   borderRadius: BorderRadius.vertical(top: kRadius20),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Color(0x195e5873),
        //       blurRadius: 8,
        //       offset: Offset(0, -1),
        //     ),
        //     BoxShadow(
        //       color: Color(0x195e5873),
        //       blurRadius: 3,
        //       offset: Offset(0, -1),
        //     ),
        //   ],
        //   color: Colors.white,
        // ),
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: kPadH16,
              child: AppText(title, style: kFinanceAssetItemTitle),
            ),
            kGap16,
            child,
          ],
        ),
      ),
    );
  }
}

class _MyAssetsPanel extends StatelessWidget {
  final List<FinanceAssetVo> assets;
  final ValueChanged<int> onSelected;

  const _MyAssetsPanel({
    Key? key,
    required this.assets,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetCard(
      title: "My assets",
      child: ListView.builder(
        itemBuilder: (_, index) {
          final vo = assets[index];
          return FinanceAssetItem(
            iconId: vo.iconId,
            onTap: () {
              onSelected(index);
            },
            title: vo.title,
            subtitle: vo.subtitle,
            titleValue: vo.value,
            subtitleValue: vo.valueUsdt,
          );
        },
        itemCount: assets.length,
      ),
    );
  }
}

class FinanceTopCard extends StatelessWidget {
  const FinanceTopCard({Key? key}) : super(key: key);

  Widget buildTitle() {
    const _titleStyle = TextStyle(
      color: Color(0xff5e5873),
      fontSize: 24,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w700,
    );
    const _subtitleStyle = TextStyle(
      color: Color(0xff5e5873),
      fontSize: 14,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("12,050.00 USDT", style: _titleStyle),
        Text("≈ 3 000 MTS", style: _subtitleStyle),
      ],
    );
  }

  Widget buildBar() {
    final _values = [6, 3, 2, 2];
    final _colors = [
      const Color(0xffFF708B),
      const Color(0xffFF9F43),
      const Color(0xff28C76F),
      const Color(0xff9E95F5),
    ];
    return ClipRRect(
      borderRadius: kBorderRadius8,
      child: Row(
        children: _colors.mapIndexed2((index, color) {
          return Flexible(
            flex: _values[index],
            child: Container(
              height: 10,
              color: color,
            ),
          );
        }).separator(const Gap(2)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const _titleStyle = TextStyle(
      color: Color(0xff5e5873),
      fontSize: 14,
    );
    return AppCard(
      borderRadius: kBorderRadius12,
      padding: kPad16.copyWith(bottom: 24),
      color: AppColors.primaryPurple.withOpacity(.1),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText(
            "General balance",
            style: _titleStyle,
          ),
          const Gap(10),
          buildTitle(),
          const Gap(10),
          buildBar(),
        ],
      ),
    );
  }
}

class FinanceAssetItem extends StatelessWidget {
  // final FinanceAssetVo
  final String? iconId;
  final String title;
  final String subtitle;
  final String titleValue;
  final String subtitleValue;
  final VoidCallback? onTap;

  const FinanceAssetItem({
    Key? key,
    required this.iconId,
    required this.title,
    required this.subtitle,
    required this.titleValue,
    required this.subtitleValue,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton(
      child: Row(
        children: [
          SizedBox(width: 32, height: 32, child: getAvatar()),
          kGap16,
          Flexible(
            child: _FinanceAssetItemValues(
              align: TextAlign.left,
              title: title,
              subtitle: subtitle,
            ),
          ),
          Flexible(
            child: _FinanceAssetItemValues(
              align: TextAlign.right,
              title: titleValue,
              subtitle: subtitleValue,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      onTap: onTap,
    );
  }

  Widget getAvatar() {
    if (iconId != null) {
      return SvgPicture.asset(iconId!);
    }
    return CircleAvatar();
  }
}

class _FinanceAssetItemValues extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextAlign align;

  const _FinanceAssetItemValues({
    Key? key,
    required this.title,
    this.align = TextAlign.left,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppText(
          title,
          style: kFinanceAssetItemTitle,
          textAlign: align,
        ),
        if (subtitle != null)
          AppText(
            subtitle!,
            style: kFinanceAssetItemSubtitle,
            textAlign: align,
          ),
      ],
    );
  }
}

class _BottomSheetBackgroundExtender extends CustomPainter {
  final double? height;
  final Radius borderRadius;
  final Color? shadowColor;
  final double? shadowElevation;

  _BottomSheetBackgroundExtender({
    this.height,
    this.borderRadius = kRadius20,
    this.shadowColor = AppColors.darkGrey10,
    this.shadowElevation = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    var h = height ?? size.height * 2;
    final rect = Rect.fromLTWH(0, 0, size.width, h);
    final rrect = RRect.fromRectAndCorners(
      rect,
      topLeft: borderRadius,
      topRight: borderRadius,
    );
    // canvas.drawRRect( rrect, paint );
    final path = Path();
    path.addRRect(rrect);

    canvas.drawShadow(
      path,
      shadowColor ?? AppColors.darkGrey10,
      shadowElevation ?? 10,
      true,
    );
    canvas.drawPath(path, paint);

    // canvas.drawRect(
    //   Rect.fromLTWH(.5, 40.5, size.width - 1, h),
    //   paint,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
