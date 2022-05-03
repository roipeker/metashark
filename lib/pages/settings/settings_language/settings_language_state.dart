part of 'settings_language.dart';

abstract class _SettingsLanguageState extends State<SettingsLanguagePage> {
  final scrollController = ScrollController();
  late final selectedLanguage = languages.first.obs();

  List<LanguageVo> get languages => _kLangs;

  @override
  void initState() {
    super.initState();
  }

  void onItemTap(LanguageVo vo) {
    selectedLanguage(vo);
    // context.openModalSheet(const PartnerInfoSheetView());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

const _kLangs = [
  LanguageVo('English', 'English'),
  LanguageVo('Russian', 'Русский'),
  LanguageVo('Portuguese', 'Português'),
  LanguageVo('Serbian', 'Српски'),
  LanguageVo('Chinese', '中文'),
];

class LanguageVo {
  final String name, nativeName;

  const LanguageVo(this.name, this.nativeName);
}
