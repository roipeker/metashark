part of 'steaking.dart';

class _AnimatedBall extends StatelessWidget {
  final String title, subtitle;

  const _AnimatedBall({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 334,
        height: 290,
        child: Container(
          width: 290,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color(0xff3551F0),
                  offset: Offset.zero,
                  blurRadius: 114),
            ],
            image: DecorationImage(
              scale: .7,
              fit: BoxFit.fitWidth,
              image: AssetImage(
                Anims.ezgifComGifMaker,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedBall2 extends StatelessWidget {
  final String title, subtitle;

  // const _AnimatedBall2({Key? key}) : super(key: key);
  const _AnimatedBall2({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 290,
        height: 290,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xff3551F0), offset: Offset.zero, blurRadius: 114),
          ],
        ),
        // clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: 290,
                height: 290,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                clipBehavior: Clip.antiAlias,
                child: Transform.scale(
                  scale: 1.1,
                  child: VPlayer(
                    url: Anims.videoTest2,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Center(
    //   child: SizedBox(
    //     width: 334,
    //     height: 290,
    //     child: Container(
    //       width: 290,
    //
    //   ),
    // );
  }
}

class _CircClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCenter(
        center: size.center(Offset.zero), width: 290, height: 290));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
