part of 'my_team.dart';

class _TeamCard extends StatelessWidget {
  const _TeamCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RectLayoutChangedBuilder(
      builder: (_, rect, child) {
        var ratio = rect.size.aspectRatio;
        // var size = Size(con.maxWidth, 300);
        return Container(
          width: 300,
          // height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: kBoxShadow4,
            gradient: RadialGradient(
              center: Alignment.topLeft,
              colors: [
                Color(0xffDE8114),
                Color(0xffD32A86),
              ],
              // radius: 2 * size.aspectRatio / 2,
              radius: 2 * ratio / 2,
            ),
          ),
          padding: kPad16,
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Моя команда",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w600,
            ),
          ),
          TeamRowCard(
            label: 'Партнеры',
            value: '12',
            iconData: AppIcons.person,
            brightness: Brightness.dark,
          ),
          TeamRowCard(
            label: 'Структура',
            value: '10 000',
            iconData: AppIcons.people,
            brightness: Brightness.dark,
          ),
          TeamRowCard(
            label: 'Активные',
            value: '3890',
            iconData: AppIcons.power_settings_new,
            brightness: Brightness.dark,
          ),
        ].separator(kGap16),
      ),
    );
  }
}

class _UserCardTop extends StatelessWidget {
  final VoidCallback? onShareTap;
  final VoidCallback? onTap;

  const _UserCardTop({
    Key? key,
    this.onTap,
    this.onShareTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: kBorder8,
      onPressed: onTap,
      color: AppColors.appbarIconGrey,
      child: Padding(
        padding: kPad16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonAvatar(
                  radius: 32 / 2,
                  label: 'L',
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
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        kGap8,
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
            ).exp(),
            Transform.translate(
              offset: Offset(10, -8),
              child: IconButton(
                onPressed: onShareTap,
                padding: EdgeInsets.zero,
                icon: Icon(
                  AppIcons.share,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  final VoidCallback? onTap;

  const _UserCard({Key? key, this.onTap}) : super(key: key);

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
              "Referral",
              style: TextStyle(
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
                  label: 'L',
                ),
                kGap16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First & last name",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 14,
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
                ).exp(),
                StarRating(),
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
