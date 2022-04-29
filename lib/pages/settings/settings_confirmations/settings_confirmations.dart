import 'package:metashark/commons.dart';

part 'settings_confirmations_state.dart';

class SettingsConfirmationsPage extends StatefulWidget {
  static const url = "/settings-confirmations";

  const SettingsConfirmationsPage({Key? key}) : super(key: key);

  @override
  createState() => _SettingsConfirmationsPage();
}

class _SettingsConfirmationsPage extends _SettingsConfirmationsState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Confirmations'),
      body: ListView.separated(
        padding: kPad16.copyWith(top: 24),
        itemBuilder: (_, index) {
          return _ConfirmationCard(data: confirmationsData[index]);
        },
        separatorBuilder: (_, index) => kGap16,
        itemCount: confirmationsData.length,
      ),
    );
  }
}

class _ConfirmationCard extends StatelessWidget {
  final ConfirmationDataVo data;
  const _ConfirmationCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: getContent()),
          getSuffix(),
        ],
      ),
    );
  }

  Widget getContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#123",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
          ),
        ),
        kGap4,
        Text(
          "(11.04.2022 23:50:01)",
          style: TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 10,
          ),
        ),
        kGap4,
        Text(
          "Finance withdrawal confirmation form",
          style: TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget getSuffix() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          data.state,
          style: TextStyle(
            color: data.stateColor,
            fontSize: 14,
          ),
        ),
        kGap4,
        Text(
          data.stateCount,
          style: TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
