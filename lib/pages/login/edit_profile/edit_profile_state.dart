part of 'edit_profile.dart';

abstract class _EditProfileState extends State<EditProfilePage> {
  
  List<CountryVo> get countriesOptions => kCountries;
  late final selectedCountry = countriesOptions.first.obs();

  @override
  void initState(){
    super.initState();  
  }

  @override
  void dispose(){
    super.dispose();  
  }
}

