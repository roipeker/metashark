import 'package:metashark/commons.dart';

part 'partner_info_sheet_state.dart';

part 'widgets.dart';

class PartnerInfoSheetView extends StatefulWidget {
  const PartnerInfoSheetView({Key? key}) : super(key: key);

  @override
  createState() => _PartnerInfoSheetView();
}

class _PartnerInfoSheetView extends _PartnerInfoSheetState {
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
              _Title(),
              kGap16,
              _Boss(),
              kGap16,
              kDivider1,
              kGap16,
              TeamRowCard(
                label: 'Partners',
                value: '12',
                iconData: AppIcons.person,
                brightness: Brightness.light,
              ),
              kGap16,
              TeamRowCard(
                label: 'Structure',
                value: '10 000',
                iconData: AppIcons.people,
                brightness: Brightness.light,
              ),
              kGap16,
              TeamRowCard(
                label: 'Active',
                value: '3890',
                iconData: AppIcons.power_settings_new,
                brightness: Brightness.light,
              ),
              kGap16,
              kDivider1,
              kGap16,
              Row(
                children: [
                  SizedBox(
                    height: 44,
                    child: OutlinedButton(
                      onPressed: onShowCommandTap,
                      child: const Text('Display command'),
                    ),
                  ).exp(),
                  kGap16,
                  SizedBox(
                    height: 44,
                    child: OutlinedButton(
                      onPressed: onGoBinaryTap,
                      child: const Text('Go to Binary'),
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
