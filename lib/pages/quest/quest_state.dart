part of 'quest.dart';

abstract class _QuestState extends State<QuestPage> {
  final scrollController = ScrollController();

  Future<void> onRefreshPull() {
    return 2.seconds.delay();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onCardTap() {
    context.toastNotImplemented();
  }

}
