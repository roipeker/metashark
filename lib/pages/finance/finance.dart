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
      child: FigmaLink(
        node: '124%3A2902',
        child: Scaffold(
          appBar: CommonAppBar(title: 'Finance'),
          body: Column(
            children: [
              const Padding(
                padding: kPad16,
                child: FinanceTopCard(),
              ),
              Expanded(
                // child: _MyAssetsPanel(assets: myAssets, onSelected: onAssetTap,),
                child: BottomSheetCard(
                  title: "My assets",
                  child: RefreshIndicator(
                    onRefresh: onRefreshPull,
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        final vo = myAssets[index];
                        return FinanceAssetItem(
                          iconId: vo.iconId,
                          onTap: () => onAssetTap(index),
                          title: vo.title,
                          subtitle: vo.subtitle,
                          titleValue: vo.value,
                          subtitleValue: vo.valueUsdt,
                        );
                      },
                      itemCount: myAssets.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
