import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'referral_login_state.dart';

part 'widgets.dart';

enum ReferralSheetType { login, referral }

class ReferralLoginSheet extends StatefulWidget {
  final ReferralSheetType type;

  const ReferralLoginSheet({Key? key, required this.type}) : super(key: key);

  @override
  State<ReferralLoginSheet> createState() => _ReferralLoginSheet();
}

class _ReferralLoginSheet extends _ReferralLoginSheetState {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.scaffold,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        padding: kPad16,
        child: SafeArea(
          child: Column(
            children: [
              const _Title(),
              kGap16,
              ...getFields(),
              kGap16,
              Row(
                children: [
                  SizedBox(
                    height: 44,
                    child: OutlinedButton.icon(
                      onPressed: onShareTap,
                      icon: const Icon(
                        AppIcons.share,
                        color: AppColors.primaryPurple,
                      ),
                      label: const Text('Share'),
                    ),
                  ).exp(),
                  kGap16,
                  SizedBox(
                    height: 44,
                    child: ElevatedButton.icon(
                      onPressed: onCopyTap,
                      icon: const Icon(
                        AppIcons.content_copy,
                        color: Colors.white,
                      ),
                      label: const Text('Copy'),
                    ),
                  ).exp(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getFields() {
    if (widget.type == ReferralSheetType.login) {
      return const [
         AppTextField(
          enabled: false,
          label: 'Login',
          hint: 'Login',
        ),
      ];
    } else {
      return const [
         AppTextField(
          enabled: false,
          label: 'Refferal Login',
          hint: 'Refferal Login',
        ),
        kGap16,
        AppTextField(
          enabled: false,
          label: 'Refferal Email',
          hint: 'Refferal Email',
        ),
      ];
    }
  }
}
