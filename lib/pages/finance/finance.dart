import 'package:metashark/commons.dart';

part 'finance_state.dart';

part 'widgets.dart';

class FinancePage extends StatefulWidget {
  static const url = "finance";

  const FinancePage({Key? key}) : super(key: key);

  @override
  createState() => _FinancePage();
}

class _FinancePage extends _FinanceState {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: const CommonAppBar(title: 'Finance'),
        body: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            child: ListView(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              addRepaintBoundaries: true,
              children: [
                const Padding(
                  padding: kPad16,
                  child: SafeArea(child: FinanceTopCard()),
                ),
                SafeArea(
                  bottom: false,
                  maintainBottomViewPadding: true,
                  child: BottomSheetCard(
                    title: "My assets",
                    child: Column(
                      children: [
                        ...myAssets.map2((e) {
                          final vo = e;
                          return FinanceAssetItem(
                            iconId: vo.iconId,
                            onTap: () => onAssetTap(vo),
                            title: vo.title,
                            subtitle: vo.subtitle,
                            titleValue: vo.value,
                            subtitleValue: vo.valueUsdt,
                          );
                        }),
                        kGap32,
                      ],
                    ),
                    // child: RefreshIndicator(
                    //   onRefresh: onRefreshPull,
                    //   child: ListView.builder(
                    //     itemBuilder: (_, index) {
                    //       final vo = myAssets[index];
                    //       return FinanceAssetItem(
                    //         iconId: vo.iconId,
                    //         onTap: () => onAssetTap(index),
                    //         title: vo.title,
                    //         subtitle: vo.subtitle,
                    //         titleValue: vo.value,
                    //         subtitleValue: vo.valueUsdt,
                    //       );
                    //     },
                    //     itemCount: myAssets.length,
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
