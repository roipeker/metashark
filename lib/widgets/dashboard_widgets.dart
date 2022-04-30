import 'package:metashark/commons.dart';

/// My Plans Info.
class DashboardTitleCard extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const DashboardTitleCard({
    Key? key,
    required this.children,
    this.title = "My Plan’s Info",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 10,
      color: Colors.white,
      padding: kPad16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // CardBadgeGold(),
            ],
          ),
          // --
          kGap16,
          ...children,
          // const CardLabelProgressBar(
          //   title: '30 456 MTS',
          //   label: '87%',
          //   percent: 0.87,
          //   barForegroundColor: AppColors.lightViolet,
          // ),
          // kGap16,
          // const CardRowTitle(
          //   label: "Total in Stalking",
          //   value: "32 000 MTS",
          // ),
        ],
      ),
    );
  }
}
