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
            imageUrl: MockDataFactory.getRandomImage(
              w: 800,
              webp: true,
              seed: 'iphone11',
            ),
            title: 'iPhone 11',
            body: MockDataFactory.loremWords(30),
            radio: getRadio(activeItem1),
            onTap: activeItem1.toggle,
          ),
          kGap16,
          VoucherCard.present(
            // imageUrl: MockupImages.mockCardIphone,
            imageUrl: MockDataFactory.getRandomImage(
                w: 800, webp: true, seed: 'iphone11'),
            title: 'iPhone 11',
            type: ObjectPresentCard.small,
            body: MockDataFactory.loremWords(30),
            radio: getRadio(activeItem2),
            onTap: activeItem2.toggle,
          ),
          kGap16,
          VoucherCard.collection(
            imageUrl: MockupImages.mockCardNft,
            collection: 'Collection: Name',
            id: '# 784344',
            status: 'Status: VIP',
            strength: 'Strength: 156',
            tag: VoucherObjectCardTag.text(text: 'NFT'),
            radio: getRadio(activeItem3),
            onTap: activeItem3.toggle,
          ),
          kGap16,
          VoucherCard.network(
            title: 'Subscription',
            line1: 'Action: 3 months',
            line2: 'Activate until: 05/23/2022',
            imageUrl: MockupImages.mockCardNetwork,
            tag: VoucherObjectCardTag.text(text: 'Activation'),
            radio: getRadio(activeItem4),
            onTap: activeItem4.toggle,
          ),
          kGap16,
          VoucherCard.network(
            title: 'Subscription',
            line1: 'Action: 3 months',
            line2: 'Activate until: 05/23/2022',
            imageUrl: MockupImages.mockCardCinemaTicket,
            tag: VoucherObjectCardTag.text(text: 'Cinema'),
            radio: getRadio(activeItem5),
            onTap: activeItem5.toggle,
          ),
          kGap16,
          VoucherCard.cash(
            title: "100 MTS (infinity)",
            imageUrl: MockupImages.mockCardInfinityToken,
            body: 'Infinity MetaShark Tokens',
            radio: getRadio(activeItem6),
            onTap: activeItem6.toggle,
          ),
          kGap16,
          SizedBox(
            height: 64,
            child: VoucherObjectCashCard(
              radio: getRadio(activeItem7),
              onTap: activeItem7.toggle,
              title: "100 MTS",
              imageUrl: MockupImages.mockCardInfinityToken,
              body: 'Infinity MetaShark Tokens',
            ),
          ),
        ],
      ),
    );
  }
}
