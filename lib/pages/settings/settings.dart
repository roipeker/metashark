import 'package:metashark/commons.dart';
import 'package:metashark/widgets/modals/deactivate_google_auth_dialog/deactivate_google_auth_dialog.dart';

part 'settings_state.dart';

class SettingsPage extends StatefulWidget {
  static const url = "/settings";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  createState() => _SettingsPage();
}

class _SettingsPage extends _SettingsState {

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: AppScrollBehavior(),
      child: Scaffold(
        appBar: CommonAppBar(title: 'Settings'),
        // appBar: AppBar(
        //   leading: DrawerButton(),
        //   title: Text('Settings'),
        // ),
        body: RefreshIndicator(
          onRefresh: onRefreshPull,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: kPad16,
                  children: [
                    SettingsListItem(
                      svgId: SvgIcons.personSettings,
                      iconData: AppIcons.person,
                      title: 'First Name Last Name',
                      subtitle: 'Login',
                      onTap: () {
                        // nav to edit page.
                        context.pushNamed(SettingsProfilePage.url);
                      },
                    ),
                    SettingsListItem(
                      svgId: SvgIcons.googleAuthIcon,
                      title: 'Google Authentication',
                      subtitle: 'Date of creation: 22.05.2022',
                      suffix: Obs(
                        () => Text("Active", style: kSettingsTileGreenStyle)
                            .visible(appData.hasGoogleAuth()),
                      ),
                      onTap: onGoogleAuthTap,
                    ),
                    SettingsListItem(
                      // svgId: SvgIcons.lockOutline,
                      iconData: AppIcons.lock_outline,
                      title: 'Change password',
                      subtitle: 'Modified 90 days ago',
                      onTap: () {
                        context.pushNamed(ChangePasswordPage.url);
                      },
                    ),
                    SettingsListItem(
                      svgId: SvgIcons.mailOutline,
                      iconData: AppIcons.mail_outline,
                      title: 'Change email',
                      subtitle: 'Gmail@gmail.com',
                      onTap: () {
                        context.pushNamed(ChangeEmailPage.url);
                      },
                    ),
                    SettingsListItem(
                      svgId: SvgIcons.mailOutline,
                      iconData: AppIcons.language,
                      title: 'Language',
                      subtitle: 'English',
                      onTap: () {
                        context.pushNamed(SettingsLanguagePage.url);
                      },
                    ),

                    SettingsListItem(
                      iconData: AppIcons.phonelink_lock,
                      svgId: SvgIcons.phonelinkLock,
                      title: 'Sessions',
                      subtitle: '6 sessions',
                      onTap: () {
                        context.pushNamed(SessionsPage.url);
                      },
                    ),
                    SettingsListItem(
                      svgId: SvgIcons.autoAwesome,
                      iconData: AppIcons.auto_awesome,
                      title: 'Confirmations',
                      onTap: () {
                        context.pushNamed(SettingsConfirmationsPage.url);
                      },
                    ),
                  ].separator(kGap8),
                ),
              ),
              kGap16,
              Text(
                versionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.greyAccesoryIconColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
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
