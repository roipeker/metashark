part of 'binary_structure.dart';

abstract class _BinaryStructureState extends State<BinaryStructurePage> {
  String get titleText => 'Binary Structure page';
  final scrollController = ScrollController();

  Future<void> onRefreshPull() async {
    await 2.seconds.delay();
    return;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
