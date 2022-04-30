import 'package:metashark/commons.dart';

import 'canvas_tree/tree_widget.dart';

part 'binary_structure_state.dart';
part 'widgets.dart';

class BinaryStructurePage extends StatefulWidget {
  static const urlParamId = "structure";
  final int? nodeId;

  const BinaryStructurePage({Key? key, this.nodeId}) : super(key: key);

  @override
  createState() => _BinaryStructurePage();
}

class _BinaryStructurePage extends _BinaryStructureState {
  @override
  void didUpdateWidget(covariant BinaryStructurePage oldWidget) {
    if (oldWidget.nodeId != widget.nodeId) {
      trace("Change node id!", widget.nodeId);
    }
    super.didUpdateWidget(oldWidget);
  }

  int? get nodeId => widget.nodeId;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, con) {
        double treeH = max(con.maxHeight, 500.0);
        return RefreshIndicator(
          onRefresh: onRefreshPull,
          child: SafeArea(
            child: Scrollbar(
              controller: scrollController,
              child:
                  con.maxHeight < 500 ? buildList(treeH: treeH) : buildColumn(),
            ),
          ),
        );
      },
    );
  }

  Widget buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buildChildren(),
    );
  }

  Widget buildList({double treeH = 500}) {
    return ListView(
      controller: scrollController,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      children: buildChildren(treeH: treeH),
    );
  }

  List<Widget> buildChildren({double? treeH}) {
    Widget tree = TreeWidget(nodeId: nodeId);
    if (treeH != null) {
      tree = SizedBox(
        height: treeH,
        width: double.infinity,
        child: tree,
      );
    } else {
      tree = Expanded(
        child: tree,
      );
    }

    return [
      kGap16,
      const Padding(
        padding: kPadH16,
        child: _UserCard(),
      ),
      kGap16,
      _LeftRightPanel(
        selectedPanel: selectedPanel,
        onChange: (value) {
          selectedPanel = value;
          update();
        },
      ),
      kGap16,
      tree,
    ];
  }
}
