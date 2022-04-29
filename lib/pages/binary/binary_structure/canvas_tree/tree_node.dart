import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

const kLevel1 = BinaryNodeLevelConfig(
  avatarBorder: 6,
  avatarSize: 140,
  activitySize: 30,
  activityRight: 8,
  countLeft: 11,
  countSize: 33,
  countFontSize: 20,
  loginFontSize: 16,
);
const kLevel2 = BinaryNodeLevelConfig(
  avatarBorder: 6,
  avatarSize: 140,
  activityRight: 8,
  activitySize: 24,
  countLeft: 11,
  countSize: 33,
  countFontSize: 20,
  loginFontSize: 16,
);
const kLevel3 = BinaryNodeLevelConfig(
  avatarBorder: 6,
  avatarSize: 110,
  activityRight: 8,
  activitySize: 20,
  countLeft: 8,
  countSize: 26.4,
  countFontSize: 16,
  loginFontSize: 14,
);
const kLevel4 = BinaryNodeLevelConfig(
  avatarBorder: 5,
  avatarSize: 80,
  activityRight: 6,
  activitySize: 16,
  countLeft: 6,
  countSize: 19.2,
  countFontSize: 14,
  loginFontSize: 12,
);
const kLevel5 = BinaryNodeLevelConfig(
  avatarBorder: 4,
  avatarSize: 60,
  activityRight: 2,
  activitySize: 16,
  countLeft: 2,
  countSize: 18,
  countFontSize: 14.4,
  loginFontSize: 10,
);

class BinaryNodeLevelConfig {
  final double avatarSize;
  final double avatarBorder;
  final double countSize;
  final double countLeft;
  final double activityRight;
  final double countFontSize;
  final double activitySize;
  final double loginFontSize;

  const BinaryNodeLevelConfig({
    required this.avatarSize,
    required this.avatarBorder,
    this.countLeft = 11,
    this.activityRight = 8,
    required this.countSize,
    required this.countFontSize,
    required this.activitySize,
    required this.loginFontSize,
  });
}

const kConfigByLevel = <int, BinaryNodeLevelConfig>{
  0: kLevel1,
  1: kLevel2,
  2: kLevel3,
  3: kLevel4,
  4: kLevel5,
};

class BinaryNode extends StatelessWidget {
  final int count;
  final String name;
  final bool purchased;

  /// 80, 60, 46
  // final double size;
  final BinaryNodeLevelConfig levelConfig;
  final String? imageUrl;
  final VoidCallback? onTap;
  final int positionID;
  final bool isEmpty;

  const BinaryNode({
    Key? key,
    required this.levelConfig,
    this.isEmpty = false,
    this.imageUrl,
    this.onTap,
    this.positionID = 0,
    this.count = 0,
    required this.name,
    this.purchased = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = isEmpty
        // ? Color.lerp(const Color(0xffC4C4C4), Colors.white, .05)
        ? const Color(0xffC4C4C4)
        : Colors.white;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    /// round item
                    SizedBox(
                      width: levelConfig.avatarSize,
                      height: levelConfig.avatarSize,
                      child: Material(
                        elevation: 10,
                        color: borderColor,
                        type: MaterialType.circle,
                        shadowColor: const Color(0xffCFCFCF),
                        child: Padding(
                          padding: EdgeInsets.all(levelConfig.avatarBorder),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffC4C4C4),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: !isEmpty
                                ? Stack(
                                    children: [
                                      AppFadeImage(
                                        url: imageUrl ?? '-',
                                        fit: BoxFit.cover,
                                      ),
                                      if (positionID > 0)
                                        Center(
                                          child: Container(
                                            child: Text(
                                              '$positionID',
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            padding: kPadH16V4,
                                            decoration: BoxDecoration(
                                              color: Colors.black45,
                                              borderRadius: kBorderRadius8,
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ),

                    if (!isEmpty && count > 0)
                      Positioned(
                        left: levelConfig.countLeft,
                        top: 0,
                        child: Circle(
                          size: levelConfig.countSize,
                          color: Colors.white,
                          child: Text(
                            "$count",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xffffbb32),
                              fontSize: levelConfig.countFontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                    if (!isEmpty)
                      Positioned(
                        bottom: 0,
                        right: levelConfig.activityRight,
                        child: Circle(
                          size: levelConfig.activitySize,
                          color: purchased
                              ? AppColors.green
                              : AppColors.binaryTreeNoPurchase,
                        ),
                      ),
                  ],
                ),
                if (!isEmpty) kGap8,
                if (!isEmpty)
                  _BinaryItemName(
                    fontSize: levelConfig.loginFontSize,
                    text: name,
                  ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              borderRadius: kBorderRadius8,
              borderOnForeground: true,
              elevation: 0,
              child: InkWell(
                onTap: onTap,
                splashColor: AppColors.primaryPurple.withOpacity(.2),
                hoverColor: AppColors.primaryPurple.withOpacity(.1),
                focusColor: AppColors.green.withOpacity(.31),
                highlightColor: AppColors.duskyBlue.withOpacity(.1),
                // overlayColor: AppColors.duskyBlue.withOpacity(.1),
                borderRadius: kBorderRadius12,
              ),
              // child: InkResponse(
              //   hoverColor: Colors.blue,
              //   onTap: onTap,
              //   splashFactory: InkRipple.splashFactory,
              //   containedInkWell: true,
              //   mouseCursor: SystemMouseCursors.click,
              //   enableFeedback: true,
              //   borderRadius: kBorderRadius8,
              //   radius: levelConfig.avatarSize/2,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BinaryItemName extends StatelessWidget {
  final String text;
  final double fontSize;

  const _BinaryItemName({
    Key? key,
    this.fontSize = 14,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadiusPill,
        color: Colors.white,
      ),
      padding: kPadH16V4,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
