part of 'career.dart';


class _CarrouselCard extends StatelessWidget {
  final String title, subtitle;
  final double percent;
  final int stars;

  const _CarrouselCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.percent = 0.5,
    required this.stars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 4,
      color: Colors.white,
      padding: kPad16,
      child: Column(
        children: [
          // title
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Color(0xff5e5873),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      kGap8,
                      StarRating(
                        size: 18,
                        count: stars,
                      ),
                    ],
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xffb9b9c3),
                      fontSize: 16,
                    ),
                  )
                ],
              ).exp(),
              CircularPercentStar(
                percent: percent,
                size: 56,
              ),
            ],
          ),
          kGap16,
          AppCard(
            color: AppColors.primaryPurple10,
            padding: kPadH16V8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Active partners:",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Branch filter 25%",
                      style: TextStyle(
                        color: Color(0x7f5e5873),
                        fontSize: 12,
                      ),
                    )
                  ],
                ).exp(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "50/100",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 14,
                      ),
                    ),
                    kGap8,
                    Icon(
                      AppIcons.check,
                      color: AppColors.greyAccesoryIconColor,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopCard extends StatelessWidget {
  final VoidCallback? onTap;

  const _TopCard({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius8,
        boxShadow: kBoxShadow4,
        gradient: const LinearGradient(
          colors: [Color(0xff7E4BEA), Color(0xff9A2ACE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // center: Alignment.topLeft,
          // radius: 2,
        ),
      ),
      // padding: kPad16,
      child: AppMaterialButton(
        padding: kPad16,
        shape: kBorder8,
        onTap: onTap,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My rank",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Text(
                  "BOSS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                kGap16,
                StarRating(
                  count: 4,
                  size: 24,
                ),
              ],
            ),
            kGap16,
            // Active partners
            AppCard(
              padding: kPadH16V8,
              color: AppColors.appbarIconGrey.withOpacity(.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Active partners",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "1300",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            // 1300
          ],
        ),
      ),
    );
  }
}



/// ---
// small title

class _CareerListItem extends StatelessWidget {
  final VoidCallback? onTap;

  const _CareerListItem({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton(
      onTap: onTap,
      color: Colors.white,
      padding: kPadH16V8,
      child: _CareerListItemSmallTitle(),
    );
  }
}

class _CareerListItemSmallTitle extends StatelessWidget {
  const _CareerListItemSmallTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 38,
              height: 38,
              child: FittedBox(
                child: CircularPercent(
                  percent: .8,
                  size: 56,
                  child: Text(
                    "80%",
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 19,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            kGap16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "First & last name",
                  style: TextStyle(
                    color: Color(0xff5e5873),
                    fontSize: 16,
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xffb9b9c3),
                    fontSize: 14,
                  ),
                )
              ],
            )
          ],
        ).exp(),
        kGap8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "850/1000",
              style: TextStyle(
                color: Color(0xff5e5873),
                fontSize: 14,
              ),
            ),
            Text(
              "1 line",
              style: TextStyle(
                color: Color(0xffb9b9c3),
                fontSize: 14,
              ),
            ),
          ],
        )
      ],
    );
  }
}



