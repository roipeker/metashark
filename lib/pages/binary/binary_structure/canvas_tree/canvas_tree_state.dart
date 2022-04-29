part of 'canvas_tree.dart';

abstract class _CanvasTreeState extends State<CanvasTreeView> {
  String get titleText => 'Canvas Tree page';
  final _data = _kDataViewPositions;
  int viewPositionID = 1;
  int viewLevelLimit = 3;

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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _apiCall(int positionID, int levelLimit) {
    if (positionID > 0 && levelLimit > 0) {
      setState(() {
        viewPositionID = positionID;
        viewLevelLimit = levelLimit;
      });
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

DataView get _kDataViewPositions => DataView(Tree(
    treeID: 1,
    treeName: 'Binary',
    defaultPositionWidth: 2,
    positionsTotalQuantity: 1000))
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
  ..positionSet(Position(
      positionID: 3,
      positionRefID: 1,
      positionRefLine: 2,
      positionWidth: 3,
      accountID: 0))
  ..positionSet(Position(
      positionID: 4,
      positionRefID: 2,
      positionRefLine: 1,
      positionWidth: 2,
      accountID: 0))
  ..positionSet(Position(
      positionID: 5,
      positionRefID: 2,
      positionRefLine: 2,
      positionWidth: 4,
      accountID: 0))
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

// final DataView _data = DataView(Tree(treeID: 1, treeName: 'Binary', defaultPositionWidth: 2, positionsTotalQuantity: 1000));
// int viewPositionID = 1;
// int viewLevelLimit = 3;
//
// @override
// void initState() {
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//   super.initState();
// }
