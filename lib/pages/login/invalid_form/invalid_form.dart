import 'package:metashark/commons.dart';

part 'invalid_form_state.dart';

class InvalidFormPage extends StatefulWidget {
  static const name = "/invalid-form";

  const InvalidFormPage({Key? key}) : super(key: key);

  @override
  createState() => _InvalidFormPage();
}

class _InvalidFormPage extends _InvalidFormState {
  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      showSupport: false,
      // figmaNode: '282%3A4094',
      body: [
        kGap16,
        SvgPicture.asset(Svgs.cat),
        kGap16,
        const AppText.error('The form is not valid.'),
        kGap16,
        AppElevatedButton.secondary(
          child: Text('Back'),
          onTap: onBackTap,
          extended: true,
        ),
      ],
    );
  }

  void onBackTap() {
    /// check if we can pop!
    if (context.canPop()){
      context.pop();
    } else {
      context.go('/');
    }
  }
}
