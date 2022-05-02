import 'package:metashark/commons.dart';

part 'plans_farming_state.dart';

class PlansFarmingPage extends StatefulWidget {
  static const url = "/plans-farming";

  static bool isValidIndex(String id) {
    final index = int.tryParse(id) ?? -1;
    return index >= 0 && index <= kPackageFarmingCards.length - 1;
  }

  static int getIndexById(String id) {
    final index = int.tryParse(id) ?? -1;
    return index.clamp(0, kPackageFarmingCards.length - 1);
    // return index;
  }

  final int farmingIndex;

  const PlansFarmingPage({Key? key, this.farmingIndex = 0}) : super(key: key);

  @override
  createState() => _PlansFarmingPage();
}

class _PlansFarmingPage extends _PlansFarmingState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kGap16,
            Expanded(
              child: PageView(
                controller: pageController,
                clipBehavior: Clip.none,
                pageSnapping: true,
                children: cards.map2(
                  (data) => Padding(
                    padding: kPadH16,
                    child: PlanCardWidget(
                      data: data,
                      onBuyTap: onBuyTap,
                      onShowGiftsTap: onShowGifts,
                    ),
                  ),
                ),
              ),
            ),
            kGap16,
            PageIndicator(
              controller: pageController,
              count: count,
            ),
            kGap16,
          ],
        ),
      ),
    );
  }
}
