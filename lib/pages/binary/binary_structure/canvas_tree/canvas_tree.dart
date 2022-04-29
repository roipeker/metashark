import 'package:metashark/commons.dart';

import 'tree_node.dart';
import 'tree_widget.dart';

part 'canvas_tree_state.dart';

part 'model.dart';

class CanvasTreeView extends StatefulWidget {
  final BinaryTreeController? controller;
  final int? nodeId;

  const CanvasTreeView({Key? key, this.controller, this.nodeId})
      : super(key: key);

  @override
  createState() => _CanvasTreeView();
}

class _CanvasTreeView extends _CanvasTreeState {
  @override
  Widget build(BuildContext context) {
    return buildNode(position, 0);
  }

  Widget buildNodePosition(Position? position, int level) {
    var config = kConfigByLevel[level];
    if (config == null) {
      return const Circle(
        color: Colors.blue,
        size: 10,
      );
    }
    final positionID = position?.positionID ?? 0;
    final emptyPosition = position == null;
    final node = BinaryNode(
      name: emptyPosition ? 'empty' : MockDataFactory.randomName(),
      levelConfig: config,
      isEmpty: emptyPosition,
      positionID: positionID,
      count: emptyPosition ? 0 : MockDataFactory.randomInt(1, 8),
      imageUrl: _imageByLevel(emptyPosition, level),
      purchased: emptyPosition ? false : MockDataFactory.random() < .5,
      onTap: positionID == 0 || level == 0
          ? null
          : () => _apiCall(positionID, viewLevelLimit),
    );
    return node;
  }

  Widget buildNode(Position? position, int currentLevel) {
    final children = <Widget>[];
    if (currentLevel < viewLevelLimit) {
      if (position == null) {
        final _children = List.generate(
          _data.tree.defaultPositionWidth,
          (index) => Expanded(
            child: buildNode(null, currentLevel + 1),
          ),
        );
        children.addAll(_children);
      } else {
        final refs = _data.refLinePositionsGet(position.positionID);
        for (var refLine = 1; refLine <= position.positionWidth; refLine++) {
          children.add(
            Expanded(
              child: buildNode(refs[refLine], currentLevel + 1),
            ),
          );
        }
      }
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: buildNodePosition(position, currentLevel),
        ),
        if (children.isNotEmpty) Row(children: children),
      ],
    );
  }
}