import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'voucher_details_sheet_state.dart';
part 'widget_my_voucher.dart';
part 'widget_person_voucher.dart';
part 'widgets.dart';

enum VoucherMode { pay, code }
enum VoucherType { me, other }

extension VoucherModeExt on VoucherMode {
  isPay() => this == VoucherMode.pay;

  isCode() => this == VoucherMode.code;
}

class VoucherDetailsSheet extends StatefulWidget {
  final String voucherId;
  final VoucherMode mode;
  final VoucherType type;

  const VoucherDetailsSheet({
    Key? key,
    required this.voucherId,
    this.type = VoucherType.other,
    this.mode = VoucherMode.pay,
  }) : super(key: key);

  @override
  createState() => _VoucherDetailsSheet();
}

class _VoucherDetailsSheet extends _VoucherDetailsSheetState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(parent: ClampingScrollPhysics()),
          controller: scrollController,
          child: SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 32),
              decoration: const BoxDecoration(
                color: AppColors.bottomSheet,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              // padding: kPad16,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kGap16,
                    AppCard(
                      padding: kPad16,
                      elevation: 0,
                      borderRadius: kBorderRadius8,
                      color: AppColors.darkGrey,
                      child: Text(
                        voucherTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ).paddingSymmetric(horizontal: 16),
                    kGap16,
                    if (type == VoucherType.other)
                      OtherVoucher(
                        onPayTap: onPayTap,
                        onUserCardTap: onUserCardTap,
                      ),

                    if (type == VoucherType.me)
                      MyVoucher(
                        onPayTap: onPayTap,
                        onUserCardTap: onUserCardTap,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
