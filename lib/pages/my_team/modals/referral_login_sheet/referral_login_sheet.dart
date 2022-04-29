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
    // final mq = context.mediaQuery;
    // var str = [mq.padding, mq.viewInsets, mq.viewPadding].join(',');
    // trace('2 - $str');
    // trace2('2 - $str');
    /// [🦈] EdgeInsets(0.0, 47.0, 0.0, 34.0), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 34.0)
    /// open keyboard.
    /// [🦈] EdgeInsets(0.0, 47.0, 0.0, 34.0), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 34.0)
    // [🦈] EdgeInsets(0.0, 47.0, 0.0, 32.1), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 32.1)
    // [🦈] EdgeInsets(0.0, 47.0, 0.0, 11.2), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 11.2)
    // [🦈] EdgeInsets(0.0, 47.0, 0.0, 0.0), EdgeInsets.zero, EdgeInsets(0.0, 47.0, 0.0, 0.0)

    // mq.padding;
    // mq.viewInsets;
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        color: Colors.white,
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
