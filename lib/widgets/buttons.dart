import 'package:metashark/commons.dart' hide NavigatorExt;

typedef AppButton = AppElevatedButton;

class AppElevatedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;
  final bool extended;
  final ButtonStyle? style;

  // AppElevatedButton.primary()
  const AppElevatedButton({
    Key? key,
    required this.child,
    this.extended = true,
    this.onTap,
    this.style,
  }) : super(key: key);

  AppElevatedButton.primarySmall({
    Key? key,
    required this.child,
    this.onTap,
  })  : extended = false,
        style = kElevatedButtonPrimarySmall,
        super(key: key);

  AppElevatedButton.primary({
    Key? key,
    required this.child,
    this.onTap,
    this.extended = true,
  })  : style = kElevatedButtonPrimary,
        super(key: key);

  AppElevatedButton.secondary({
    Key? key,
    required this.child,
    this.onTap,
    this.extended = true,
  })  : style = kElevatedButtonSecondary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _child = ElevatedButton(
      // child: Text(text),
      child: child,
      onPressed: onTap,
      style: style,
    );
    if (extended) {
      _child = SizedBox(
        width: double.infinity,
        child: _child,
      );
    }
    return _child;
  }
}

class AppTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final String? label;
  final ButtonStyle? style;

  const AppTextButton({
    Key? key,
    this.onTap,
    this.label,
    this.child,
    this.style,
  })  : assert(child == null || label == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _child = child ?? Text(label!);
    return TextButton(
      onPressed: onTap,
      child: _child,
      style: style,
    );
  }

  AppTextButton.tiny({
    required this.label,
    this.onTap,
    Key? key,
  })  : style = kTextButtonStyleTiny,
        child = null,
        super(key: key);

  AppTextButton.accessory({
    required this.label,
    this.onTap,
    Key? key,
  })  : style = kTextButtonStyleAccessory,
        child = null,
        super(key: key);
}

/// specific buttons
//
// class SupportButton extends StatelessWidget {
//   final VoidCallback? onTap;
//
//   const SupportButton({
//     Key? key,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton.icon(
//       style: TextButton.styleFrom(
//         primary: AppColors.primaryPurple,
//       ),
//       onPressed: onTap,
//       icon: SvgPicture.asset(
//         SvgIcons.supportAgent,
//         // color: AppColors.primaryPurple,
//       ),
//       label: Text(
//         Strings.login.common.supportService.tr(),
//         style: kLinkServiceSupportStyle,
//       ),
//     );
//   }
// }

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        context.pop();
      },
    );
  }
}

class SearchButton extends StatelessWidget {
  final VoidCallback? onTap;

  const SearchButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(AppIcons.search),
      onPressed: onTap,
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.menu,
        // size: 18,
      ),
      onPressed: () {
        final state = kRootMenuKey.currentState;
        if (state == null) return;
        if (state.isDrawerOpen) {
          context.pop();
        } else {
          state.openDrawer();
        }
      },
    );
  }
}

class AppMaterialButton extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final double? elevation;
  final double? hoverElevation, focusElevation, highlightElevation;
  final Color? color;
  final ShapeBorder? shape;
  final Clip clip;

  const AppMaterialButton.noElevation({
    Key? key,
    required this.child,
    this.clip = Clip.none,
    this.color,
    this.onTap,
    this.padding = kPad16,
    this.shape,
  })  : elevation = 0,
        hoverElevation = 0,
        focusElevation = 0,
        highlightElevation = 0,
        super(key: key);

  const AppMaterialButton({
    Key? key,
    required this.child,
    this.clip = Clip.none,
    this.color,
    this.onTap,
    this.padding = kPad16,
    this.shape,
    this.elevation,
    this.hoverElevation,
    this.focusElevation,
    this.highlightElevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onTap,
      shape: shape,
      clipBehavior: clip,
      padding: EdgeInsets.zero,
      elevation: elevation,
      hoverElevation: hoverElevation,
      focusElevation: focusElevation,
      highlightElevation: highlightElevation,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
