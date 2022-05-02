import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:metashark/commons.dart';

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
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

        AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            final p = (pageController.page ?? 0).round();
            if (p == 0) {
              return child!;
            } else if (p == 1) {
              return buildAlert("Not available");
            }
            return buildAlert("Will be available on 05/23/2022");
          },
          child: BottomActionLabelButtons(
            label1: 'Take',
            label2: 'Twist (1/3)',
            onTap1: onTakeTap,
            onTap2: onTwistTap,
          ),
        ),
        kGap32,
      ],
    );
  }

  Widget buildAlert(String message) {
    return AppCard(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
      color: AppColors.primaryPurple10,
      borderRadius: kBorderRadius4,
      elevation: 0,
      child: Text(
        message,
        style: const TextStyle(
          color: Color(0xff5e5873),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
