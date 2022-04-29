part of 'quest.dart';

class _QuestCard extends StatelessWidget {
  final String title;
  final VoidCallback? onShowGiftsTap;

  const _QuestCard({Key? key, required this.title, this.onShowGiftsTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sectionTitleStyle = TextStyle(
      color: Color(0xff5e5873),
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
    const cardLabelTitleStyle = TextStyle(
      color: Color(0xff5e5873),
      fontSize: 14,
    );

    return AppCard(
      elevation: 4,
      color: Colors.white,
      padding: kPad16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title, //"Quest “KING”",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          kGap16,
          const Divider(),
          kGap16,
          // labeled
          const Text(
            "Access conditions",
            style: sectionTitleStyle,
          ),

          kGap8,
          AppCard.smallRowTitle(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reach rank:",
                  style: cardLabelTitleStyle,
                ),
                Row(
                  children: [
                    Text(
                      "BOSS",
                      style: TextStyle(
                        color: Color(0xffff6c2c),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    kGap8,
                    Icon(
                      AppIcons.check,
                      size: 14,
                      color: AppColors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
          kGap16,
          const Text(
            "Execution conditions",
            style: sectionTitleStyle,
          ),
          kGap8,
          AppCard.smallRowTitle(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Active partners:",
                      style: cardLabelTitleStyle,
                    ),
                    Text(
                      "Branch filter 25%",
                      style: TextStyle(
                        color: Color(0x7f5e5873),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "50/100",
                      style: cardLabelTitleStyle,
                    ),
                    kGap8,
                    Icon(
                      AppIcons.check,
                      size: 14,
                      color: AppColors.greyAccesoryIconColor,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // -
          kGap8,
          AppCard.smallRowTitle(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time to complete:",
                  style: cardLabelTitleStyle,
                ),
                Row(
                  children: [
                    Text(
                      "30 days",
                      style: cardLabelTitleStyle,
                    ),
                    kGap8,
                    Icon(
                      AppIcons.timer,
                      size: 14,
                      color: AppColors.greyAccesoryIconColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          kGap16,
          const Divider(),
          kGap16,
          SizedBox(
            height: 47,
            child: OutlinedButton.icon(
              icon: Icon(AppIcons.card_giftcard, size: 20),
              onPressed: onShowGiftsTap,
              label: Text('Show gifts'),
            ),
          ),
        ],
      ),
    );
  }
}
