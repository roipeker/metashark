part of 'create_voucher.dart';

class _ActivationButton<T> extends StatelessWidget {
  final ValueChanged<T?>? onTap;
  final IconData icon;
  final String label;
  final T value, groupValue;

  const _ActivationButton({
    Key? key,
    required this.onTap,
    required this.groupValue,
    required this.value,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppMaterialButton(
      padding: kPad16,
      elevation: 4,
      color: Colors.white,
      shape: kBorder8,
      onTap: onTap != null ? () => onTap?.call(value) : null,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.darkGrey,
            size: 18,
          ),
          kGap8,
          Text(
            label,

            /// simplify styles!
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ).exp(),
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onTap,
          ),
        ],
      ),
    );
  }
}
