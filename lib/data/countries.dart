import '../commons.dart';

const kCountries = [
  CountryVo(name: 'Germany', imageId: ImagesLocale.de),
  CountryVo(name: 'Greece', imageId: ImagesLocale.el),
  CountryVo(name: 'US', imageId: ImagesLocale.en),
  CountryVo(name: 'Spain', imageId: ImagesLocale.es),
  CountryVo(name: 'France', imageId: ImagesLocale.fr),
  CountryVo(name: 'Italy', imageId: ImagesLocale.it),
  CountryVo(name: 'Korea', imageId: ImagesLocale.ko),
  CountryVo(name: 'Russia', imageId: ImagesLocale.ru),
  CountryVo(name: 'Ukraine', imageId: ImagesLocale.uk),
  CountryVo(name: 'China', imageId: ImagesLocale.zhCn),
];

class CountryVo {
  final String name;
  final String imageId;
  const CountryVo({required this.name, required this.imageId});
}
