import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:metashark/commons.dart';

part 'voucher_details_sheet_state.dart';
part 'widgets.dart';

class VoucherDetailsSheet extends StatefulWidget {
  final String voucherId;

  const VoucherDetailsSheet({Key? key, required this.voucherId})
      : super(key: key);

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
                color: AppColors.scaffold,
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

                    // owner data.
                    _Pane(
                      title: 'Owner',
                      child: Column(
                        children: [
                          _UserCard(
                            onTap: onUserCardTap,
                            title: 'Last name First name',
                            subtitle: 'Login',
                          ),
                          kGap16,
                          const _LabelValueRow(
                            label: 'Date of creation:',
                            value: '11.04.2022 23:50',
                          ),
                          kGap8,
                          const _LabelValueRow(
                            label: 'Cancellation date:',
                            value: '11.04.2022 23:55',
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 16),

                    kGap16,
                    _Pane(
                      title: 'Recipients',
                      titlePadding: kPadH16,
                      child: PageViewWithIndicator(
                        itemBuilder: (ctx, idx) {
                          return Padding(
                            padding: kPadH16,
                            child: _UserCard(
                              onTap: onUserCardTap,
                              title: 'Last name First name',
                              subtitle: 'Login',
                              subtitleIconData: AppIcons.person,
                            ),
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                    kGap16,
                    _Pane(
                      title: 'Objects',
                      titlePadding: kPadH16,
                      child: PageViewWithIndicator(
                        itemBuilder: (ctx, idx) {
                          return Padding(
                            padding: kPadH16,
                            child: NotificationCircleBadge(
                              value: 2,
                              backgroundColor: AppColors.primaryPurple,
                              child: VoucherCard.network(
                                title: 'Подписка',
                                line1: 'Действие:  3 месяца',
                                line2: 'Активировать до: 23.05.2022',
                                tile: const VoucherIconTile(
                                  color: Color(0xff18CBC7),
                                  iconData: AppIcons.park_tickets_couple,
                                ),
                                tag: VoucherObjectCardTag.text(text: 'Кинотеатр'),
                                onTap: () {},
                              ),
                            ),
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                    kGap16,
                    _Pane(
                      title: 'Activation',
                      child: Column(
                        children: [
                          const _LabelValueRow(
                            label: 'Available:',
                            value: '200 MTS',
                          ),
                          kGap4,
                          SafeArea(
                            child: SizedBox(
                              height: 47,
                              child: AppElevatedButton.primary(
                                child: Text('Pay: 100 MTS'),
                                onTap: onPayTap,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 16),

                    kGap16,
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
