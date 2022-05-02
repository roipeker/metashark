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
  late final transformController = TransformationController();

  @override
  void initState() {
    // transformController.addListener(() {
    //   var m = transformController.value;
    //   print(m);
    // });
    super.initState();
  }

  @override
  void dispose() {
    transformController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        var availableSize = Size(constrains.maxWidth, constrains.maxHeight);
        var canvasSize = const Size(1200, 790);
        if (canvasSize > availableSize) {
          // adjust scale?
          var rw = availableSize.width / canvasSize.width;
          var rh = availableSize.height / canvasSize.height;
          var m2 = Matrix4.identity();
          double scale = rw < rh ? rw : rh;
          var sw = canvasSize.width * scale;
          var sh = canvasSize.height * scale;
          // trace('aaa',scale,canvasSize.width * scale);
          var dx = (availableSize.width - sw) / 2;
          var dy = (availableSize.height - sh) / 2;
          m2.translate(dx, dy);
          m2.scale(scale);
          transformController.value = m2;
        }
        return Stack(
          children: [
            InteractiveViewer(
              clipBehavior: Clip.hardEdge,
              alignPanAxis: false,
              constrained: false,
              boundaryMargin: const EdgeInsets.all(100),
              maxScale: 1,
              minScale: .05,
              panEnabled: true,
              scaleEnabled: true,
              transformationController: transformController,
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  width: canvasSize.width,
                  height: canvasSize.height,
                  child: CanvasTreeView(
                    controller: controller,
                    nodeId: widget.nodeId,
                  ),
                ),
                // child: sampleContent(),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: 16,
              child: SafeArea(
                child: _TreeMenu(
                  onTap1: () {
                    controller.goTop();
                  },
                  onTap2: () {
                    controller.goUp();
                  },
                ),
              ),
            ),
          ],
        );
      },
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
