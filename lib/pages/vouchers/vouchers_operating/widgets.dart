part of 'vouchers_operating.dart';

class _VoucherCardItem extends StatelessWidget {
  final String title, subtitle, imageUrl;
  final VoidCallback? onTap;

  const _VoucherCardItem({
    Key? key,
    this.onTap,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image here
            Container(
              width: 97,
              // height: 90,
              color: Colors.grey,
              child: Image.asset(
                imageUrl,
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
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Color(0xff5e5873),
                            fontSize: 12,
                          ),
                        )
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
    );
  }
}
