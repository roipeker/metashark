import 'package:metashark/commons.dart';
import 'package:rive/rive.dart';

part 'chart_earned_sheet_state.dart';

class ChartEarnedSheet extends StatefulWidget {
  const ChartEarnedSheet({Key? key}) : super(key: key);

  @override
  createState() => _ChartEarnedSheetView();
}

class _ChartEarnedSheetView extends _ChartEarnedSheetState {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffDFE1E9),
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        padding: kPad16,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 200,
                height: 200,
                child: RiveAnimation.asset(
                  Rives.delivery,
                  fit: BoxFit.none,
                  alignment: Alignment.center,
                ),
              ),
              kGap16,
              Text(
                'Incomes chart coming soon',
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
