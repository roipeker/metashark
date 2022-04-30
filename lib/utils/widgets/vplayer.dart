import 'package:metashark/commons.dart';
import 'package:video_player/video_player.dart';

class VPlayer extends StatefulWidget {
  final String url;

  const VPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<VPlayer> createState() => _VPlayerState();
}

class _VPlayerState extends State<VPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset(
      widget.url,
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: false,
        mixWithOthers: false,
      ),
    );
    controller.initialize().then((value) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        startPlayer();
      });
    });
    super.initState();
  }

  void startPlayer() {
    // controller.value.isPlaying
    controller.play();
    controller.setLooping(true);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      update();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container(
        width: 32,
        height: 32,
        color: Colors.white,
      );
    }
    return VideoPlayer(
      controller,
    );
  }
}
