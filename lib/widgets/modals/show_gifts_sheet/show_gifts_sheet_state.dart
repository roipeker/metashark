part of 'show_gifts_sheet.dart';

abstract class _ShowGiftsSheetState extends State<ShowGiftsSheet> {
  ScrollController? get scrollController {
    return ModalScrollController.of(context);
  }

  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      scrollController?.addListener(_onScrollUpdate);
    });
    super.initState();
  }

  void _onScrollUpdate() {
    final s = scrollController!;
    double maxScroll = s.position.maxScrollExtent;
    double currentScroll = s.position.pixels;
    if(currentScroll>maxScroll){
      s.position.jumpTo(maxScroll);
    }
  }

  @override
  void dispose() {
    // scrollController?.removeListener(_onScrollUpdate);
    super.dispose();
  }
}
