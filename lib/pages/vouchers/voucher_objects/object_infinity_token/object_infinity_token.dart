import 'package:metashark/commons.dart';

part 'object_infinity_token_state.dart';

class ObjectInfinityTokenPage extends StatefulWidget {
  static const url = "/object-infinity-token";

  const ObjectInfinityTokenPage({Key? key}) : super(key: key);

  @override
  createState() => _ObjectInfinityTokenPage();
}

class _ObjectInfinityTokenPage extends _ObjectInfinityTokenState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Infiniti Token'),
      body: CommonScrollableBody(
        padding: kPad16,
        children: [
          SizedBox(
            height: 72,
            child: VoucherObjectCashCard(
              extendImage: true,
              radio: getRadio(activeItem1),
              onTap: activeItem1.toggle,
              title: "100 MTS",
              imageUrl: MockupImages.mockCardInfinityToken,
              body: 'Infinity MetaShark Tokens',
            ),
          ),
          kGap16,
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 24),
              ),
              onPressed: onCreateTap,
              child: const Text('Create')),
        ],
      ),
    );
  }
}
