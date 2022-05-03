import 'package:metashark/commons.dart';
part 'object_network_state.dart';

class ObjectNetworkPage extends StatefulWidget {
  
   static const url = "/object-network";
 
  const ObjectNetworkPage({Key? key}) : super(key: key);
  
  @override
  createState() => _ObjectNetworkPage();
}

class _ObjectNetworkPage extends _ObjectNetworkState {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Ticket to activate Network'),
      body: CommonScrollableBody(
        padding: kPad16,
        children: [
          VoucherCard.network(
            title: 'Subscription',
            line1: 'Action: 6 months',
            line2: 'Activate until: 05/23/2022',
            imageUrl: MockupImages.mockCardNetwork,
            radio: getRadio(activeItem1),
            onTap: activeItem1.toggle,
          ),
          kGap16,
        ],
      ),
    );
  }
}

