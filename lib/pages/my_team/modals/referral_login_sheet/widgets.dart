part of 'referral_login_sheet.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonAvatar(
          radius: 40 / 2,
          label: 'F',
        ),
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
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w600,
                  ),
                ).exp(),
                StarRating(),
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
      ],
    );
  }
}
