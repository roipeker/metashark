import 'package:metashark/commons.dart';

part 'voucher_recipients_state.dart';

class VoucherRecipientsPage extends StatefulWidget {
  static const url = "/voucher-recipients";

  const VoucherRecipientsPage({Key? key}) : super(key: key);

  @override
  createState() => _VoucherRecipientsPage();
}

class _VoucherRecipientsPage extends _VoucherRecipientsState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Recipients',
        actions: [
          SearchButton(
            onTap: onSearchTap,
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: Scrollbar(
          controller: scrollController,
          child: RefreshIndicator(
            onRefresh: onRefreshPull,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              clipBehavior: Clip.none,
              // shrinkWrap: true,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ...toggles.map2((toggle) {
                        return Obs(
                          () => _TileItem(
                            onSwitchChange: toggle,
                            active: toggle(),
                            onTap: () => toggle.toggle(),
                          ),
                        );
                      }).separator(
                        const Divider(indent: 16, endIndent: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: kPad16,
                  child: SizedBox(
                    height: 47,
                    child: OutlinedButton(
                      onPressed: onClearListTap,
                      child: Text('Clear the list'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TileItem extends StatelessWidget {
  final VoidCallback? onTap;
  final ValueChanged<bool> onSwitchChange;
  final String? title, subtitle;
  final bool active;

  const _TileItem({
    Key? key,
    this.onTap,
    required this.onSwitchChange,
    this.subtitle,
    this.title,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton.noElevation(
      padding: kPadH16V8,
      color: Colors.white,
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonAvatar(
                backgroundColor: AppColors.primaryPurple,
                label: 'L',
                radius: 40 / 2,
              ),
              kGap16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "First name Last name",
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        AppIcons.person,
                        size: 20,
                        color: AppColors.greyAccesoryIconColor,
                      ),
                      kGap4,
                      Text(
                        subtitle ?? "Login",
                        style: TextStyle(
                          color: Color(0xffb9b9c3),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ).exp(),
              Switch(value: active, onChanged: onSwitchChange),
            ],
          ),
        ],
      ),
    );
  }
}
