import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

part 'sessions_state.dart';

class SessionsPage extends StatefulWidget {
  static const url = "/sessions";

  const SessionsPage({Key? key}) : super(key: key);

  @override
  createState() => _SessionsPage();
}

class _SessionsPage extends _SessionsState {
  Widget _getCardContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Version 0.01",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
          ),
        ),
        Text(
          "iMac, macOs 11,4",
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 12,
          ),
        ),
        Text(
          "199.289.109.78",
          style: TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: const CommonAppBar(title: 'Sessions'),
        body: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: ListView(
            clipBehavior: Clip.none,
            padding: kPad16.copyWith(top: 24),
            shrinkWrap: true,
            children: [
              SessionsCard(
                title: "Current session",
                content: _getCardContent(),
                suffix: Text(
                  "Online",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xff28c76f),
                    fontSize: 14,
                  ),
                ),
              ),
              kGap16,
              AppElevatedButton.primary(
                child: Text('Cancel other sessions'),
                onTap: onCancelTap,
                extended: true,
              ),
              kGap16,
              const AppText(
                'Device',
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              kGap16,
              DismissableSessionItem(
                id: '1',
                content: _getCardContent(),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void onCancelTap() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.goNamed(SettingsPage.url);
    }
  }

  Future<bool> openConfirmationDialog() {
    return context
        .openDialog<bool?>(ConfirmDialogCupertino())
        // .openDialog<bool?>(ConfirmDialogMaterial())
        .then((value) => value ?? false);
  }
}

class DismissableSessionItem extends StatelessWidget {
  final String id;
  final Widget content;

  const DismissableSessionItem({
    Key? key,
    required this.id,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 4,
      clip: Clip.antiAlias,
      padding: EdgeInsets.zero,
      child: Dismissible(
        movementDuration: .3.seconds,
        key: ValueKey('session$id'),
        // onDismissed: (e) {
        //   trace('e', e);
        // },
        direction: DismissDirection.endToStart,
        background: Container(
          color: AppColors.red,
          padding: kPad16,
          child: Text(
            'Delete',
            style: TextStyle(color: Colors.white),
          ).centerRight(),
        ),
        confirmDismiss: (dir) async {
          return true;
          // var result = await openConfirmationDialog();
          // return result;
          // trace("Dir: ", dir);
          // await 1.seconds.delay();
          // return false;
        },
        child: Padding(
          padding: kPad16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: content),
              // if (suffix != null) suffix!,
            ],
          ),
        ),
      ),
    );
  }
}
