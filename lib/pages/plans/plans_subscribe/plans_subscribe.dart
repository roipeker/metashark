import 'package:metashark/commons.dart';

import '../modals/plans_subscribe_details_sheet/plans_subscribe_details_sheet.dart';

part 'plans_subscribe_state.dart';
part 'widgets.dart';

class PlansSubscribePage extends StatefulWidget {
  static const url = "/plans-subscribe";

  const PlansSubscribePage({Key? key}) : super(key: key);

  @override
  createState() => _PlansSubscribePage();
}

class _PlansSubscribePage extends _PlansSubscribeState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: RefreshIndicator(
        onRefresh: onRefreshPull,
        child: Scrollbar(
          controller: scrollController,
          child: SafeArea(
            child: ListView(
              padding: kPad16,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                VoucherCard.subscribe(
                  title: 'Subscription',
                  line1: 'Action: 3 months',
                  line2: '30 MTS',
                  tile: const VoucherIconTile(color: Color(0xff9E95F5)),
                  // tag: VoucherObjectCardTag.text(text: 'Activation'),
                  onTap: () => onSubscriptionTap(
                    tile: const VoucherIconTile(color: Color(0xff9E95F5)),
                  ),
                ),
                kGap16,
                VoucherCard.subscribe(
                  title: 'Subscription',
                  line1: 'Action: 3 months',
                  line2: '100 MTS',
                  tile: const VoucherIconTile(color: Color(0xff18CBC7)),
                  // tag: VoucherObjectCardTag.text(text: 'Activation'),
                  onTap: () => onSubscriptionTap(
                    tile: const VoucherIconTile(color: Color(0xff18CBC7)),
                  ),
                ),
                kGap16,
                VoucherCard.subscribe(
                  title: 'Subscription',
                  line1: 'Action: 3 months',
                  line2: '200 MTS',
                  tile: const VoucherIconTile(color: Color(0xffFF6C2C)),
                  // tag: VoucherObjectCardTag.text(text: 'Activation'),
                  onTap: () => onSubscriptionTap(
                    tile: const VoucherIconTile(color: Color(0xffFF6C2C)),
                  ),
                ),
                kGap16,
              ],
            ),
          ),
        ),
      ),
    );
  }

}
