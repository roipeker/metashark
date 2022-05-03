part of 'vouchers_operating.dart';

class VoucherChip extends StatelessWidget {
  final Widget child;

  const VoucherChip({Key? key, required this.child}) : super(key: key);

  VoucherChip.optional({
    Key? key,
    IconData? icon,
    String? label,
  })  : child = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 14,
                color: AppColors.greyAccesoryIconColor,
              ),
            if (label != null)
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.greyAccesoryIconColor,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Row(
    //   children: [
    //     Icon(
    //       AppIcons.person,
    //       size: 14,
    //     ),
    //     Text(
    //       "5",
    //       style: TextStyle(
    //         color: Color(0xffb9b9c3),
    //         fontSize: 12,
    //       ),
    //     ),
    //   ],
    // )

    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      color: AppColors.primaryPurple10,
      borderRadius: kBorderRadiusPill,
      child: child,
    );
  }
}

class _VoucherCardItem extends StatelessWidget {
  final String title, imageUrl;
  final VoidCallback? onTap;
  final String objects, createdAt;
  final List<Widget>? recipients;

  const _VoucherCardItem({
    Key? key,
    this.onTap,
    required this.title,
    // required this.subtitle,
    required this.imageUrl,
    required this.objects,
    required this.createdAt,
    this.recipients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 95,
      child: AppMaterialButton(
        padding: EdgeInsets.zero,
        clip: Clip.antiAlias,
        shape: kBorder8,
        elevation: 4,
        hoverElevation: 6,
        focusElevation: 2,
        highlightElevation: 1,
        color: Colors.white,
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 97,
                color: Colors.grey,
                height: double.infinity,
                child: AppFadeImage(
                  url: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 1,
                decoration: DottedDecoration(
                  shape: Shape.line,
                  linePosition: LinePosition.right,
                  dash: const [4, 2],
                  color: AppColors.darkGrey.withOpacity(.3),
                  strokeWidth: 2,
                ),
              ),
              Expanded(
                child: Container(
                  padding: kPad8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Color(0xff5e5873),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          kGap4,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Recipients: ",
                                style: TextStyle(
                                  color: Color(0xffb9b9c3),
                                  fontSize: 12,
                                ),
                              ),
                              kGap4,
                              if (recipients != null)
                                ...recipients!.separator(kGap4)
                            ],
                          ),
                          kGap4,
                          Text(
                            "Objects: $objects",
                            style: TextStyle(
                              color: Color(0xffb9b9c3),
                              fontSize: 12,
                            ),
                          ),
                          kGap4,
                          Text(
                            "Created at: 10.05.2022",
                            style: TextStyle(
                              color: Color(0xffb9b9c3),
                              fontSize: 12,
                            ),
                          ),
                          // Text(
                          //   subtitle,
                          //   style: const TextStyle(
                          //     color: Color(0xff5e5873),
                          //     fontSize: 12,
                          //   ),
                          // )
                        ],
                      ),
                      const CommonBadge.active(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
