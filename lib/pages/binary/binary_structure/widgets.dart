part of 'binary_structure.dart';

class _BinaryTree extends StatelessWidget {
  const _BinaryTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // clipBehavior: Clip.none,
      // fit: StackFit.passthrough,
      children: [
        InteractiveViewer(
          clipBehavior: Clip.antiAlias,
          alignPanAxis: true,
          constrained: false,
          maxScale: 1,
          minScale: 1,
          panEnabled: true,
          scaleEnabled: false,
          child: Container(),
          // child: const BinaryTreeCanvas(),
          // child: const SingleChildScrollView(
          //   // primary: false,
          //   // physics: NeverScrollableScrollPhysics(),
          //   scrollDirection: Axis.horizontal,
          //   child: BinaryTreeCanvas(),
          // ),
        ),
        Padding(
          padding: kPadH16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                style: kBinaryTreeCircleButtonStyle,
                onPressed: () {
                  context.toastNotImplemented();
                },
                child: const Icon(
                  AppIcons.vertical_align_top,
                  size: 18,
                ),
              ),
              OutlinedButton(
                style: kBinaryTreeCircleButtonStyle,
                onPressed: () {
                  context.toastNotImplemented();
                },
                child: const Icon(
                  AppIcons.airline_stops,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SelectorPanel extends StatelessWidget {
  final String label, accounts, amount;
  final bool selected;
  final VoidCallback? onTap;

  const _SelectorPanel({
    Key? key,
    required this.label,
    required this.accounts,
    required this.amount,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Row(
            children: [
              _Dot(color: AppColors.green),
              kGap8,
              Text(
                label,
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 16,
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w600,
                ),
              ).exp(),
              Radio(
                value: selected ? 'a' : 'b',
                groupValue: 'a',
                onChanged: (a) {
                  onTap?.call();
                },
                toggleable: true,
              ),
            ],
          ),
          kGap8,
          itemRow(icon: AppIcons.account_circle, label: amount),
          kGap8,
          itemRow(icon: AppIcons.payments, label: amount),
        ],
      ),
    );
  }

  Widget itemRow({required IconData icon, required String label}) {
    return AppCard(
      color: AppColors.primaryPurple.withOpacity(.1),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: AppColors.appbarIconGrey,
            size: 18,
          ),
          Text(
            label,
            style: TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;

  const _Dot({
    Key? key,
    this.color = AppColors.greyAccesoryIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PageCard(
      child: Row(
        children: [
          CircleAvatar(
            radius: 32 / 2,
            child: Text('L'),
          ),
          kGap12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "First & last name",
                style: TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              ),
              Text(
                "Login",
                style: TextStyle(
                  color: Color(0xffb9b9c3),
                  fontSize: 14,
                ),
              )
            ],
          ).exp(),
          Text(
            "GOLD",
            style: TextStyle(
              color: Color(0xffff9f43),
              fontSize: 14,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PageCard extends StatelessWidget {
  final Widget child;

  const _PageCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 10,
      color: Colors.white,
      child: child,
    );
  }
}


///
///
///

class _LeftRightPanel extends StatelessWidget {
  final String selectedPanel;
  final ValueChanged<String> onChange;

  const _LeftRightPanel(
      {Key? key, required this.selectedPanel, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadH16,
      child: _PageCard(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SelectorPanel(
              label: "Left",
              selected: selectedPanel == "Left",
              onTap: () {
                onChange("Left");
              },
              accounts: '1200',
              amount: '2500 MTS',
            ).exp(),
            SizedBox(
              height: 108,
              child: VerticalDivider(
                color: const Color(0xff5E5873).withOpacity(.12),
                width: 32,
                thickness: 1,
              ),
            ),
            _SelectorPanel(
              label: "Right",
              selected: selectedPanel == "Right",
              onTap: () {
                onChange("Right");
              },
              accounts: '700',
              amount: '1200 MTS',
            ).exp(),
          ],
        ),
      ),
    );
  }
}
