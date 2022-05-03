part of 'password_confirmation_form_sheet.dart';

abstract class _PasswordConfirmationFormSheetState
    extends State<PasswordConfirmationFormSheet> with TickerProviderStateMixin {
  List<String> get tabsTitles => [
        'Password',
        '2-FA',
      ];

  void onTabTap(int value) {
    FocusScope.of(context).unfocus();
  }

  List<Tab> get tabsData => tabsTitles.map2(
        (text) => Tab(text: text),
      );

  late final PageController _pageController = PageController();
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void initState() {
    _tabController.addListener(() {
      _pageController.animateToPage(
        _tabController.index,
        duration: _tabController.animationDuration,
        curve: Curves.easeOut,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void onSaveTap() {
    var nav = context.navigator()!;
    if(nav.canPop()){
      nav.pop(true);
    }
  }
}
