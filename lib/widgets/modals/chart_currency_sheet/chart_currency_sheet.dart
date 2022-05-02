import 'package:metashark/commons.dart';
import 'package:rive/rive.dart';

part 'chart_currency_sheet_state.dart';

class ChartCurrencySheet extends StatefulWidget {

  const ChartCurrencySheet({Key? key}) : super(key: key);

  @override
  createState() => _ChartCurrencySheetView();
}

class _ChartCurrencySheetView extends _ChartCurrencySheetState {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.bottomSheet,
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        padding: kPad16,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 240,
                child: RiveAnimation.asset(
                  Rives.runnerBoy,
                  // fit: BoxFit.cover,
                ),
              ),
              kGap16,
              Text(
                'Currency charts coming soon',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.darkGrey.withOpacity(.5),
                ),
              ),
              kGap16,
            ],
          ),
        ),
      ),
    );
  }
}

