import 'package:metashark/commons.dart';

part 'plans_steaking_state.dart';

class PlansSteakingPage extends StatefulWidget {
  static const url = "/plans-steaking";

  const PlansSteakingPage({Key? key}) : super(key: key);

  @override
  createState() => _PlansSteakingPage();
}

class _PlansSteakingPage extends _PlansSteakingState {
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
                        // child: FittedBox(
                        //   // alignment: Alignment.center,
                        //   fit: BoxFit.contain,
                        //   child: SizedBox(
                        //     width: 343,
                        //     height: 618,
                        //     child: PlanCardWidget(
                        //       data: data,
                        //       onBuyTap: onBuyTap,
                        //       onShowGiftsTap: onShowGifts,
                        //     ),
                        //   ),
                        // ),
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
