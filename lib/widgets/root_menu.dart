import 'package:metashark/commons.dart';

final kRootMenuKey = GlobalKey<ScaffoldState>();

/// todo: clean the code.
late List<String> rootMenuUrls = kRootMenuList.map2((e) {
  if (e.url.isNotEmpty) {
    var url = router.namedLocation(e.url);
    return url;
  }
  return '';
});

class RootMenu extends StatefulWidget {
  final Widget child;

  const RootMenu({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<RootMenu> createState() => RootMenuState();

  static RootMenuState? of(BuildContext context) {
    return context.findAncestorStateOfType<RootMenuState>();
  }
}

class RootMenuState extends State<RootMenu> {
  bool hasDrawerEnabled = false;

  @override
  void initState() {
    checkNavKey();
    super.initState();
  }

  void checkNavKey() {
    final navKey = widget.child.key;
    if (navKey is GlobalKey<NavigatorState>) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        var enabled = !(navKey.currentState?.canPop() ?? false);
        if (enabled != hasDrawerEnabled) {
          hasDrawerEnabled = enabled;
          update();
        }
      });
    }
  }

  @override
  void didUpdateWidget(covariant RootMenu oldWidget) {
    checkNavKey();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: kRootMenuKey,
      drawerEnableOpenDragGesture: hasDrawerEnabled,
      drawer: const RootMenuDrawer(),
      body: widget.child,
    );
  }

  void openDrawer() {
    final _state = kRootMenuKey.currentState;
    if (_state != null) {
      if (!_state.isDrawerOpen) {
        _state.openDrawer();
      }
    }
  }
}

class RootMenuDrawer extends StatelessWidget {
  const RootMenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: AppColors.charcoalGrey,
      child: Drawer(
        // backgroundColor: AppColors.charcoalGrey,
        elevation: 24,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Builder(builder: (myContext) {
            return Column(
              children: [
                SvgPicture.asset(
                  Svgs.logo,
                  width: 179,
                  height: 52,
                  clipBehavior: Clip.none,
                  placeholderBuilder: (_) {
                    return Container(
                      color: Colors.grey.shade100.withOpacity(.5),
                    );
                  },
                ),
                const Gap(23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      AppIcons.trending_up,
                      size: 24,
                      color: AppColors.appbarIconGrey,
                    ),
                    kGap8,
                    const Text(
                      'MTS = 0,25865\$',
                      style: TextStyle(
                        color: Color(0xff5e5873),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SafeArea(
                    child: Scrollbar(
                      child: ListView(
                        padding: kPad16,
                        shrinkWrap: true,
                        children: [
                          ...kRootMenuList.map2(
                            (e) => _MenuItem(
                              // svgId: e.svgId,
                              iconData: e.iconData,
                              label: e.label,
                              onTap: () async {
                                var url = e.url;
                                var current = routerLastState!.subloc;

                                /// only push if its NOT the same and is NOT empty
                                if (url.isNotEmpty) {
                                  var path = router.namedLocation(url);
                                  if (path != current) {
                                    context.goNamed(e.url);
                                    await 0.25.delay();

                                    /// HACK: ONLY WAY TO CLOSE DRAWER.
                                    if (kRootMenuKey.currentState?.isDrawerOpen ==
                                        true) {
                                      kRootMenuKey.currentState?.openEndDrawer();
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: kPadH16,
                  child: SafeArea(
                    child: _MenuItem(
                      // svgId: SvgIcons.exitToApp,
                      iconData: AppIcons.exit_to_app,
                      label: 'Log Out',
                      onTap: () {
                        appData.logout();
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;

  // final String svgId;
  final IconData iconData;

  const _MenuItem({
    Key? key,
    required this.label,
    // required this.svgId,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 44,
      onPressed: onTap,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 24,
            color: AppColors.appbarIconGrey,
          ),
          kGap16,
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

final kRootMenuList = [
  const _ItemVo(
    label: 'Dashboard',
    svgId: SvgIcons.dashboard,
    url: HomePage.url,
    iconData: AppIcons.dashboard,
  ),
  const _ItemVo(
    label: 'Finance',
    svgId: SvgIcons.finance,
    url: FinancePage.url,
    iconData: AppIcons.wallet,
  ),
  const _ItemVo(
    label: 'My team',
    svgId: SvgIcons.people,
    url: MyTeamPage.url,
    iconData: AppIcons.people,
  ),
  const _ItemVo(
    label: 'Steaking',
    svgId: SvgIcons.people,
    url: SteakingPage.url,
    iconData: AppIcons.layer_group,
  ),
  // const _ItemVo(
  //   label: 'Store',
  //   svgId: SvgIcons.store,
  //   url: StorePage.url,
  //   iconData: AppIcons.store,
  // ),
  const _ItemVo(
    label: 'Quest',
    svgId: SvgIcons.quest,
    url: QuestPage.url,
    iconData: AppIcons.trophy,
  ),
  const _ItemVo(
    label: 'Roulette',
    svgId: SvgIcons.cardGiftcard,
    url: RoulettePage.url,
    iconData: AppIcons.card_giftcard,
  ),
  const _ItemVo(
    label: 'Plans',
    svgId: SvgIcons.shoppingBag,
    url: PlansPage.url,
    iconData: AppIcons.shopping_bag,
  ),
  const _ItemVo(
    label: 'Portfolio',
    svgId: SvgIcons.inventory,
    url: PortfolioPage.url,
    iconData: AppIcons.inventory,
  ),
  const _ItemVo(
    label: 'Vouchers',
    svgId: SvgIcons.vouchers,
    url: VouchersPage.url,
    iconData: AppIcons.coupon_2,
  ),
  const _ItemVo(
    label: 'Binary',
    svgId: SvgIcons.binary,
    url: BinaryPage.url,
    iconData: AppIcons.icon_binary,
  ),
  const _ItemVo(
    label: 'Career',
    svgId: SvgIcons.star,
    url: CareerPage.url,
    iconData: AppIcons.star_1,
  ),
  const _ItemVo(
    label: 'Settings',
    svgId: SvgIcons.settings,
    url: SettingsPage.url,
    iconData: AppIcons.settings,
  ),
];

/// root menu data.
class _ItemVo {
  final String svgId;
  final String label;
  final String url;
  final IconData iconData;

  const _ItemVo({
    required this.svgId,
    required this.label,
    required this.url,
    required this.iconData,
  });
}

// trending_up.svg
