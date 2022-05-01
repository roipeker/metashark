part of 'plans_steaking.dart';

abstract class _PlansSteakingState extends State<PlansSteakingPage> {

  final pageController = PageController(
    initialPage: 0,
    // viewportFraction: 0.8,
  );

  List<PlanCardVo> get cards => _kCards;
  int get count => cards.length;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onBuyTap() {
    context.toastNotImplemented();
  }

  void onShowGifts() {
    context.toastNotImplemented();
  }
}

final _kCards = [
  kPackageTitanium,
  kPackageBronze,
  kPackageTitanium,
  kPackageBronze,
  kPackageTitanium,
  kPackageBronze,
];

const kPackageTitanium = PlanCardVo(
  tokenBonus: '+5%',
  staking: '36% year',
  lockup: '12 months',
  directBonus: '11%',
  binaryBonus: '11%',
  binaryLimit: '150 MTS/day',
  matchingBonus: '3 Levels',
  ranking: 5,
  type: 'TITANIUM',
  title: '50-100 MTS',
  colors: [Color(0xff29518d), Color(0xff1c3d6d)],
);

const kPackageBronze = PlanCardVo(
  tokenBonus: '+5%',
  staking: '36% year',
  lockup: '12 months',
  directBonus: '10%',
  binaryBonus: '10%',
  binaryLimit: '4000 MTS',
  matchingBonus: '1 Levels 4%',
  ranking: 1,
  type: 'BRONZE',
  title: '200 - 1 999 MTS',
  colors: [Color(0xffC9915B), Color(0xffAF7741)],
);