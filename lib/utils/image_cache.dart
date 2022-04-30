import 'package:metashark/commons.dart';

class AppImageCache {

  static FutureOr preloadSvg(BuildContext context) async {
    final list = [
      Svgs.cat,
      Svgs.logo,
      Svgs.walletBubbleChart,
      SvgIcons.diamondBlue,
      SvgIcons.supportAgent,
      SvgIcons.googleAuthIconBig,
      SvgIcons.googleAuthIcon,
    ];

    /// ExactAssetPicture((SvgPicture.svgStringDecoder),
    trace('start svg cache');
    for (var assetName in list) {
      final ref = SvgPicture.asset(assetName).pictureProvider;
      await precachePicture(ref, context);
    }
    trace('end svg cache');
  }

  static FutureOr preloadImages(BuildContext context) async {
    final list = [
      Images.briefcase,
      Images.sampleCardBack1,
      Images.sampleCardFront1,
      Anims.ezgifComGifMaker,
      MockupImages.mockTreeAvatarOrange,
      MockupImages.mockTreeAvatarBlue,
      MockupImages.mockTreeAvatarPurple,
      MockupImages.mockupIphone,
    ];
    /// ExactAssetPicture((SvgPicture.svgStringDecoder),
    trace('start image cache');
    for (var assetName in list) {
      final ref = AssetImage(assetName);
      await precacheImage(ref, context);
    }
    trace('end image cache');
  }
}
