part of 'change_password.dart';

abstract class _ChangePasswordState extends State<ChangePasswordPage>
    with TickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      // initialIndex: widget.index,
      initialIndex: 0,
    );
  }

  @override
  void didUpdateWidget(covariant ChangePasswordPage oldWidget) {
    /// new index?
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
