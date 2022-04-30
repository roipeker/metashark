import 'package:metashark/commons.dart';

part 'plans_subscribe_state.dart';

class PlansSubscribePage extends StatefulWidget {
  static const url = "/plans-subscribe";
  const PlansSubscribePage({Key? key}) : super(key: key);

  @override
  createState() => _PlansSubscribePage();
}

class _PlansSubscribePage extends _PlansSubscribeState {
  @override
  Widget build(BuildContext context) {
    return ComingSoonBody();
    // return Scaffold(
    //   body: RefreshIndicator(
    //     onRefresh: onRefreshPull,
    //     child: Scrollbar(
    //       child: ListView(
    //         padding: kPad16,
    //         physics: const AlwaysScrollableScrollPhysics(),
    //         clipBehavior: Clip.none,
    //         shrinkWrap: true,
    //         children: [
    //           Text('To be implemented'),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
