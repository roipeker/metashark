import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:metashark/commons.dart';

part 'password_confirmation_form_sheet_state.dart';

part 'widgets.dart';

class PasswordConfirmationFormSheet extends StatefulWidget {
  const PasswordConfirmationFormSheet({Key? key}) : super(key: key);

  @override
  createState() => _PasswordConfirmationFormSheet();
}

class _PasswordConfirmationFormSheet
    extends _PasswordConfirmationFormSheetState {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        color: AppColors.bottomSheet,
        // padding: kPad16,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              kGap16,
              const Padding(
                padding: kPadH16,
                child: Text(
                  "Confirmation form",
                  style: TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              kGap16,
              Padding(
                padding: kPadH16,
                child: TabBar(
                  controller: _tabController,
                  tabs: tabsData,
                  indicatorWeight: 3,
                  indicatorColor: context.theme.primaryColor,
                  onTap: onTabTap,
                ),
              ),
              ExpandablePageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                pageSnapping: true,
                children: const [
                  ChangePasswordTab1(),
                  ChangePasswordTab2(),
                ],
              ),

              /// tab here.
              Padding(
                padding: kPadH16,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onSaveTap,
                    child: const Text('Save'),
                  ),
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
