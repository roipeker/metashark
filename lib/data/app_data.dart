import 'package:metashark/commons.dart';

final appData = _AppData();

class _AppData {
  String userId = 'roi';
  final hasGoogleAuth = true.obs();

  void init() {
    userId = '';
  }

  // void setGoogleAuth(bool flag) {
  //   _googleAuth = flag;
  // }
  // bool get hasGoogleAuth => _googleAuth;

  bool get isLogged => userId.isNotEmpty;

  void logout() {
    userId = '';
    router.go('/');
  }

  void login([String userId = '1']) {
    this.userId = userId;
  }

  // var selectedPackage
}




final kPackageFarmingCards = [
  kPackageBronze,
  kPackageSilver,
  kPackageGold,
  kPackagePlatinum,
  kPackageTitanium,
];

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

const kPackageSilver = PlanCardVo(
  tokenBonus: '+7,5%',
  staking: '36% year',
  lockup: '12 months',
  directBonus: '10%',
  binaryBonus: '10%',
  binaryLimit: '8 000 MTS',
  matchingBonus: '2 Levels 4%',
  ranking: 2,
  type: 'SILVER',
  title: '2 000 - 11 999 MTS',
  colors: [Color(0xffC0C0C0), Color(0xffA9A9A9)],
);

const kPackageGold = PlanCardVo(
  tokenBonus: '+10%',
  staking: '36% year',
  lockup: '12 months',
  directBonus: '11%',
  binaryBonus: '11%',
  binaryLimit: '16 000 MTS',
  matchingBonus: '3 Levels 3%',
  ranking: 3,
  type: 'GOLD',
  title: '12 000 - 59 999 MTS',
  colors: [Color(0xffD4AF37), Color(0xffDAA520)],
);

const kPackagePlatinum = PlanCardVo(
  tokenBonus: '+12,5%',
  staking: '36% year',
  lockup: '12 months',
  directBonus: '11%',
  binaryBonus: '11%',
  binaryLimit: '40 000 MTS',
  matchingBonus: '4 Levels 2%',
  ranking: 4,
  type: 'PLATINUM',
  title: '60 000 - 199 999 MTS',
  colors: [Color(0xff3D007B), Color(0xff5405A4)],
);

const kPackageTitanium = PlanCardVo(
  tokenBonus: '+15%',
  staking: '36% year',
  lockup: '12 months',
  directBonus: '12%',
  binaryBonus: '12%',
  binaryLimit: '100 000 MTS',
  matchingBonus: '5 Levels 1%',
  ranking: 5,
  type: 'TITANIUM',
  title: 'from 200 000 MTS',
  colors: [Color(0xff295F8D), Color(0xff1D3D6D)],
);
