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

class _Pill extends StatelessWidget {
  const _Pill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
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
                title: '#4123452',
                recipients: [
                  VoucherChip.optional(icon: AppIcons.person, label: '5'),
                  VoucherChip.optional(icon: AppIcons.people, label: '5'),
                ],
                objects: '5',
                createdAt: '10.05.2022',
                imageUrl: MockupImages.mockVoucherCard1,
                onTap: () {
                  onVoucherTap(id: '#4123452');
                },
              ),
              kGap16,
              _VoucherCardItem(
                title: '#6787099',
                recipients: [
                  VoucherChip.optional(icon: AppIcons.person, label: '1'),
                ],
                objects: '2',
                createdAt: '5.05.2023',
                imageUrl: MockupImages.mockVoucherCard2,
                onTap: () {
                  onVoucherTap(id: '#6787099');
                },
              ),
              kGap16,
              _VoucherCardItem(
                title: '#1345123',
                recipients: [
                  VoucherChip.optional(icon: AppIcons.person, label: '3'),
                ],
                objects: '3',
                createdAt: '2.05.2022',
                imageUrl: MockupImages.mockVoucherCard1,
                onTap: () {
                  onVoucherTap(id: '#1345123');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
