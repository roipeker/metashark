import 'package:flutter/widgets.dart';
import 'package:metashark/commons.dart';

part 'my_partners_state.dart';
part 'widgets.dart';

class MyPartnersPage extends StatefulWidget {
  static const url = "/my-partners";

  const MyPartnersPage({Key? key}) : super(key: key);

  @override
  createState() => _MyPartnersPage();
}

class _MyPartnersPage extends _MyPartnersState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'My partners',
        actions: [
          SearchButton(
            onTap: onSearchTap,
          )
        ],
      ),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: SafeArea(
              bottom: false,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                clipBehavior: Clip.none,
                shrinkWrap: true,
                children: [
                  kGap16,
                  _PartnerCard().paddingSymmetric(horizontal: 16),
                  kGap16,
                  _PartnerCard().paddingSymmetric(horizontal: 16),
                  kGap16,
                  _SmallPartnerCard().paddingSymmetric(horizontal: 16),
                  kGap16,
                  /// list here.
                  ...List.generate(5, (index) => _PartnerItemTile(onTap: (){
                    onPartnerItemTap();
                  },),).separator(kGap1),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

