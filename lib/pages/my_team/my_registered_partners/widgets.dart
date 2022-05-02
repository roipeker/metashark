part of 'my_registered_partners.dart';

class _ItemGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ItemGroup({Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SafeArea(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xff5e5873),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ).paddingSymmetric(horizontal: 16),
        ),
        kGap8,
        ...children,
      ],
    );
  }
}

class _LoginItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String? activated;

  const _LoginItem({
    Key? key,
    this.onTap,
    required this.activated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      disabledColor: Colors.white,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      hoverElevation: 0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Padding(
        padding: kPadH16V8,
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              const CommonAvatar(),
              kGap16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "26.04.2022",
                    style: TextStyle(
                      color: Color(0xffb9b9c3),
                      fontSize: 14,
                    ),
                  )
                ],
              ).exp(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _getSuffix(),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool get isActivated => activated != null;

  List<Widget> _getSuffix() {
    if (isActivated) {
      return [
        Text(
          "Activated",
          style: TextStyle(
            color: Color(0xff28c76f),
            fontSize: 14,
          ),
        ),
        Text(
          "26.04.2022",
          style: TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 14,
          ),
        ),
      ];
    } else {
      return [
        Text(
          "Not activated",
          style: TextStyle(
            color: Color(0xffb9b9c3),
            fontSize: 14,
          ),
        ),
      ];
    }
  }
}
