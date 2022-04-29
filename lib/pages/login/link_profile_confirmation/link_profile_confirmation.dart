import 'package:metashark/commons.dart';
part 'link_profile_confirmation_state.dart';

class LinkProfileConfirmationPage extends StatefulWidget {
  
   static const name = "/link-profile-confirmation";
 
  const LinkProfileConfirmationPage({Key? key}) : super(key: key);
  
  @override
  createState() => _LinkProfileConfirmationPage();
}

class _LinkProfileConfirmationPage extends _LinkProfileConfirmationState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: 'Link profile',
      figmaNode: '10%3A270',
      body: [
        kGap16,
        AppTextField(
          label: 'Enter code from myemail***@gmail.com/',
          hint: 'Enter code',
          accessory: AppTextButton.accessory(label: '27 sec', onTap: () {}),
        ),
        kGap16,
        AppElevatedButton.primary(
          child: Text('Next'),
          onTap: onNextTap,
          extended: true,
        ),
      ],
    );
  }

  void onBackTap() {
    context.pop();
  }

  void onNextTap() {
    context.pushNamed(EditProfilePage.name);
  }
}

