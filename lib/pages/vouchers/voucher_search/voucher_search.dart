import 'package:metashark/commons.dart';

part 'voucher_search_state.dart';
part 'widgets.dart';

class VoucherSearchModal extends StatefulWidget {
  const VoucherSearchModal({Key? key}) : super(key: key);

  @override
  createState() => _VoucherSearchModal();
}

class _VoucherSearchModal extends _VoucherSearchState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Center(
        child: Text('OK!'),
      ),
    );
  }
}
