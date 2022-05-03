import 'package:metashark/commons.dart';

part 'object_nft_state.dart';

class ObjectNftPage extends StatefulWidget {
  static const url = "/object-nft";

  const ObjectNftPage({Key? key}) : super(key: key);

  @override
  createState() => _ObjectNftPage();
}

class _ObjectNftPage extends _ObjectNftState {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'NFT'),
      body: CommonScrollableBody(
        padding: kPad16,
        children: [
          const Center(
            child: Text(
              "Collection",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          kGap16,
          VoucherCard.collection(
            imageUrl: MockupImages.mockCardNft,
            collection: 'Collection: Name',
            id: '# 784344',
            status: 'Status: VIP',
            strength: 'Strength: 156',
            tag: VoucherObjectCardTag.text(text: 'NFT'),
            radio: getRadio(activeItem1),
            onTap: activeItem1.toggle,
          ),
          kGap16,
        ],
      ),
    );
  }
}
