import 'package:flutter/scheduler.dart';
import 'package:metashark/commons.dart';
import 'package:rive/rive.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double elevation;
  final EdgeInsets padding;
  final Color? color;
  final Clip? clip;

  const AppCard({
    Key? key,
    required this.child,
    this.color,
    this.clip,
    this.borderRadius,
    this.elevation = 0,
    this.padding = kPad16,
  }) : super(key: key);

  // AppCard(
  // borderRadius: kBorderRadius12,
  // child: Container(),
  // padding: kPad16.copyWith(bottom: 24),
  // elevation: 0,
  // color: AppColors.primaryPurple.withOpacity(.1),
  // );

  const AppCard.smallRowTitle({
    Key? key,
    required this.child,
    this.padding = kPadH16V8,
  })  : elevation = 0,
        clip = null,
        color = AppColors.primaryPurple10,
        borderRadius = null,
        super(key: key);

  const AppCard.settings({
    Key? key,
    required this.child,
    this.padding = kPad16,
  })  : elevation = 0,
        clip = null,
        color = null,
        borderRadius = null,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: borderRadius != null
          ? RoundedRectangleBorder(borderRadius: borderRadius!)
          : kBorder8,
      color: color,
      clipBehavior: clip,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

// --

/// App Wrapper to deal with Navigator and root Menu Drawer.
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? leading;

  const CommonAppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menu = RootMenu.of(context);
    final hasDrawer = menu != null;
    Widget? _leading = leading;
    if (_leading == null) {
      var can = context.canPop();
      if (can) {
        /// show back button.
        _leading = BackButton(
          onPressed: () {
            context.pop();
          },
        );
      } else if (hasDrawer) {
        _leading = IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            menu.openDrawer();
          },
        );
      }
    }
    Widget? _title;
    if (title != null) {
      _title = Text(title!);
    }
    if (actions != null) {
      if (actions!.last != kGap8) {
        actions!.add(kGap8);
      }
    }
    return AppBar(
      title: _title,
      leading: _leading,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, _realHeight);

  double get _realHeight {
    var bottomH = bottom?.preferredSize.height ?? 0;
    return kToolbarHeight + bottomH;
  }
}

class CommonBottomNavBar extends StatelessWidget {
  final List<BottomNavItemVo> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CommonBottomNavBar(
      {Key? key, required this.items, this.currentIndex = 0, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          color: Color(0xffCDCDCD),
        ),
        BottomNavigationBar(
          backgroundColor: AppColors.scaffold,
          items: items.map2((e) {
            return BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Icon(
                  e.iconData,
                ),
              ),
              label: e.name,
            );
          }),
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ],
    );
  }
}

// preferredSize = _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),

/// ---- svg

class SvgAvatarIcon extends StatelessWidget {
  final String iconId;
  final double iconSize;
  final IconData? iconData;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SvgAvatarIcon({
    Key? key,
    required this.iconId,
    this.iconData,
    this.iconSize = 18,
    this.size = 32,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = iconData != null
        ? Icon(
            iconData,
            size: iconSize,
            color: foregroundColor ?? Colors.white,
          )
        : SvgPicture.asset(
            iconId,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
            color: foregroundColor ?? Colors.white,
          );
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.primaryColor,
        shape: BoxShape.circle,
      ),
      width: size,
      height: size,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class CommonAvatar extends StatelessWidget {
  final double radius;
  final Widget? child;
  final String label;
  final String? imageUrl;
  final Color? backgroundColor;

  const CommonAvatar({
    Key? key,
    this.radius = 16,
    this.backgroundColor,
    this.child,
    this.label = "L",
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor ?? AppColors.lightViolet,
      child: getChild(),
      backgroundImage: getImageProviderFromUrl(imageUrl),
      radius: radius,
      foregroundColor: Colors.white,
    );
  }

  Widget getChild() {
    if (child == null) {
      return Text(
        label[0].toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return child!;
  }
}

///
///
///

class BottomActionLabelButtons extends StatelessWidget {
  final String label1, label2;
  final VoidCallback? onTap1, onTap2;

  const BottomActionLabelButtons({
    Key? key,
    required this.label1,
    required this.label2,
    this.onTap1,
    this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          SizedBox(
            height: 44,
            child: OutlinedButton(
              onPressed: onTap1,
              child: Text(label1),
            ),
          ).exp(),
          kGap16,
          SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed: onTap2,
              child: Text(label2),
            ),
          ).exp(),
        ],
      ),
    );
  }
}

/// page indicator.

class PageIndicator extends StatelessWidget {
  final int count;
  final PageController controller;

  const PageIndicator({
    Key? key,
    required this.count,
    required this.controller,
  }) : super(key: key);

  double get page => controller.page ?? 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      // color: Colors.green,
      child: Center(
        child: Stack(
          // overflow: Overflow.visible,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                count,
                (index) => GestureDetector(
                  onTap: () {
                    // final distance = (index - page).abs().toInt();
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 280),
                      // * distance
                      curve: Curves.easeOut,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.black.withOpacity(.07),
                      color: Color(0xff5E5873).withOpacity(.12),
                      // border: Border.all(
                      //   color: Colors.black.withOpacity(.16),
                      //   width: 1,
                      // ),
                    ),
                  ),
                ),
              ),
            ),
            _PageIndicatorMagicDot(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _PageIndicatorMagicDot extends StatefulWidget {
  final PageController controller;

  const _PageIndicatorMagicDot({Key? key, required this.controller})
      : super(key: key);

  @override
  _PageIndicatorMagicDotState createState() => _PageIndicatorMagicDotState();
}

class _PageIndicatorMagicDotState extends State<_PageIndicatorMagicDot> {
  // double dotW = 18;
  double dotW = 8;
  double dotSep = 4;
  double pagePercent = 0;

  @override
  void initState() {
    super.initState();
    control.addListener(onPageScroll);
    SchedulerBinding.instance?.addPostFrameCallback((_) => onPageScroll());
  }

  PageController get control => widget.controller;

  void onPageScroll() {
    // trace(control.position.pixels, control.position.viewportDimension);
    // pagePercent = control.position.pixels / control.position.viewportDimension;
    pagePercent = control.page ?? 0;
    // trace(control.page, pagePercent);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    control.removeListener(onPageScroll);
  }

  @override
  Widget build(BuildContext context) {
    double rel = pagePercent % 1;
    double currPage = pagePercent.floorToDouble();
    final dotSep2 = dotSep * 2;
    double w, x;
    double currX = currPage * (dotW + dotSep2) + dotSep;
    if (rel < .5) {
      final p = rel / .5;
      w = dotW + p * (dotW + dotSep2);
      x = currX;
    } else {
      final p = (rel - .5) / .5;
      x = currX + p * (dotW + dotSep2);
      w = (currX + (dotW + dotSep) * 2) - x;
    }
    return Positioned(
      left: x,
      child: Container(
        width: w,
        height: dotW,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dotW / 2),
          // color: const Color(0xFF3E8BF7),
          color: AppColors.primaryPurple,
        ),
      ),
    );
  }
}

// ---

class CardRowTitle extends StatelessWidget {
  final String label;
  final String value;

  const CardRowTitle({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.primaryPurple.withOpacity(.1),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// --

class CardLabelProgressBar extends StatelessWidget {
  final String? title; // Limit: 100 MTS/day
  final String label; // 0.5574 MTS
  final double percent;
  final String? helperText; // 3 days ago
  final Color? barForegroundColor, barBackgroundColor;

  const CardLabelProgressBar({
    Key? key,
    this.title,
    required this.label,
    required this.percent,
    this.helperText,
    this.barForegroundColor = AppColors.green,
    this.barBackgroundColor,
  }) : super(key: key);

  bool get isBarOnly => title == null && helperText == null;

  @override
  Widget build(BuildContext context) {
    final bar = // bar graphic.
        Stack(
      children: [
        Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            color:
                barBackgroundColor ?? AppColors.primaryPurple.withOpacity(.1),
            borderRadius: kBorderRadius8,
          ),
          clipBehavior: Clip.antiAlias,
          // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: percent,
            heightFactor: 1,
            child: Container(
              color: barForegroundColor,
            ),
          ),
        ),
        Padding(
          padding: kPadH16V8,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
    if (isBarOnly) {
      return bar;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
            ),
          ),
        if (title != null) kGap4,
        bar,
        if (helperText != null) kGap4,
        if (helperText != null)
          Text(
            helperText!,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 12,
            ),
          )
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final double size;
  final Color color;

  const Dot({
    Key? key,
    this.size = 10,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}

/// 0-

class NotFoundFish extends StatelessWidget {
  final String text;
  final double boxSize;

  const NotFoundFish({
    Key? key,
    this.boxSize = 200,
    this.text = 'Not found',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: boxSize,
          height: boxSize,
          child: const RiveAnimation.asset(
            Rives.doryDemo,
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
        kGap16,
        Text(
          // "No cards available",
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

/// ---
///

class CommonScrollableBody extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets padding;
  final ScrollController? scrollController;
  final Clip clipBehavior;
  final Future<void> Function()? onRefreshPull;
  final bool safeArea;

  const CommonScrollableBody({
    Key? key,
    required this.children,
    this.safeArea = false,
    this.scrollController,
    this.clipBehavior = Clip.none,
    this.padding = EdgeInsets.zero,
    this.onRefreshPull,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scrollbar(
        controller: scrollController,
        child: RefreshIndicator(
          onRefresh: onRefreshPull ?? _onRefreshPull,
          child: SafeArea(
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              padding: padding,
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              clipBehavior: clipBehavior,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onRefreshPull() {
    return 2.seconds.delay();
  }
}

/// ---
///

class AppFadeImage extends StatelessWidget {
  final String url;
  final double? width, height;
  final BoxFit fit;

  const AppFadeImage({
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ImageProvider provider;
    if (url.startsWith('htt')) {
      provider = NetworkImage(url);
    } else {
      provider = AssetImage(url);
    }
    return FadeInImage(
      width: width,
      height: height,
      alignment: Alignment.center,
      placeholderFit: fit,
      placeholder: MemoryImage(kTransparentImage),
      image: provider,
      fit: fit,
      imageErrorBuilder: (context, error, _) {
        // return Icon(AppIcons.no_image,
        //   color: Colors.white30,
        //   size: 24,);
        return const Center(
          child: Icon(
            AppIcons.no_image,
            color: Colors.white30,
            size: 24,
          ),
        );
      },
    );
  }
}

class AvatarIcon extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final double size;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const AvatarIcon({
    Key? key,
    required this.iconData,
    this.iconSize = 18,
    this.size = 32,
    this.foregroundColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Circle(
      color: backgroundColor ?? context.theme.primaryColor,
      alignment: Alignment.center,
      size: size,
      child: Icon(
        iconData,
        color: foregroundColor,
        size: iconSize,
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final Color color;
  final Widget? child;
  final double size;
  final Alignment? alignment;

  const Circle({
    Key? key,
    required this.color,
    this.alignment = Alignment.center,
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
      alignment: alignment,
      child: child,
    );
  }
}

///
///
///

class NotificationCircleBadge extends StatelessWidget {
  final int value;
  final Color backgroundColor;
  final Widget child;
  final double size;
  final Offset position;

  const NotificationCircleBadge({
    Key? key,
    required this.value,
    required this.backgroundColor,
    required this.child,
    this.position = const Offset(-8, -8),
    this.size = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: position.dy,
          right: position.dx,
          child: Container(
            width: size,
            height: size,
            child: Center(
              child: Text(
                '$value',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}
