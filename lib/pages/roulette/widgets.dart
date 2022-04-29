part of 'roulette.dart';

class _CardFlip extends StatefulWidget {
  final FlipCardController controller;

  const _CardFlip({Key? key, required this.controller}) : super(key: key);

  @override
  State<_CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<_CardFlip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadH16,
      child: Center(
        child: AspectRatio(
          aspectRatio: 311 / 589,
          child: FittedBox(
            child: FlipCard(
              controller: widget.controller,
              flipOnTouch: false,
              fill: Fill.none,
              direction: FlipDirection.HORIZONTAL,
              front: _Front(child: Image.asset(Images.sampleCardFront1)),
              back: _Back(child: Image.asset(Images.sampleCardBack1)),
            ),
          ),
        ),
      ),
    );
  }
}

class _Front extends StatelessWidget {
  final Widget child;

  const _Front({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "NFT ROULET",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffff6c2c),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(80),
            child,
          ],
        ),
      ),
    );
  }
}

class _Back extends StatelessWidget {
  final Widget child;

  const _Back({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseCard(
      backgroundColor: Colors.white,
      borderColor: const Color(0xff18CBC7),
      child: Positioned(
        bottom: 98,
        left: 0,
        right: 0,
        child: child,
      ),
    );
  }
}

class _BaseCard extends StatelessWidget {
  final Color? backgroundColor, borderColor;
  final Widget child;

  const _BaseCard({
    Key? key,
    this.backgroundColor,
    this.borderColor,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311,
      height: 589,
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xff0D1E36),
        borderRadius: kBorderRadius20,
        boxShadow: const [
          BoxShadow(
            color: Color(0x4c000000),
            blurRadius: 24,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kBorderRadius16,
          border: Border.all(
            width: 3,
            color: borderColor ?? const Color(0xffFF6C2C),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 58,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                Svgs.logo,
                width: 191,
                fit: BoxFit.contain,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

/// ----
///

class _NoCards extends StatelessWidget {
  final VoidCallback? onTap;

  const _NoCards({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Align(
        alignment: const Alignment(0, -0.75),
        child: NotFoundFish(text:  "No cards available",),
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Container(
        //       width: 200,
        //       height: 200,
        //       // decoration: BoxDecoration(
        //       //   borderRadius: kBorderRadius20,
        //       //   gradient: const LinearGradient(
        //       //     colors: [
        //       //       Color(0xffA4F1EB),
        //       //       Color(0xff38819D),
        //       //     ],
        //       //     begin: Alignment.topLeft,
        //       //     end: Alignment.bottomLeft,
        //       //   ),
        //       // ),
        //       child: const RiveAnimation.asset(
        //         Rives.doryDemo,
        //         fit: BoxFit.contain,
        //       ),
        //     ),
        //     kGap16,
        //     const Text(
        //       "No cards available",
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         color: Color(0xff5e5873),
        //         fontSize: 20,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
