import 'package:metashark/commons.dart';
part 'link_profile_state.dart';

class LinkProfilePage extends StatefulWidget {
  
   static const name = "/link-profile";
 
  const LinkProfilePage({Key? key}) : super(key: key);
  
  @override
  createState() => _LinkProfilePage();
}

class _LinkProfilePage extends _LinkProfileState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      title: 'Link Profile',
      figmaNode: '10%3A269',
      body: [
        kGap16,
        AppTextField(
          label: 'Login',
          hint: 'Login',
        ),
        kGap16,
        AppTextField(
          label: 'Your Email',
          hint: 'Enter email',
        ),
        kGap16,
        AppTextField.password(
          label: 'New Password',
          hint: 'Enter password',
        ),
        kGap16,
        AppTextField.password(
          label: 'Repeat new password',
          hint: 'Enter password',
        ),
        kGap16,
        AppElevatedButton.primary(
          child: Text('Next'),
          onTap: onNextTap,
          extended: true,
        ),
        kGap16,
        if (context.canPop())
        AppElevatedButton.secondary(
          child: Text('Back'),
          onTap: onBackTap,
          extended: true,
        ),
      ],
    );
  }

  void onBackTap() {
    context.pop();
  }
  void onNextTap() {
    context.pushNamed(LinkProfileConfirmationPage.name);
  }
}

