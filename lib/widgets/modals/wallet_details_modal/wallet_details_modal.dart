import 'package:flutter/material.dart';
import 'package:metashark/commons.dart';

part 'wallet_details_modal_state.dart';

class WalletDetailsSheet extends StatefulWidget {
  static const url = "/wallet-details-modal";
  final String title;
  final String iconId;

  const WalletDetailsSheet({
    Key? key,
    required this.title,
    required this.iconId,
  }) : super(key: key);

  @override
  createState() => _WalletDetailsSheet();
}

class _WalletDetailsSheet extends _WalletDetailsSheetState {
  final bgColor = Colors.white;
  final headerColor = Color(0xff5E5873);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: kRadius20),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 97,
                  color: headerColor,
                  padding: EdgeInsets.only(top: 28),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: kPad16,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      kGap16,
                      const Text(
                        "Details",
                        style: TextStyle(
                          color: Color(0xff5e5873),
                          fontSize: 16,
                          fontFamily: "Open Sans",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      kGap16,
                      ...List.generate(
                        4,
                        (index) => _Item(),
                      ).separator(kGap16),
                      kGap32,
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 64,
              child: getLogo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getLogo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 60,
        height: 60,
        padding: EdgeInsets.all(4),
        child: SvgAvatarIcon(
          iconId: widget.iconId,
          iconSize: 26,
          backgroundColor: Color(0xff9E95F5),
        ),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Some kind of inscription",
          style: TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 12,
          ),
        ),
        Text(
          "Translation",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
            fontFamily: "Open Sans",
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
