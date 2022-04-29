import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

extension MockWidgetExt on Widget {
  Widget mockPadd() {
    return Padding(
      padding: kPad8,
      child: this,
    );
  }
}

class MockTextField extends StatelessWidget {
  final String hint, label;
  final bool isPassword;

  const MockTextField({
    Key? key,
    this.hint = 'Hint',
    this.label = 'Label',
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormLabeledField(
      label: label,
      input: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
        ),
      ),
    );
  }
}

class FigmaLink extends StatelessWidget {
  final String? node;
  final Widget child;
  final bool hasHome;

  const FigmaLink({
    Key? key,
    required this.node,
    this.hasHome = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasNode = node != null;
    if (!hasNode && !hasHome) return SafeArea(child: child);

    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(child: child),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasHome)
                  Material(
                    color: AppColors.darkGrey,
                    child: IconButton(
                      onPressed: () {
                        // if (ModalRoute.of(context)?.settings.name ==
                        //     'DashboardScreen') {
                        //   return;
                        // }

                        /// we are in LOGIN steps
                        // if (rootContext == null) {
                        //   context.pushAndRemove(RootPage());
                        // } else {
                        //   rootContext!.pushAndRemove(DashboardScreen());
                        // }
                        // trace("DO WE HAVE ROOT?", rootContext == null);
                        // trace("SAME NAV: ", context.navigator()==rootContext!.navigator());
                        // context.pushAndRemove(DashboardScreen());
                      },
                      icon: const Icon(
                        CupertinoIcons.home,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                if (hasNode)
                  Material(
                    color: AppColors.darkGrey.withOpacity(.25),
                    child: IconButton(
                      onPressed: () {
                        NativeUtils.openFigmaRef(node!);
                      },
                      icon: SvgPicture.string(
                        _figmaIconSvg,
                        width: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const _figmaIconSvg =
    '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M8.41494 0C5.96794 0 3.99994 2.053 3.99994 4.568C3.99994 6.097 4.72794 7.455 5.84694 8.284C5.27022 8.71609 4.80275 9.27728 4.48201 9.92259C4.16126 10.5679 3.99616 11.2794 3.99994 12C3.99994 13.53 4.72794 14.887 5.84694 15.716C5.27022 16.1481 4.80275 16.7093 4.48201 17.3546C4.16126 17.9999 3.99616 18.7114 3.99994 19.432C3.99994 21.947 5.96794 24 8.41494 24C10.8609 24 12.8299 21.947 12.8299 19.432V15.57C13.6033 16.2148 14.5781 16.5683 15.5849 16.569C18.0319 16.568 19.9999 14.515 19.9999 12C20.004 11.2793 19.839 10.5678 19.5182 9.92243C19.1974 9.27708 18.7298 8.71592 18.1529 8.284C18.7297 7.85191 19.1971 7.29072 19.5179 6.64541C19.8386 6.0001 20.0037 5.28862 19.9999 4.568C19.9999 2.053 18.0319 0 15.5849 0H8.41494V0ZM5.65894 4.568C5.65894 2.977 6.90094 1.703 8.41494 1.703H11.1699V7.433H8.41494C6.90094 7.433 5.65894 6.158 5.65894 4.568V4.568ZM15.5849 7.432H12.8299V1.702H15.5849C17.0999 1.702 18.3409 2.977 18.3409 4.568C18.3409 6.158 17.0999 7.432 15.5849 7.432ZM5.65994 12C5.65994 10.41 6.90194 9.135 8.41594 9.135H11.1709V14.865H8.41494C6.89994 14.865 5.65894 13.59 5.65894 12H5.65994ZM12.8299 12C12.8299 10.41 14.0719 9.135 15.5859 9.135C17.1009 9.135 18.3419 10.409 18.3419 12C18.3419 13.59 17.1009 14.865 15.5859 14.865C14.0719 14.865 12.8309 13.591 12.8309 12H12.8299ZM5.65994 19.432C5.65994 17.842 6.90194 16.568 8.41594 16.568H11.1709V19.432C11.1709 21.023 9.93094 22.297 8.41594 22.297C6.90194 22.297 5.65994 21.023 5.65994 19.432Z" fill="#F8F8F8"/>
</svg>''';

class MockButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final ButtonStyle? style;
  final bool expanded;

  const MockButton(
    this.text,
    this.onTap, {
    this.expanded = false,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var child = ElevatedButton(
      style: style,
      child: Text(text),
      onPressed: onTap,
    );
    if (expanded) {
      return SizedBox(
        width: double.infinity,
        child: child,
      );
    }
    return child;
  }

  MockButton.primary(this.text, this.onTap, {this.expanded = false, Key? key})
      : style = kElevatedButtonPrimary,
        super(key: key);

  MockButton.secondary(this.text, this.onTap, {this.expanded = false, Key? key})
      : style = kElevatedButtonSecondary,
        super(key: key);
}

class MockBodyContent extends StatelessWidget {
  final Widget child;

  const MockBodyContent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: double.infinity,
        child: child,
      ),
    );
  }
}

class MockModal extends StatelessWidget {
  final String? node;
  final String text;

  const MockModal({Key? key, this.node, this.text = 'Sample modal'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Container(
        height: 200,
        color: Colors.white,
        child: FigmaLink(
          node: node,
          hasHome: false,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}




// TODO: find a common implementation for dropdowns.
class CurrencyDropdown extends StatelessWidget {
  final CurrencyVo current;
  final List<CurrencyVo> options;
  final ValueChanged<CurrencyVo?>? onChanged;

  const CurrencyDropdown({
    Key? key,
    required this.onChanged,
    required this.current,
    required this.options,
  }) : super(key: key);

  List<DropdownMenuItem<CurrencyVo>> getItems() {
    return options.mapIndexed2((index, e) {
      return DropdownMenuItem<CurrencyVo>(
        value: e,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                e.iconId,
                width: 24,
                height: 24,
              ),
              kGap8,
              Text(
                e.name,
                style: const TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),

      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Colors.white,
        border: Border.all(color: Color(0xffECEBEE), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      // width: double.infinity,
      // padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<CurrencyVo>(
        onChanged: onChanged,
        // borderRadius: kBorderRadius8,
        value: current,
        // itemHeight: 50,
        isExpanded: true,
        dropdownColor: Colors.white,
        underline: kEmptyWidget,
        // selectedItemBuilder: ,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_drop_down,
            size: 18,
            color: Color(0xffB9B9C3),
          ),
        ),
        menuMaxHeight: 240,
        alignment: Alignment.topLeft,
        items: getItems(),
      ),
    );
  }
}

