import 'package:metashark/commons.dart';

part 'binary_statistics_state.dart';

class BinaryStatisticsPage extends StatefulWidget {
  // static const url = "/binary-statistics";
  static const urlParamId = "statistics";

  const BinaryStatisticsPage({Key? key}) : super(key: key);

  @override
  createState() => _BinaryStatisticsPage();
}

class _BinaryStatisticsPage extends _BinaryStatisticsState {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefreshPull,
      child: Scrollbar(
        controller: scrollController,
        child: SafeArea(
          child: ListView(
            controller: scrollController,
            padding: kPad16,
            clipBehavior: Clip.none,
            shrinkWrap: true,
            children: [
              _PageCard(
                iconData: AppIcons.icon_awesome_code_branch,
                title: "Binary bonus",
                child: Column(
                  children: const [
                    kGap16,
                    CardRowTitle(
                      label: "Total income:",
                      value: "1200 MTS",
                    ),
                    kGap16,
                    _Graph(),
                  ],
                ),
              ),
              kGap16,
              _PageCard(
                iconData: AppIcons.work,
                title: "Package",
                child: Column(
                  children: [
                    kGap16,
                    _PackageUpgrade(),
                    kGap16,
                    AppElevatedButton.primary(
                      child: Text('Upgrade'),
                      onTap: onUpgradeTap,
                    ),
                  ],
                ),
              ),
              kGap16,
              _PageCard(
                iconData: AppIcons.format_color_reset,
                title: "Binary limit",
                child: Column(
                  children: [
                    kGap16,
                    CardRowTitle(
                      label: "Earned",
                      value: "1000 MTS",
                    ),
                    kGap16,
                    CardRowTitle(
                      label: "burned down",
                      value: "300 MTS",
                    ),
                    kGap16,
                    CardLabelProgressBar(
                      title: 'Limit: 100 MTS/day',
                      label: '0.5574 MTS',
                      helperText: '3 days ago',
                      percent: 0.6,
                    ),
                    kGap16,
                    CardLabelProgressBar(
                      title: 'Limit: 500 MTS/day',
                      label: '5.39 MTS',
                      helperText: '3 days ago',
                      percent: 0.86,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class _PackageUpgrade extends StatelessWidget {
  const _PackageUpgrade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _card('BRONZE').exp(),
        kGap4,
        Icon(
          AppIcons.arrow_right_alt,
          size: 18,
          color: AppColors.appbarIconGrey,
        ),
        kGap4,
        _card('SILVER').exp(),
      ],
    );
  }

  Widget _card(String label) {
    return AppCard(
      padding: kPad8,
      color: AppColors.primaryPurple.withOpacity(.1),
      child: Center(
        child: Text(
          "$label",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _PageCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Widget child;

  const _PageCard({
    Key? key,
    required this.iconData,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 10,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: context.theme.primaryColor,
              ),
              kGap8,
              Text(
                title,
                style: TextStyle(
                  color: AppColors.appbarIconGrey,
                  fontSize: 20,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          child,
        ],
      ),
    );
  }
}

class _Graph extends StatefulWidget {
  const _Graph({Key? key}) : super(key: key);

  @override
  State<_Graph> createState() => _GraphState();
}

class _GraphState extends State<_Graph> {
  int selected = 0;

  final items = [7, 30, 12];
  final separators = [kGap16, const Gap(4), kGap16];

  Widget get separator => separators[selected];

  int get count => items[selected];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 98,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(count, (e) {
                return _ChartBar(
                  percent: randomDouble(),
                ).exp();
              }).separator(separator),
            ],
          ),
        ),
        kGap16,

        /// 3 buttons ?
        SizedBox(
          height: 35,
          child: Row(
            children: [
              'Week',
              'Month',
              'Year',
            ]
                .mapIndexed2(
                  (index, e) => AppElevatedButton(
                    style: index == selected
                        ? kElevatedButtonPrimary
                        : kElevatedButtonSecondary,
                    child: Text(e),
                    onTap: () {
                      selected = index;
                      update();
                    },
                  ).exp(),
                )
                .separator(kGap10),
          ),
        )
      ],
    );
  }
}

class _ChartBar extends StatefulWidget {
  final double percent;

  const _ChartBar({Key? key, this.percent = 0.5}) : super(key: key);

  @override
  State<_ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<_ChartBar> {
  double get percent => widget.percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.primaryPurple.withOpacity(.1),
        borderRadius: kBorderRadius8,
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.bottomLeft,
      child: AnimatedContainer(
        duration: .3.seconds,
        height: 98 * percent,
        width: double.infinity,
        color: AppColors.primaryPurple,
      ),
    );
  }
}
