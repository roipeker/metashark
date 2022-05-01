import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'referral_login_state.dart';
part 'widgets.dart';

class ReferralLoginSheet extends StatefulWidget {
  const ReferralLoginSheet({Key? key}) : super(key: key);

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
              _Title(),
              kGap16,
              AppTextField(
                label: 'Referral login',
                hint: 'Referral login',
              ),
              kGap16,
              Row(
                children: [
                  SizedBox(
                    height: 44,
                    child: OutlinedButton.icon(
                      onPressed: onShareTap,
                      icon: Icon(
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
                      icon: Icon(
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
}
