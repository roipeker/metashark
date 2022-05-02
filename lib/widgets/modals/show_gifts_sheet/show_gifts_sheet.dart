import 'package:flutter/scheduler.dart';
import 'package:metashark/commons.dart';

part 'show_gifts_sheet_state.dart';

part 'widgets.dart';

class ShowGiftsSheet extends StatefulWidget {
  const ShowGiftsSheet({Key? key}) : super(key: key);

  @override
  createState() => _ShowGiftsSheet();
}

class _ShowGiftsSheet extends _ShowGiftsSheetState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
          // physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          controller: scrollController,
          child: SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 32),
              decoration: const BoxDecoration(
                color: AppColors.bottomSheet,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              padding: kPad16,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Gifts",
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    kGap16,
                    VoucherCard.collection(
                      imageUrl: MockupImages.mockCardNft,
                      collection: 'Collection: Name',
                      id: '# 784344',
                      status: 'Status: VIP',
                      strength: 'Strength: 156',
                      onTap: () {},
                      tag: VoucherObjectCardTag.text(text: 'NFT'),
                    ),
                    kGap16,
                    VoucherCard.network(
                      title: 'Subscription',
                      line1: 'Action: 3 months',
                      line2: 'Activate until: 05/23/2022',
                      imageUrl: MockupImages.mockCardNetwork,
                      tag: VoucherObjectCardTag.text(text: 'Activation'),
                      onTap: () {},
                    ),
                    kGap16,
                    VoucherCard.network(
                      title: 'Subscription',
                      line1: 'Action: 3 months',
                      line2: 'Activate until: 05/23/2022',
                      imageUrl: MockupImages.mockCardCinemaTicket,
                      tag: VoucherObjectCardTag.text(text: 'Cinema'),
                      onTap: () {},
                    ),
                    kGap16,
                    VoucherCard.cash(
                      title: "100 MTS (infinity)",
                      onTap: () {},
                      imageUrl: MockupImages.mockCardInfinityToken,
                      body: 'Infinity MetaShark Tokens',
                    ),
                    kGap16,
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
