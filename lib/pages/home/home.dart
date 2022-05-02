import 'package:metashark/commons.dart';

part 'home_state.dart';

part 'widgets.dart';

class HomePage extends StatefulWidget {
  static const url = "Dashboard";

  const HomePage({Key? key}) : super(key: key);

  @override
  createState() => _HomePage();
}

class _HomePage extends _HomeState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: const CommonAppBar(
          title: 'Dashboard',
        ),
        body: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: SafeArea(
            child: Scrollbar(
              controller: scrollController,
              child: ListView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                padding: kPad16,
                shrinkWrap: true,
                children: [
                  _HomeCurrencyWidget(
                    onTap: onCurrencyTap,
                    label: '0.84639048',
                    value: 'MTS/USDT',
                    icon: const Circle(
                      size: 32,
                      color: Color(0xffFF6C2C),
                      child: Icon(
                        AppIcons.meta_shark_logo,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  kGap16,
                  _EarnedWidget(
                    title: 'Earned',
                    today: '100 MTS',
                    total: '1000 MTS',
                    onTap: onEarnedTap,
                  ),
                  kGap16,
                  UserTopCardShare(
                    // onShareTap: onShareTap,
                    title: 'First & last name',
                    subtitle: 'Login',
                    imageUrl: '',
                    rating: 5,
                    onTap: onMyUserTap,
                  ),
                  kGap16,
                  MyTeamWidget(
                    title: "My team",
                    label1: 'Partners',
                    value1: '12',
                    label2: 'Structure',
                    value2: '10 000',
                    label3: 'Active',
                    value3: '3890',
                    onTap: onMyTeamTap,
                  ),
                  kGap16,
                  _MyPackageWidget(
                    data: kPackageTitanium,
                    onTap: onMyPackageTap,
                  ),
                  kGap16,
                  _MyRankWidget(
                    onTap: onMyRankTap,
                    rating: 4,
                    category: 'BOSS',
                    nextCategory: 'KING',
                    nextRating: 5,
                    percent: 0.85,
                  ),
                  kGap16,
                  _MyPlanInfoWidget(
                    onTap: onMyPlanInfoTap,
                    onPurchasePackageTap: onMyPlanInfoPackageTap,
                    title: "My Plan’s Info",
                    earned: "32 000 MTS",
                    stalking: "32 000 MTS",
                  ),
                  kGap16,
                  _MyOfficeWidget(
                    onTap: onMyOfficeTap,
                    title: "My office",
                    barPercent: 0.7,
                    color: AppColors.green,
                    barLabel: '347 days',
                    status: 'Active',
                    subtitle: 'Activated: 04/23/2022',
                  ),
                  kGap16,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeCurrencyWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String value, label;
  final Widget icon;

  const _HomeCurrencyWidget({
    Key? key,
    this.onTap,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCardWidget(
      onTap: onTap,
      background: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              kGap16,
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class _EarnedWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String title, total, today;

  const _EarnedWidget({
    Key? key,
    required this.title,
    required this.total,
    required this.today,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCardWidget(
      onTap: onTap,
      background: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          kGap16,
          CardRowTitle(
            label: "Total earned",
            value: total,
          ),
          kGap16,
          CardRowTitle(
            label: "Income today",
            value: today,
          ),
        ],
      ),
    );
  }
}
