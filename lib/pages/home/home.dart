import 'package:metashark/commons.dart';

part 'home_state.dart';

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
                    onTap: onTopCardTap,
                    onShareTap: onShareTap,
                    title: 'First & last name',
                    subtitle: 'Login',
                    imageUrl: '',
                    rating: 5,
                  ),
                  kGap16,
                  const TeamCard(
                    title: "Моя команда",
                    label1: 'Партнеры',
                    value1: '12',
                    label2: 'Структура',
                    value2: '10 000',
                    label3: 'Активные',
                    value3: '3890',
                  ),
                  kGap16,
                  const DashboardTitleCard(
                    title: "My Plan’s Info",
                    children: [
                      CardRowTitle(
                        label: "Total earned",
                        value: "32 000 MTS",
                      ),
                      kGap16,
                      CardRowTitle(
                        label: "Total in Stalking",
                        value: "32 000 MTS",
                      ),
                    ],
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
