part of 'settings_language.dart';


class SettingsLangItem extends StatelessWidget {
  final String title, subtitle;
  final bool checked;
  final VoidCallback? onTap;

  const SettingsLangItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.checked = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton.noElevation(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.scaffold,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff5e5873),
                  fontSize: 14,
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xffb9b9c3),
                  fontSize: 12,
                  // height: 1.2,
                ),
              ),
            ],
          ),
          if (checked)
            const Icon(
              AppIcons.check,
              size: 18,
              color: AppColors.green,
            ),
        ],
      ),
    );
  }
}
