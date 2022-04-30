part of 'my_team.dart';

class UserReferralCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String cardTitle, title, subtitle;
  final String? imageUrl;
  final int rating;

  const UserReferralCard({
    Key? key,
    this.onTap,
    this.cardTitle = "Referral",
    this.title = "First & last name",
    this.subtitle = "Login",
    this.imageUrl,
    this.rating = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppCard(
    // color: AppColors.primaryPurple10,
    return MaterialButton(
      padding: EdgeInsets.zero,
      color: AppColors.primaryPurple10,
      onPressed: onTap,
      elevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      shape: kBorder8,
      child: Padding(
        padding: kPad16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              cardTitle,
              style: const TextStyle(
                color: Color(0xff5e5873),
                fontSize: 16,
              ),
            ),
            kGap8,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonAvatar(
                  radius: 32 / 2,
                  label: title,
                  imageUrl: imageUrl,
                ),
                kGap16,
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
                        color: Color(0xffb9b9c3),
                        fontSize: 14,
                      ),
                    )
                  ],
                ).exp(),
                StarRating(
                  count: rating,
                ),
                // Text(
                //   "GOLD",
                //   style: TextStyle(
                //     color: Color(0xffff9f43),
                //     fontSize: 14,
                //     fontFamily: "Open Sans",
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int count;
  final double size;
  final double gap;

  const StarRating({
    Key? key,
    this.gap = 0,
    this.count = 4,
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        count,
        (index) => Icon(
          AppIcons.star_2,
          color: AppColors.starOrange,
          size: size,
        ).padding(gap),
      ),
    );
  }
}

class _LoginItem extends StatelessWidget {
  final VoidCallback? onTap;

  const _LoginItem({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      hoverElevation: 0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: SafeArea(
        child: Padding(
          padding: kPadH16V8,
          child: Row(
            children: [
              CommonAvatar(),
              kGap16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "First & last name",
                        style: TextStyle(
                          color: Color(0xff5e5873),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      kGap8,
                      StarRating(
                        count: 4,
                      )
                    ],
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xffb9b9c3),
                      fontSize: 14,
                    ),
                  )
                ],
              ).exp(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "850/1000",
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 14,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Active",
                    style: TextStyle(
                      color: Color(0xff28c76f),
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
