import 'package:flutter/material.dart';
import 'package:metashark/commons.dart';

part 'wallet_details_modal_state.dart';

class WalletDetailsSheet extends StatefulWidget {
  static const url = "/wallet-details-modal";
  final String title;

  const WalletDetailsSheet({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  createState() => _WalletDetailsSheet();
}

class _WalletDetailsSheet extends _WalletDetailsSheetState {
  final bgColor = Colors.white;
  final headerColor = const Color(0xff5E5873);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
          controller: scrollController,
          child: SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 32),
              decoration: const BoxDecoration(
                color: AppColors.scaffold,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              padding: kPad16,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppCard(
                      padding: kPad16,
                      elevation: 0,
                      borderRadius: kBorderRadius8,
                      color: AppColors.darkGrey,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    kGap16,
                    ...List.generate(
                      4,
                          (index) => const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: _Item(),
                          ),
                    ).separator(kDivider1),
                  ],
                ),
              ),
            ),
          ),
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
      children: const [
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
