import 'package:metashark/commons.dart';

import 'canvas_tree.dart';

enum ControllerAction { up, top }

class BinaryTreeController extends ChangeNotifier {
  ControllerAction action = ControllerAction.top;

  void goUp() {
    action = ControllerAction.up;
    notifyListeners();
  }

  void goTop() {
    action = ControllerAction.top;
    notifyListeners();
  }
}

final controller = BinaryTreeController();

class TreeWidget extends StatefulWidget {
  final int? nodeId;


  const TreeWidget({
    Key? key,
    this.nodeId,
  }) : super(key: key);

  @override
  State<TreeWidget> createState() => _TreeWidgetState();
}

class _TreeWidgetState extends State<TreeWidget> {
  // late final transformController = TransformationController();
  
  @override
  void dispose() {
    // transformController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InteractiveViewer(
          clipBehavior: Clip.antiAlias,
          alignPanAxis: false,
          constrained: false,
          boundaryMargin: const EdgeInsets.all(80),
          maxScale: 1,
          minScale: .25,
          panEnabled: true,
          scaleEnabled: true,
          // transformationController: transformController,
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: 1200,
              height: 790,
              child: CanvasTreeView(
                controller: controller,
                  nodeId:widget.nodeId,
              ),
            ),
            // child: sampleContent(),
          ),
        ),
        _TreeMenu(
          onTap1: () {
            controller.goTop();
          },
          onTap2: () {
            controller.goUp();
          },
        ),
      ],
    );
  }
}

class _TreeMenu extends StatelessWidget {
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;

  const _TreeMenu({
    Key? key,
    this.onTap1,
    this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadH16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            style: kBinaryTreeCircleButtonStyle,
            onPressed: onTap1,
            child: const Icon(
              AppIcons.vertical_align_top,
              size: 18,
            ),
          ),
          OutlinedButton(
            style: kBinaryTreeCircleButtonStyle,
            onPressed: onTap2,
            child: const Icon(
              AppIcons.airline_stops,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
