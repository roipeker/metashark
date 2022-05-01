import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:metashark/commons.dart';

part 'steaking_contract_state.dart';

part 'widgets.dart';

class SteakingContractPage extends StatefulWidget {
  static const url = "/steaking-contract";
  final String contractId;

  const SteakingContractPage({
    Key? key,
    required this.contractId,
  }) : super(key: key);

  @override
  createState() => _SteakingContractPage();
}

class _SteakingContractPage extends _SteakingContractState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: appbarTitle),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: SafeArea(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                clipBehavior: Clip.none,
                shrinkWrap: true,
                children: const [
                  _Header(),
                  kGap16,
                  Padding(
                    padding: kPad16,
                    child: _LogArea(),
                  ),
                  kGap16,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogArea extends StatelessWidget {
  const _LogArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_SteakingContractState>()!;
    final logs = state.logs;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 32,
          bottom: -500,
          // left: 16 + 4,
          left: 4,
          child: Container(
            width: 1,
            decoration: DottedDecoration(
              shape: Shape.line,
              linePosition: LinePosition.left,
              dash: const [2, 2],
              color: const Color(0xffB9B9C3),
              strokeWidth: 1,
            ),
          ),
        ),
        Column(
          children: [
            ...List.generate(
              logs.length,
              (index) {
                final vo = logs[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Dot(
                      size: 9,
                      color: Color(0xffB9B9C3),
                    ),
                    const Gap(17),
                    _ContractLogItem(
                      title: vo.title,
                      date: vo.date,
                      amount: vo.amount,
                      onTap: () {
                        state.onLogItemTap(vo);
                      },
                    ).exp(),
                  ],
                );
              },
            ).separator(kGap16),
          ],
        ),
      ],
    );
  }

}
