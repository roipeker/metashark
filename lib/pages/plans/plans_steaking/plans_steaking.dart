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
        child: Padding(
          padding: kPad16,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// build titanium card.
              Expanded(
                child: PageView(
                  controller: pageController,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  children: [
                    ...List.generate(
                      count,
                      (index) => Center(
                        child: Padding(
                          padding: kPad16,
                          child: FittedBox(
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                            child: SizedBox(
                              width: 343,
                              height: 618,
                              child: PlanCardTitanium(
                                onBuyTap: onBuyTap,
                                onShowGiftsTap: onShowGifts,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
