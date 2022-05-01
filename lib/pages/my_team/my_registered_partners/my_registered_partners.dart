import 'package:metashark/commons.dart';

part 'my_registered_partners_state.dart';

part 'widgets.dart';

class MyRegisteredPartnersPage extends StatefulWidget {
  static const url = "/my-registered-partners";

  const MyRegisteredPartnersPage({Key? key}) : super(key: key);

  @override
  createState() => _MyRegisteredPartnersPage();
}

class _MyRegisteredPartnersPage extends _MyRegisteredPartnersState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'My Registered Partners',
      ),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                kGap16,
                SafeArea(
                  child: AppTextField(
                    label: 'Enter login',
                    hint: 'Enter login',
                    accessory: AppTextButton.accessory(
                      label: 'Add',
                      onTap: onAddLoginTap,
                    ),
                  ).paddingSymmetric(horizontal: 16),
                ),
                kGap16,
                _ItemGroup(
                  title: 'Not activated',
                  children: List.generate(
                    3,
                    (index) => _LoginItem(
                      activated: null,
                      onTap: () => onLoginItemTap(),
                    ),
                  ).separator(kGap1),
                ),
                kGap16,
                _ItemGroup(
                  title: 'Activated',
                  children: List.generate(
                    2,
                    (index) => _LoginItem(
                      activated: '26.04.2022',
                      onTap: () => onLoginItemTap(),
                    ),
                  ).separator(kGap1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
