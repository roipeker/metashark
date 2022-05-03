import 'package:metashark/commons.dart';

part 'settings_language_state.dart';

part 'widgets.dart';

class SettingsLanguagePage extends StatefulWidget {
  static const url = "/settings-language";

  const SettingsLanguagePage({Key? key}) : super(key: key);

  @override
  createState() => _SettingsLanguagePage();
}

class _SettingsLanguagePage extends _SettingsLanguageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Language'),
      body: ScrollConfiguration(
        behavior: AppScrollBehavior(),
        child: Scrollbar(
          controller: scrollController,
          child: Obs(
            () => ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              clipBehavior: Clip.none,
              shrinkWrap: true,
              children: [
                ...languages
                    .map2((e) => SettingsLangItem(
                          subtitle: e.nativeName,
                          checked: selectedLanguage() == e,
                          title: e.name,
                          onTap: () {
                            onItemTap(e);
                          },
                        ))
                    .separator(const Divider(
                      endIndent: 16,
                      indent: 16,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
