import 'package:metashark/commons.dart';

class VoucherListItemButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final String title;
  final Widget? suffix;

  const VoucherListItemButton({
    Key? key,
    this.onTap,
    required this.icon,
    required this.title,
    this.suffix,
  }) : super(key: key);

  const VoucherListItemButton.create({
    Key? key,
    this.onTap,
    required this.icon,
    required this.title,
  })  : suffix = const Icon(
          AppIcons.add,
          size: 24,
          color: AppColors.greyAccesoryIconColor,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton(
      color: Colors.white,
      padding: kPad16,
      elevation: 2,
      onTap: onTap,
      shape: kBorder8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: AppColors.primaryPurple,
              ),
              kGap16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  kGap4,
                  const Text(
                    "Quantity: 5",
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}

// --

class VoucherLogItem extends StatelessWidget {
  final String title, subtitle, id;
  final VoidCallback? onTap;

  const VoucherLogItem({
    Key? key,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LogBorderButton(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xffb9b9c3),
                  fontSize: 14,
                ),
              ),
            ],
          ).exp(),
          Text(
            id,
            style: TextStyle(
              color: Color(0xff5e5873),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// --
class LogBorderButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const LogBorderButton({Key? key, required this.child, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        borderRadius: kBorderRadius8,
        border: Border.all(color: AppColors.darkGrey12, width: 1),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        shape: kBorder8,
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        onPressed: onTap,
        child: Padding(
          padding: kPad8,
          child: child,
        ),
      ),
    );
  }
}
