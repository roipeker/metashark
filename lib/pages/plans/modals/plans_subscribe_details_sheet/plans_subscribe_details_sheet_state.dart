part of 'plans_subscribe_details_sheet.dart';

abstract class _PlansSubscribeDetailsSheetState
    extends State<PlansSubscribeDetailsSheet> {
  void onCardTap() {
    context.navigator()?.pop();
  }

  void onActivateTap() {
    context.navigator()?.pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
