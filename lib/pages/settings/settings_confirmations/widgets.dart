part of 'settings_confirmations.dart';


class _ConfirmationCard extends StatelessWidget {
  final ConfirmationDataVo data;
  final VoidCallback? onTap;

  const _ConfirmationCard({
    Key? key,
    this.onTap,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ConfirmationFormSheet
    return AppMaterialButton(
      elevation: 4,
      color: Colors.white,
      onTap: onTap,
      padding: kPad16,
      shape: kBorder8,
      // return AppCard(
      // elevation: 4,
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
        const Text(
          "#123",
          style: const TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
          ),
        ),
        kGap4,
        const Text(
          "(11.04.2022 23:50:01)",
          style: const TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 10,
          ),
        ),
        kGap4,
        const Text(
          "Finance withdrawal confirmation form",
          style: TextStyle(
            color: const Color(0xffb9b9c3),
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
          style: const TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
