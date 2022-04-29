import 'package:metashark/commons.dart';

part 'voucher_objects_state.dart';

class VoucherObjectsPage extends StatefulWidget {
  static const url = "/voucher-objects";

  const VoucherObjectsPage({Key? key}) : super(key: key);

  @override
  createState() => _VoucherObjectsPage();
}

class _VoucherObjectsPage extends _VoucherObjectsState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Objects'),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: Scrollbar(
          controller: scrollController,
          child: RefreshIndicator(
            onRefresh: onRefreshPull,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              padding: kPad16,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                VoucherListItemButton(
                  title: 'Present',
                  icon: AppIcons.card_giftcard,
                  onTap: () {
                    context.pushNamed(ObjectPresentPage.url);
                  },
                ),
                VoucherListItemButton(
                  title: 'NFT',
                  icon: AppIcons.image,
                  onTap: () {
                    context.pushNamed(ObjectNftPage.url);
                  },
                ),
                VoucherListItemButton(
                  title: 'Ticket to activate Network',
                  icon: AppIcons.coupon_2,
                  onTap: () {
                    context.pushNamed(ObjectNetworkPage.url);
                  },
                ),
                VoucherListItemButton(
                  title: 'Cinema activation ticket',
                  icon: AppIcons.coupon_2,
                  onTap: () {
                    context.pushNamed(ObjectCinemaPage.url);
                  },
                ),
                VoucherListItemButton(
                  title: 'Cash',
                  icon: AppIcons.payments,
                  onTap: () {
                    context.pushNamed(ObjectCashPage.url);
                  },
                ),
                VoucherListItemButton(
                  title: 'Infinity Token',
                  icon: AppIcons.attach_money,
                  onTap: () {
                    context.pushNamed(ObjectInfinityTokenPage.url);
                  },
                ),
              ].separator(kGap8),
            ),
          ),
        ),
      ),
    );
  }
}
