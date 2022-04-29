import 'package:metashark/commons.dart';

//// todo: use ContractBadge here ,,,
class CardBadgeGold extends StatelessWidget {
  const CardBadgeGold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius4,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffffbb32), Color(0xffdb9e23)],
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 4,
      ),
      child: const Text(
        "GOLD",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}


class CommonBadge extends StatelessWidget {
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final String text;

  const CommonBadge.active({
    Key? key,
    this.text = 'Active',
  })  : backgroundColor = AppColors.green,
        textStyle = null,
        borderRadius = null,
        foregroundColor = Colors.white,
        padding = kPad4,
        super(key: key);

  const CommonBadge.inactive({
    Key? key,
    this.text = 'Inactive',
  })  : backgroundColor = AppColors.red,
        textStyle = null,
        borderRadius = null,
        foregroundColor = Colors.white,
        padding = kPad4,
        super(key: key);

  const CommonBadge({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textStyle,
    this.foregroundColor = Colors.white,
    this.padding = kPad4,
    this.borderRadius, // kBorderRadius4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = textStyle ??
        const TextStyle(
          color: Colors.white,
          fontSize: 10,
        );
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius4,
        color: backgroundColor ?? const Color(0xff28c76f),
      ),
      padding: padding,
      child: Text(
        text,
        style: effectiveStyle.copyWith(color: foregroundColor),
      ),
    );
  }
}


