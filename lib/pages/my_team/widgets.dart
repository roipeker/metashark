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
