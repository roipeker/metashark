import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:metashark/commons.dart';
import 'package:rive/rive.dart' hide LinearGradient, Fill;

part 'roulette_state.dart';

part 'widgets.dart';

class RoulettePage extends StatefulWidget {
  static const url = "Roulette";

  const RoulettePage({Key? key}) : super(key: key);

  @override
  createState() => _RoulettePage();
}

class _RoulettePage extends _RouletteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Roulette',
      ),
      body: Padding(
        padding: kPadH16,
        child: ScrollConfiguration(
          behavior: AppScrollBehavior(),
          child: showCards ? _buildCards() : _NoCards(onTap: onNoCardsTap),
        ),
      ),
    );
  }

  Widget _buildCards() {
    return Column(
      children: [
        kGap32,
        //// page view.
        Expanded(
          child: PageView(
            controller: pageController,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: [
              ...controllers.map2(
                (controller) => _CardFlip(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
        kGap8,
        PageIndicator(
          controller: pageController,
          count: controllers.length,
        ),
        const Gap(30),
        BottomActionLabelButtons(
          label1: 'Take',
          label2: 'Twist (1/3)',
          onTap1: onTakeTap,
          onTap2: onTwistTap,
        ),
        kGap32,
      ],
    );
  }
}
