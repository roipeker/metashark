part of 'settings_confirmations.dart';

abstract class _SettingsConfirmationsState
    extends State<SettingsConfirmationsPage> {
  List<ConfirmationDataVo> get confirmationsData => const [
        ConfirmationDataVo('Active', '1/5', AppColors.green),
        ConfirmationDataVo('Overdue', '4/5', AppColors.red),
      ];

  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onCardTap() {
    context.openModalSheet(const ConfirmationFormSheet());
  }

  @override
  void initState() {
    super.initState();
  }
}

class ConfirmationDataVo {
  final String state;
  final String stateCount;
  final Color stateColor;

  const ConfirmationDataVo(this.state, this.stateCount, this.stateColor);
}
