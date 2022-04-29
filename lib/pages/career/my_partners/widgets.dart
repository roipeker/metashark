part of 'my_partners.dart';

class _PartnerCard extends StatelessWidget {
  const _PartnerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 4,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PartnerCardTitle(),
          kGap16,
          _banner(label: "Partners:", value: "1000"),
          kGap8,
          _banner(label: "Taken into account:", value: "850"),
        ],
      ),
    );
  }

  Widget _banner({
    required String label,
    required String value,
  }) {
    const _baseStyle = TextStyle(
      color: Color(0xff5e5873),
      fontSize: 14,
    );
    return AppCard(
      color: AppColors.primaryPurple10,
      padding: kPadH16V8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: _baseStyle),
          Text(value, style: _baseStyle)
        ],
      ),
    );
  }
}

class _SmallPartnerCard extends StatelessWidget {
  const _SmallPartnerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 4,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SmallPartnerCardTitle(),
        ],
      ),
    );
  }
}

class _PartnerItemTile extends StatelessWidget {
  final VoidCallback? onTap;

  const _PartnerItemTile({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton(
      onTap: () {},
      color: Colors.white,
      padding: kPadH16V8,
      child: _SmallPartnerCardTitle(),
    );
  }
}

class _SmallPartnerCardTitle extends StatelessWidget {
  const _SmallPartnerCardTitle({Key? key}) : super(key: key);

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

class _PartnerCardTitle extends StatelessWidget {
  const _PartnerCardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularPercentStar(
              percent: .61,
              size: 56,
            ),
            // CircularPercent(
            //   percent: .61,
            //   size: 56,
            //   child: _CircularTitleStar(percent: .61),
            // ),
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
        _BannerTile(title: "1 line"),
      ],
    );
  }
}

class _BannerTile extends StatelessWidget {
  final String title;

  const _BannerTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xfff595e0), Color(0xffd468a9)],
        ),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
