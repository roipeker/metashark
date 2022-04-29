import 'package:flutter/material.dart';
import 'package:metashark/commons.dart';

class SupportService extends StatelessWidget {
  final VoidCallback? onTap;

  const SupportService({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 44,
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(SvgIcons.supportAgent),
          kGap8,
          Text(
            "Support service",
            style: TextStyle(
              color: Color(0xff7367f0),
              fontSize: 14,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldAccessoryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const TextFieldAccessoryButton({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: kPad16,
      minWidth: 50,
      child: child,
      // child: Text(
      // "Paste",
      // textAlign: TextAlign.right,
      // style: TextStyle(
      // color: Color(0xff7367f0),
      // fontSize: 14,
      // fontFamily: "Open Sans",
      // fontWeight: FontWeight.w600,
      // ),
      // ),
      // child: Icon(
      //   Icons.visibility,
      //   size: 22,
      // ),
      onPressed: onTap,
    );
  }
}

class LoginScaffold extends StatelessWidget {
  final String? figmaNode;
  final List<Widget> body;
  final String? title;
  final bool showSupport;

  const LoginScaffold({
    Key? key,
    this.figmaNode,
    required this.body,
    this.title,
    this.showSupport = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FigmaLink(
        node: figmaNode,
        child: CustomScrollView(
          clipBehavior: Clip.none,
          shrinkWrap: true,
          primary: true,
          slivers: [
            SliverPadding(
              padding: kPad16,
              sliver: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: SvgPicture.asset(Svgs.logo),
                  ),
                  if (title != null) AppText.loginTitle(title!),
                  kGap16,
                  ...body,
                ],
              ).toSliver(),
            ),
            if (showSupport)
              SliverPadding(
                padding: kPad16,
                sliver: SliverFillRemaining(
                  fillOverscroll: false,
                  hasScrollBody: false,
                  child: SupportService(
                    onTap: () {
                      context.toastNotImplemented();
                    },
                  ).bottomCenter(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class GenderPicker extends StatelessWidget {
  final ValueChanged<int>? onChanged;
  final int selectedIndex;

  const GenderPicker({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _GenderButton(
          label: 'Male',
          // svgId: SvgIcons.person,
          iconData: AppIcons.person,
          selected: selectedIndex == 0,
          onTap: () {
            onChanged?.call(0);
          },
        ).exp(),
        kGap16,
        _GenderButton(
          label: 'Female',
          // iconData,: SvgIcons.pregnantWoman,
          iconData: AppIcons.pregnant_woman,
          selected: selectedIndex == 1,
          onTap: () {
            onChanged?.call(1);
          },
        ).exp(),
      ],
    );
  }
}

class _GenderButton extends StatelessWidget {
  final bool selected;
  final String label;
  final IconData iconData;
  final VoidCallback? onTap;

  const _GenderButton({
    Key? key,
    this.selected = false,
    required this.label,
    required this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style =
        selected ? kElevatedButtonPrimaryPill : kElevatedButtonSecondaryPill;
    final color = style.foregroundColor?.resolve({MaterialState.hovered});
    return ElevatedButton.icon(
      style: style,
      onPressed: onTap,
      label: Text(label),
      // icon: SvgPicture.asset(svgId, color: color),
      icon: Icon(iconData, color: color, size: 18,),
    );
  }
}
