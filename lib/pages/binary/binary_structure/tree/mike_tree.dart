
import 'package:metashark/commons.dart';

import 'model.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Binary tree',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const BinaryTreePage(),
//     );
//   }
// }

class BinaryTreePageSample extends StatefulWidget {
  const BinaryTreePageSample({Key? key}) : super(key: key);

  @override
  State<BinaryTreePageSample> createState() => _BinaryTreePageSampleState();
}

class _BinaryTreePageSampleState extends State<BinaryTreePageSample> {
  final DataView _data = DataView(Tree(treeID: 1, treeName: 'Binary', defaultPositionWidth: 2, positionsTotalQuantity: 1000));
  int viewPositionID = 1;
  int viewLevelLimit = 3;

  @override
  void initState() {
    _data.positionSet(Position(positionID: 1, positionRefID: 0, positionRefLine: 0, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 2, positionRefID: 1, positionRefLine: 1, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 3, positionRefID: 1, positionRefLine: 2, positionWidth: 3, accountID: 0));
    _data.positionSet(Position(positionID: 4, positionRefID: 2, positionRefLine: 1, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 5, positionRefID: 2, positionRefLine: 2, positionWidth: 4, accountID: 0));
    _data.positionSet(Position(positionID: 6, positionRefID: 3, positionRefLine: 1, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 7, positionRefID: 3, positionRefLine: 3, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 8, positionRefID: 4, positionRefLine: 1, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 9, positionRefID: 4, positionRefLine: 2, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 10, positionRefID: 5, positionRefLine: 1, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 11, positionRefID: 5, positionRefLine: 2, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 12, positionRefID: 6, positionRefLine: 1, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 13, positionRefID: 6, positionRefLine: 2, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 14, positionRefID: 7, positionRefLine: 1, positionWidth: 2, accountID: 0));
    _data.positionSet(Position(positionID: 15, positionRefID: 7, positionRefLine: 2, positionWidth: 2, accountID: 0));
    super.initState();
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
    List<Widget> children = [];
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

  @override
  Widget build(BuildContext context) {
    var position = _data.positionGet(viewPositionID);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Binary tree'),
      // ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: (position?.positionRefID ?? 0) > 0 ? () => _apiCall(1, viewLevelLimit) : null,
                  child: const Text('Top'),
                ),
                ElevatedButton(
                  onPressed: (position?.positionRefID ?? 0) > 0 ? () => _apiCall(position?.positionRefID ?? 1, viewLevelLimit) : null,
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
}
