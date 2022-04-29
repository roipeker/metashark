part of 'canvas_tree.dart';

abstract class _CanvasTreeState extends State<CanvasTreeView> {
  final _data = _kDataViewPositions;

  // int viewPositionID = 1;
  int viewLevelLimit = 1;

  int get viewPositionID => widget.nodeId ?? 1;

  @override
  void didUpdateWidget(covariant CanvasTreeView oldWidget) {
    if (oldWidget.nodeId != widget.nodeId ||
        oldWidget.controller == widget.controller) {
      // viewPositionID = widget.nodeId ?? 1;
      update();
    }
    widget.controller?.addListener(_onAction);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.controller?.addListener(_onAction);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onAction);
    super.dispose();
  }

  void _onAction() {
    if (controller.action == ControllerAction.up) {
      _apiCall(
        position?.positionRefID ?? 1,
        viewLevelLimit,
      );
    } else if (controller.action == ControllerAction.top) {
      _apiCall(1, viewLevelLimit);
    }
  }

  VoidCallback? get onTopTap =>
      !hasValidPosition ? null : () => _apiCall(1, viewLevelLimit);

  VoidCallback? get onUpTap => !hasValidPosition
      ? null
      : () => _apiCall(
            position?.positionRefID ?? 1,
            viewLevelLimit,
          );

  bool get hasValidPosition => (position?.positionRefID ?? 0) > 0;

  bool get hasPosition => position != null;

  Position? get position => _data.positionGet(viewPositionID);

  String _imageByLevel(bool empty, int level) {
    if (empty) {
      return ''; //MockupImages.mockTreeAvatarOrange;
    }
    if (level < 2) {
      return MockDataFactory.getRandomImage(w: 200, seed: 'image-$level');
    }
    if (level == 3) return MockupImages.mockTreeAvatarPurple;
    if (level == 4) return MockupImages.mockTreeAvatarBlue;
    return MockupImages.mockTreeAvatarOrange;
  }

  void _apiCall(int positionID, int levelLimit) {
    if (positionID > 0 && levelLimit > 0) {
      context.go('/binary/structure?id=$positionID&level_limit=$levelLimit');
      viewLevelLimit = levelLimit;
    }
  }

  double positionDiameterByLevel(int currentLevel) {
    switch (currentLevel) {
      case 0:
        return 120;
      case 1:
        return 100;
      case 2:
        return 80;
      default:
        return 60;
    }
  }
}

DataView get _kDataViewPositions {
  final tree = Tree(
      treeID: 1,
      treeName: 'Binary',
      defaultPositionWidth: 2,
      positionsTotalQuantity: 1000);
  final data = DataView(tree);

  /// positionID = 0 > empty.

  data
    ..positionSet(Position(
        positionID: 1,
        positionRefID: 0,
        positionRefLine: 0,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 2,
        positionRefID: 1,
        positionRefLine: 1,
        positionWidth: 2,
        accountID: 0))
    // ..positionSet(Position(
    //     positionID: 3,
    //     positionRefID: 1,
    //     positionRefLine: 2,
    //     positionWidth: 3,
    //     accountID: 0))
    ..positionSet(Position(
        positionID: 4,
        positionRefID: 2,
        positionRefLine: 1,
        positionWidth: 2,
        accountID: 0))
    // ..positionSet(Position(
    //     positionID: 5,
    //     positionRefID: 2,
    //     positionRefLine: 2,
    //     positionWidth: 4,
    //     accountID: 0))
    ..positionSet(Position(
        positionID: 6,
        positionRefID: 3,
        positionRefLine: 1,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 7,
        positionRefID: 3,
        positionRefLine: 3,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 8,
        positionRefID: 4,
        positionRefLine: 1,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 9,
        positionRefID: 4,
        positionRefLine: 2,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 10,
        positionRefID: 5,
        positionRefLine: 1,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 11,
        positionRefID: 5,
        positionRefLine: 2,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 12,
        positionRefID: 6,
        positionRefLine: 1,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 13,
        positionRefID: 6,
        positionRefLine: 2,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 14,
        positionRefID: 7,
        positionRefLine: 1,
        positionWidth: 2,
        accountID: 0))
    ..positionSet(Position(
        positionID: 15,
        positionRefID: 7,
        positionRefLine: 2,
        positionWidth: 2,
        accountID: 0));

  return data;
}
