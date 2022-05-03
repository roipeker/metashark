import 'package:metashark/commons.dart';
part 'object_cinema_state.dart';

class ObjectCinemaPage extends StatefulWidget {
  
   static const url = "/object-cinema";
 
  const ObjectCinemaPage({Key? key}) : super(key: key);
  
  @override
  createState() => _ObjectCinemaPage();
}

class _ObjectCinemaPage extends _ObjectCinemaState {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Cinema activation ticket'),
      body: CommonScrollableBody(
        padding: kPad16,
        children: [
          VoucherCard.network(
            title: 'Cinema ticket',
            line1: 'Action: 3 months',
            line2: 'Activate until: 05/23/2022',
            imageUrl: MockupImages.mockCardCinemaTicket,
            radio: getRadio(activeItem1),
            onTap: activeItem1.toggle,
          ),
          kGap16,
        ],
      ),
    );
  }
}

