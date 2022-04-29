import 'package:metashark/commons.dart';

import '../canvas_tree/canvas_tree.dart';

class BinaryTreeCanvas extends StatelessWidget {
  const BinaryTreeCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 1200,
        height: 700,
        // color: Colors.grey,
        // child: BinaryTreePageSample(),
        child: CanvasTreeView(),
        // child: Wrap(
        //   spacing: 1,
        //   runSpacing: 1,
        //   children: [
        //     ...List.generate(20, (index) => FlutterLogo()),
        //     Center(
        //       child: Text('Binary tree here'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
