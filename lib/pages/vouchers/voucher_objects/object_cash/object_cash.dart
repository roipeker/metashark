import 'package:metashark/commons.dart';

part 'object_cash_state.dart';

class ObjectCashPage extends StatefulWidget {
  static const url = "/object-cash";

  const ObjectCashPage({Key? key}) : super(key: key);

  @override
  createState() => _ObjectCashPage();
}

class _ObjectCashPage extends _ObjectCashState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Cash'),
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
