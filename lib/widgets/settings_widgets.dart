import 'package:flutter/cupertino.dart';
import 'package:metashark/commons.dart';

class SettingsListItem extends StatelessWidget {
  final String? svgId;
  final IconData? iconData;
  final String title;
  final String? subtitle;
  final Widget? suffix;
  final VoidCallback? onTap;

  const SettingsListItem({
    Key? key,
    this.iconData,
    this.svgId,
    required this.title,
    this.subtitle,
    this.suffix,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ElevatedButton(
        style: kElevatedButtonSettings,
        onPressed: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          textDirection: context.textDirection,
          children: [
            _getIcon(color: context.theme.primaryColor),
            kGap16,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppText(
                    title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xff5e5873),
                      fontSize: 14,
                      fontFamily: "Open Sans",
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null)
                    AppText(
                      subtitle!,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Color(0xffb9b9c3),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (suffix != null) suffix!,
          ],
        ),
      ),
    );
  }

  Widget _getIcon({Color? color}) {
    if (iconData != null) {
      return Icon(
        iconData!,
        color: color,
      );
    }
    if (svgId != null) {
      return SvgPicture.asset(svgId!);
    }
    return kEmptyWidget;
  }
}

class QrSection extends StatelessWidget {
  final String code;
  final VoidCallback? onCopyTap;

  const QrSection({Key? key, this.onCopyTap, required this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      // padding: kPadH16,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: QrCodeBox(
              code: code,
              backgroundColor: AppColors.scaffold,
            ),
          ),
          kGap16,
          AppCard(
            color: AppColors.primaryPurple.withOpacity(.1),
            child: Text(
              code,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xffea5455),
                fontSize: 16,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          kGap16,

          /// todo: not needed
          SizedBox(
            height: 46,
            child: OutlinedButton.icon(
              onPressed: onCopyTap,
              // icon: SvgPicture.asset(SvgIcons.contentCopy),
              icon: Icon(AppIcons.content_copy),
              label: const Text('Copy'),
            ),
          ),
        ],
      ),
    );
  }
}

/// sessions card
///

class SessionsCard extends StatelessWidget {
  final Widget content;
  final Widget? suffix;
  final String title;

  const SessionsCard({
    Key? key,
    required this.content,
    required this.title,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          title,
          style: TextStyle(
            color: Color(0xff5e5873),
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        kGap8,
        AppCard(
          elevation: 4,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: content),
              if (suffix != null) suffix!,
            ],
          ),
        ),
      ],
    );
  }
}
