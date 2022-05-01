import 'package:metashark/commons.dart';

part 'career_state.dart';

part 'widgets.dart';

class CareerPage extends StatefulWidget {
  static const url = "Career";

  const CareerPage({Key? key}) : super(key: key);

  @override
  createState() => _CareerPage();
}

class _CareerPage extends _CareerState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Career',
      ),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                kGap16,
                _TopCard(onTap: onTopCardTap).paddingSymmetric(horizontal: 16),
                kGap16,
                SizedBox(
                  height: 160,
                  child: PageView(
                    clipBehavior: Clip.none,
                    controller: pageController,
                    children: [
                      ...topCardsData.map2((e) {
                        return _CarrouselCard(
                          title: e.title,
                          subtitle: e.subtitle,
                          stars: e.stars,
                          percent: e.percent,
                        ).paddingSymmetric(horizontal: 16);
                      }),
                    ],
                  ),
                ),
                kGap16,
                PageIndicator(
                  controller: pageController,
                  count: 4,
                ),
                kGap16,
                ...List.generate(
                  7,
                  (index) => _CareerListItem(
                    onTap: () => onItemTap(),
                  ),
                ).separator(kGap1),
                kGap16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
