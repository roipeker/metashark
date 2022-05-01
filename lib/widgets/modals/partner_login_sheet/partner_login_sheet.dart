import 'package:flutter/services.dart';
import 'package:metashark/commons.dart';

part 'partner_login_sheet_state.dart';

part 'widgets.dart';

class PartnerLoginSheet extends StatefulWidget {
  const PartnerLoginSheet({Key? key}) : super(key: key);

  @override
  createState() => _PartnerLoginSheet();
}

class _PartnerLoginSheet extends _PartnerLoginSheetState {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: kPad16,
        child: SafeArea(
          child: Column(
            children: [
              AppTextField(
                label: 'Partner login',
                hint: 'Login1234567',
                control: loginControl,
              ),
              kGap16,
              AppTextField.password(
                label: 'Partner password',
                hint: 'Password',
                control: passwordControl,
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
