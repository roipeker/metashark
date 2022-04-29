import 'package:metashark/commons.dart';
import 'package:rive/rive.dart';

class ComingSoonPage extends StatelessWidget {
  static const url = 'comingSoon';
  final String title;

  const ComingSoonPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var bp = context.layout.breakpoint;
    // late Widget body;
    var scaffold = Scaffold(
      appBar: CommonAppBar(title: title),
      backgroundColor: const Color(0xffDFE1E9),
      body: const _PageContent(),
    );
    return Column(
      children: [
        scaffold.exp(),
        const LayoutBar(),
      ],
    );
  //   if (bp >= LayoutBreakpoint.sm) {
  //     var extended = true;
  //     if (bp < LayoutBreakpoint.md) {
  //       extended = false;
  //     }
  //     return Row(
  //       children: [
  //         NavigationSideBar(
  //           extended: extended,
  //           selectedIndex: 0,
  //           onIndexSelect: (index) {},
  //         ),
  //         scaffold.exp(),
  //       ],
  //     );
  //   } else {
  //     return scaffold;
  //   }
  }
}
//
// class NavigationSideBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onIndexSelect;
//   final bool extended;
//
//   const NavigationSideBar({
//     Key? key,
//     this.extended = false,
//     required this.selectedIndex,
//     required this.onIndexSelect,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return NavigationRail(
//       selectedIndex: selectedIndex,
//       onDestinationSelected: onIndexSelect,
//       labelType: NavigationRailLabelType.none,
//       elevation: 1,
//       extended: extended,
//       groupAlignment: -0.9,
//       minExtendedWidth: 200,
//       minWidth: 30,
//       leading: FlutterLogo(),
//       useIndicator: false,
//       destinations: const [
//         NavigationRailDestination(
//           icon: Icon(Icons.favorite_border),
//           selectedIcon: Icon(Icons.favorite),
//           label: Text('First'),
//         ),
//         NavigationRailDestination(
//           icon: Icon(Icons.bookmark_border),
//           selectedIcon: Icon(Icons.book),
//           label: Text('Second'),
//         ),
//         NavigationRailDestination(
//           icon: Icon(Icons.star_border),
//           selectedIcon: Icon(Icons.star),
//           label: Text('Third'),
//         ),
//       ],
//     );
//   }
// }

class _PageContent extends StatelessWidget {
  const _PageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spacing = BreakpointValue<double>(
      xs: 0.0,
      sm: 10.0,
      md: 30.0,
      lg: 50.0,
    ).resolve(context);

    return Stack(
      children: [
        const Positioned.fill(
          child: RiveAnimation.asset(
            Rives.delivery,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: EdgeInsets.all(spacing),
            child: AppCard(
              color: AppColors.primaryPurple.withOpacity(.1),
              elevation: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Coming soon...',
                    // style: context.theme.textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
