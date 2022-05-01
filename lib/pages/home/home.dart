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
                  _MyTeamWidget(
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
