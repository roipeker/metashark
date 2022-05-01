import 'package:metashark/commons.dart';

part 'settings_confirmations_state.dart';

part 'widgets.dart';

class SettingsConfirmationsPage extends StatefulWidget {
  static const url = "/settings-confirmations";

  const SettingsConfirmationsPage({Key? key}) : super(key: key);

  @override
  createState() => _SettingsConfirmationsPage();
}

class _SettingsConfirmationsPage extends _SettingsConfirmationsState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: const CommonAppBar(title: 'Confirmations'),
        body: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            child: ListView.separated(
              padding: kPad16,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final vo = confirmationsData[index];
                return _ConfirmationCard(
                  data: vo,
                  onTap: () => onCardTap(),
                );
              },
              separatorBuilder: (_, index) => kGap16,
              itemCount: confirmationsData.length,
            ),
          ),
        ),
      ),
    );
  }
}
