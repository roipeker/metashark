import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:metashark/commons.dart';

part 'vouchers_operating_state.dart';

part 'widgets.dart';

class VouchersOperatingPage extends StatefulWidget {
  static const url = "/vouchers-operating";

  const VouchersOperatingPage({Key? key}) : super(key: key);

  @override
  createState() => _VouchersOperatingPage();
}

class _VouchersOperatingPage extends _VouchersOperatingState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefreshPull,
        child: Scrollbar(
          controller: scrollController,
          child: ListView(
            padding: kPad16,
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            clipBehavior: Clip.none,
            shrinkWrap: true,
            children: [
              AppElevatedButton.primary(
                child: const Text('Create voucher'),
                onTap: onCreateVoucherTap,
              ),
              kGap16,
              _VoucherCardItem(
                title: 'Voucher name',
                subtitle: '#6787099',
                imageUrl: MockupImages.mockVoucherCard1,
                onTap: () {
                  context.toastNotImplemented();
                },
              ),
              kGap16,
              _VoucherCardItem(
                title: 'Voucher name',
                subtitle: '#6787099',
                imageUrl: MockupImages.mockVoucherCard2,
                onTap: () {
                  context.toastNotImplemented();
                },
              ),
              // BinaryTreeDemoWidget(),
            ],
          ),
        ),
      ),
    );
  }

}
