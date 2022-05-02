part of 'binary_structure.dart';

abstract class _BinaryStructureState extends State<BinaryStructurePage> {
  String selectedPanel = 'Left';
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

  Future<void> onUserCardTap() async {
    trace("TAP!");
    final result = await context
        .openModalSheet<PartnerResult?>(const PartnerInfoSheetView());
    if (result == PartnerResult.command) {
      context.pushNamed(PartnerDetailsPage.url, params: {'id': '123'});
    } else if (result == PartnerResult.binary) {
      context.push('/binary/structure?id=4');
    }
  }
}
