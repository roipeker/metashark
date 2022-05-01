import 'package:metashark/commons.dart';

part 'plans_subscribe_details_sheet_state.dart';

class PlansSubscribeDetailsSheet extends StatefulWidget {
  final Widget tile;

  const PlansSubscribeDetailsSheet({
    Key? key,
    required this.tile,
  }) : super(key: key);

  @override
  createState() => _PlansSubscribeDetailsSheet();
}

class _PlansSubscribeDetailsSheet extends _PlansSubscribeDetailsSheetState {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: true,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 32),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        padding: kPad16,
        child: SafeArea(
          minimum: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Subscription",
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              kGap16,
              VoucherCard.network(
                title: 'Subscription',
                line1: 'Action: 3 months',
                line2: 'Activate until: 05/23/2022',
                // tile: const PlansSubscriptionTile(color: Color(0xffFF6C2C)),
                tile: widget.tile,
                tag: VoucherObjectCardTag.text(text: 'Activation'),
                onTap: onCardTap,
              ),
              kGap16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Will be activated until:",
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "05/23/2022",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              kGap16,
              AppElevatedButton.primary(
                child: const Text('Activate'),
                onTap: onActivateTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
