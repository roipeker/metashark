part of 'plans.dart';

abstract class _PlansState extends State<PlansPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }


  int get currentIndex => widget.currentTab;

  void onBottomNavTap(int index) {
    var url = '/plans/tab/' + _kBottomMenuNav[index].urlId;
    context.go(url);
  }

}



enum ContractType { gold, bronze }
class ContractTypeData {
  final String name;
  final ContractType type;
  final LinearGradient gradient;

  const ContractTypeData({
    required this.name,
    required this.type,
    required this.gradient,
  });
}

const kContractGold = ContractTypeData(
  name: 'GOLD',
  type: ContractType.gold,
  gradient: LinearGradient(
    colors: [Color(0xffFFBB32), Color(0xffDC9F24)],
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
  ),
);

const kContractBronze = ContractTypeData(
  name: 'BRONZE',
  type: ContractType.bronze,
  gradient: LinearGradient(
    colors: [Color(0xffF595E0), Color(0xffD468A9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
