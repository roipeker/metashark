import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

import 'modals/modals.dart';

part 'quest_state.dart';

part 'widgets.dart';

class QuestPage extends StatefulWidget {
  static const url = "Quest";

  const QuestPage({Key? key}) : super(key: key);

  @override
  createState() => _QuestPage();
}

class _QuestPage extends _QuestState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Quest'),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: SafeArea(
              child: ListView(
                padding: kPad16,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                clipBehavior: Clip.none,
                shrinkWrap: true,
                children: [
                  _QuestCard(
                      title: "Quest “KING”",
                      onShowGiftsTap: () {
                        onCardTap();
                      }),
                  kGap16,
                  _QuestCard(
                      title: "Quest “KING”",
                      onShowGiftsTap: () {
                        onCardTap();
                      }),
                  kGap16,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
