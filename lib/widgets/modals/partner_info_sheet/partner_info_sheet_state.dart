part of 'partner_info_sheet.dart';

enum PartnerResult { command, binary }

abstract class _PartnerInfoSheetState extends State<PartnerInfoSheetView> {
  void onGoBinaryTap() {
    context.navigator()?.pop(PartnerResult.binary);
  }

  void onShowCommandTap() {
    context.navigator()?.pop(PartnerResult.command);
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
