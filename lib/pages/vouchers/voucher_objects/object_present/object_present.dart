import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

part 'object_present_state.dart';

class ObjectPresentPage extends StatefulWidget {
  static const url = "/object-present";

  const ObjectPresentPage({Key? key}) : super(key: key);

  @override
  createState() => _ObjectPresentPage();
}

class _ObjectPresentPage extends _ObjectPresentState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Present'),
      body: CommonScrollableBody(
        padding: kPad16,
        children: [
          VoucherCard.present(
            // imageUrl: MockupImages.mockCardIphone,
            imageUrl: MockDataFactory.getRandomImage(w: 800, webp: true, seed: 'iphone11'),
            title: 'iPhone 11',
            body: MockDataFactory.loremWords(30),
            onTap: () {},
          ),
          kGap16,
          VoucherCard.present(
            // imageUrl: MockupImages.mockCardIphone,
            imageUrl: MockDataFactory.getRandomImage(w: 800, webp: true, seed: 'iphone11'),
            title: 'iPhone 11',
            type: ObjectPresentCard.small,
            body: MockDataFactory.loremWords(30),
            onTap: () {},
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
          SizedBox(
            height: 64,
            child: VoucherObjectCashCard(
              title: "100 MTS",
              onTap: () {},
              imageUrl: MockupImages.mockCardInfinityToken,
              body: 'Infinity MetaShark Tokens',
            ),
          ),
        ],
      ),
    );
  }
}
