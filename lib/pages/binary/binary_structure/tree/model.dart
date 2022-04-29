const Set<String> accountRelationType = {
  'SELF',
  'PARTNER',
  'TEAM',
  'OUTSIDER',
};

class DataView {
  final Tree tree;
  Map<int, Account> accounts = {};
  Map<int, Position> positions = {};
  Map<int, Set<int>> refPositions = {};

  DataView(this.tree);

  void accountSet (Account account) {
    accounts.addAll({account.accountID: account});
  }
  void positionSet (Position position) {
    positions.addAll({position.positionID: position});
    refPositions.putIfAbsent(position.positionRefID, () => {}).add(position.positionID);
  }

  Account? accountGet (int accountID) {
    return accounts[accountID];
  }
  Position? positionGet (int positionID) {
    return positions[positionID];
  }
  Map<int, Position> refLinePositionsGet (int refPositionID) {
    Map<int, Position> res = {};
    final _refs = refPositions[refPositionID];
    if (_refs != null) {
      for (var positionID in _refs) {
        final position = positions[positionID];
        if (position != null) {
          res[position.positionRefLine] = position;
        }
      }
    }
    return res;
  }
}

class Tree {
  final int treeID;
  final String treeName;
  final int defaultPositionWidth;
  final int positionsTotalQuantity;

  Tree ({
    this.treeID = 0,
    this.treeName = '',
    this.defaultPositionWidth = 0,
    this.positionsTotalQuantity = 0,
  });
}
class Account {
  int accountID = 0;
  String accountLogin = '';
}
class Position {
  final int positionID;
  final int positionRefID;
  final int positionRefLine;
  final int positionWidth;
  final int accountID;
  final DateTime? createdAt;

  Position({
    this.positionID = 0,
    this.positionRefID = 0,
    this.positionRefLine = 0,
    this.positionWidth = 0,
    this.accountID = 0,
    this.createdAt
  });
}
