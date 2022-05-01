part of 'plans.dart';

const _kBottomMenuNav = <BottomNavItemVo>[
  BottomNavItemVo(
    name: 'Steaking',
    urlId: 'steaking',
    iconData: AppIcons.layer_group,
  ),
  BottomNavItemVo(
    name: 'Subscribe',
    urlId: 'subscribe',
    iconData: AppIcons.subscriptions,
  ),
];

class PlanCardVo {
  final String tokenBonus;
  final String staking;
  final String lockup;
  final String directBonus;
  final String binaryBonus;
  final String binaryLimit;
  final String matchingBonus;
  final int ranking;
  final String type;
  final String title;
  final List<Color> colors;

  const PlanCardVo({
    required this.tokenBonus,
    required this.staking,
    required this.lockup,
    required this.directBonus,
    required this.binaryBonus,
    required this.binaryLimit,
    required this.matchingBonus,
    required this.ranking,
    required this.type,
    required this.title,
    required this.colors,
  });
}

