import 'package:flutter/material.dart';
part 'canvas_tree_state.dart';
part 'model.dart';

class CanvasTreeView extends StatefulWidget {
  
  const CanvasTreeView({Key? key}) : super(key: key);
  
  @override
  createState() => _CanvasTreeView();
}

class _CanvasTreeView extends _CanvasTreeState {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  // onPressed: (position?.positionRefID ?? 0) > 0 ? () => _apiCall(1, viewLevelLimit) : null,
                  onPressed: onTopTap,
                  child: const Text('Top'),
                ),
                ElevatedButton(
                  // onPressed: (position?.positionRefID ?? 0) > 0 ? () => _apiCall(position?.positionRefID ?? 1, viewLevelLimit) : null,
                  onPressed: onUpTap,
                  child: const Text('Up'),
                ),
              ],
            ),
          ),
          buildNode(position, 0),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Level 0',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Level 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Level 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.adjust),
            label: 'Level 3',
          ),
        ],
        currentIndex: viewLevelLimit,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blue[800],
        onTap: (int index) => {
          setState(() {
            viewLevelLimit = index;
          })
        },
      ),
    );
  }

  Widget buildNodePosition(Position? position, double diameter) {
    var positionID = position?.positionID ?? 0;
    return SizedBox.fromSize(
      size: Size.square(diameter),
      child: positionID > 0 ? ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(diameter/2),
              side: BorderSide(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ),
        onPressed: () => _apiCall(positionID, viewLevelLimit),
        child: Text('$positionID'),
      ) : Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(diameter/2),
          color: Colors.grey,
        ),
      ),
    );
  }
  Widget buildNode(Position? position, int currentLevel) {
    final children = <Widget>[];
    if (currentLevel < viewLevelLimit) {
      if (position == null) {
        for (var refLine=1; refLine <= _data.tree.defaultPositionWidth; refLine++) {
          children.add(Expanded(child: buildNode(null, currentLevel+1)));
        }
      } else {
        final refs = _data.refLinePositionsGet(position.positionID);
        for (var refLine=1; refLine <= position.positionWidth; refLine++) {
          children.add(Expanded(child: buildNode(refs[refLine], currentLevel+1)));
        }
      }
    }
    return Column(
      children: [
        Container(
          color: Colors.orangeAccent.withOpacity(0.5),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildNodePosition(position, positionDiameterByLevel(currentLevel)),
            ],
          ),
        ),
        if (children.isNotEmpty) Row(
          children: children,
        ),
      ],
    );
  }

}

