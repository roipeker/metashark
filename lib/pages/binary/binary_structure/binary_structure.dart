import 'package:metashark/commons.dart';

import 'tree/binary_tree.dart';

part 'binary_structure_state.dart';

class BinaryStructurePage extends StatefulWidget {
  // static const url = "/binary-structure";
  static const urlParamId = "structure";

  const BinaryStructurePage({Key? key}) : super(key: key);

  @override
  createState() => _BinaryStructurePage();
}

class _BinaryStructurePage extends _BinaryStructureState {
  String selectedPanel = 'Left';

  @override
  Widget build(BuildContext context) {
    /// todo: make proper code!!!
    return LayoutBuilder(
      builder: (_, con) {
        return RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Scrollbar(
            controller: scrollController,
            child: con.maxHeight < 400 ? buildList() : buildColumn(),
          ),
        );
      },
    );
  }

  Widget buildColumn() {
    return Column(
      children: [
        kGap16,
        const Padding(
          padding: kPadH16,
          child: _UserCard(),
        ),
        kGap16,
        Padding(
          padding: kPadH16,
          child: _PageCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _SelectorPanel(
                  label: "Left",
                  selected: selectedPanel == "Left",
                  onTap: () {
                    selectedPanel = "Left";
                    update();
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
                    selectedPanel = "Right";
                    update();
                  },
                  accounts: '700',
                  amount: '1200 MTS',
                ).exp(),
              ],
            ),
          ),
        ),
        kGap16,
        // const Expanded(child: _BinaryTree()),
        Center(
          child: Row(
            children: [
              BinaryItem(
                name: 'Login',
                levelConfig: kLevel5,
                count: 0,
                imageUrl: MockupImages.mockTreeAvatarBlue,
                purchased: true,
              ),
              BinaryItem(
                name: 'Roi',
                levelConfig: kLevel4,
                count: 8,
                imageUrl: MockupImages.mockTreeAvatarOrange,
                purchased: true,
              ),
              BinaryItem(
                name: 'Georgy',
                levelConfig: kLevel3,
                count: 1,
                imageUrl: MockupImages.mockTreeAvatarPurple,
                purchased: false,
              ),
              BinaryItem(
                name: 'Mike',
                imageUrl: MockDataFactory.getRandomImage(w: 300),
                levelConfig: kLevel2,
                count: 3,
                purchased: true,
              ),
              BinaryItem(
                name: 'Login',
                levelConfig: kLevel1,
                imageUrl: MockDataFactory.getRandomImage(w: 200, seed: 'b'),
                count: 5,
                purchased: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildList() {
    return ListView(
      controller: scrollController,
      clipBehavior: Clip.none,
      shrinkWrap: true,
      children: [
        kGap16,
        const Padding(
          padding: kPadH16,
          child: _UserCard(),
        ),
        kGap16,
        Padding(
          padding: kPadH16,
          child: _PageCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _SelectorPanel(
                  label: "Left",
                  selected: selectedPanel == "Left",
                  onTap: () {
                    selectedPanel = "Left";
                    update();
                  },
                  accounts: '1200',
                  amount: '2500 MTS',
                ).exp(),
                Container(
                  height: 108,
                  child: VerticalDivider(
                    color: Color(0xff5E5873).withOpacity(.12),
                    width: 32,
                    thickness: 1,
                  ),
                ),
                _SelectorPanel(
                  label: "Right",
                  selected: selectedPanel == "Right",
                  onTap: () {
                    selectedPanel = "Right";
                    update();
                  },
                  accounts: '700',
                  amount: '1200 MTS',
                ).exp(),
              ],
            ),
          ),
        ),
        kGap16,
        const SizedBox(
          // height: 600,
          width: double.infinity,
          // child: _BinaryTree(),
          child: Center(
            child: BinaryItem(
              count: 0,
              levelConfig: kLevel2,
              name: 'Login',
              purchased: false,
            ),
          ),
        ),
      ],
    );
  }
}

const kLevel1 = BinaryItemLevelConfig(
  avatarBorder: 6,
  avatarSize: 140,
  activitySize: 30,
  countSize: 33,
  countFontSize: 20,
  loginFontSize: 16,
);
const kLevel2 = BinaryItemLevelConfig(
  avatarBorder: 6,
  avatarSize: 140,
  activitySize: 24,
  countSize: 33,
  countFontSize: 20,
  loginFontSize: 16,
);
const kLevel3 = BinaryItemLevelConfig(
  avatarBorder: 6,
  avatarSize: 110,
  activitySize: 20,
  countSize: 26.4,
  countFontSize: 16,
  loginFontSize: 14,
);
const kLevel4 = BinaryItemLevelConfig(
  avatarBorder: 5,
  avatarSize: 80,
  activitySize: 16,
  countSize: 19.2,
  countFontSize: 14,
  loginFontSize: 12,
);
final kLevel5 = BinaryItemLevelConfig(
  avatarBorder: 4,
  avatarSize: 60,
  activitySize: 16,
  countSize: 14.4,
  countFontSize: 14.4,
  loginFontSize: 10,
);

class BinaryItemLevelConfig {
  final double avatarSize;
  final double avatarBorder;
  final double countSize;
  final double countFontSize;
  final double activitySize;
  final double loginFontSize;

  const BinaryItemLevelConfig({
    required this.avatarSize,
    required this.avatarBorder,
    required this.countSize,
    required this.countFontSize,
    required this.activitySize,
    required this.loginFontSize,
  });
}

class BinaryItem extends StatelessWidget {
  final int count;
  final String name;
  final bool purchased;

  /// 80, 60, 46
  // final double size;
  final BinaryItemLevelConfig levelConfig;
  final String? imageUrl;
  const BinaryItem({
    Key? key,
    required this.levelConfig,
    this.imageUrl,
    this.count = 0,
    required this.name,
    this.purchased = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            /// round item
            SizedBox(
              width: levelConfig.avatarSize,
              height: levelConfig.avatarSize,
              child: Material(
                elevation: 10,
                color: Colors.white,
                type: MaterialType.circle,
                shadowColor: const Color(0xffCFCFCF),
                child: Padding(
                  padding: EdgeInsets.all(levelConfig.avatarBorder),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffC4C4C4),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: AppFadeImage(
                      url: imageUrl ?? '-',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            if (count > 0)
              Positioned(
                left: 11,
                top: 0,
                child: _Circle(
                  size: levelConfig.countSize,
                  color: Colors.white,
                  child: Text(
                    "$count",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xffffbb32),
                      fontSize: levelConfig.countFontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

            Positioned(
              bottom: 0,
              right: 8,
              child: _Circle(
                size: levelConfig.activitySize,
                color: purchased
                    ? AppColors.green
                    : AppColors.binaryTreeNoPurchase,
              ),
            ),
          ],
        ),
        kGap8,
        _BinaryItemName(
          fontSize: levelConfig.loginFontSize,
          text: name,
        ),
      ],
    );
  }
}

class _BinaryItemName extends StatelessWidget {
  final String text;
  final double fontSize;
  const _BinaryItemName({
    Key? key,
    this.fontSize=14,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadiusPill,
        color: Colors.white,
      ),
      padding: kPadH16V4,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final Color color;
  final Widget? child;
  final double size;

  const _Circle({
    Key? key,
    required this.color,
    this.child,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(width: size, height: size),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: kBorderRadiusPill,
        color: color,
      ),
      // padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      alignment: Alignment.center,
      child: child,
    );
  }
}

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
          child: const BinaryTreeCanvas(),
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
