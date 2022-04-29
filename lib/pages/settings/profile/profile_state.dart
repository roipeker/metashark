part of 'profile.dart';

abstract class _ProfileState extends State<SettingsProfilePage> {
  List<CountryVo> get countriesOptions => kCountries;
  late final selectedCountry = countriesOptions.first.obs();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
