import 'dart:io';

import 'package:faker/faker.dart';
import 'package:metashark/commons.dart';

final kFaker = Faker();

int _imageCacheCount = 0;

List<String> getAllRestaurants() {
  return restaurants;
}

List<String> getPersonNames() {
  return List.generate(120,
      (index) => kFaker.person.firstName() + ' ' + kFaker.person.lastName());
}

String randomImage([
  int? w = 100,
  int? h,
]) {
  h ??= w;
  return 'https://picsum.photos/$w/$h?random=${_imageCacheCount++}';
}

ImageProvider? getImageProviderFromUrl(String? url) {
  url = url?.trim();
  if (url == null || url.isEmpty == true) {
    return null;
  }
  if (url.startsWith('htt')) {
    return NetworkImage(url);
  } else if (url.startsWith('file:') || url.startsWith('//')) {
    var f = File(url);
    if (f.existsSync()) {
      return FileImage(f);
    } else {
      return null;
    }
  } else {
    return AssetImage(url);
  }
}

String rndImage({
  int? id,
  String? seed,
  int w = 200,
  int? h,
  bool grayscale = false,
  int? blur,
  bool random = false,
  bool webp = true,
}) {
  h ??= w;
  // assert(id!=null && seed!=null);
  if (seed != null) {
    seed = seed.trim();
  }
  var query = [
    if (grayscale) 'grayscale',
    if (blur != null) 'blur=$blur',
    if (random) 'random=${_imageCacheCount++}',
  ];
  var paths = [
    'https://picsum.photos/',
    if (id != null) 'id/$id/',
    if (seed != null) 'seed/$seed/',
    '$w/',
    '$h',
    if (webp) '.webp'
  ];

  var url = paths.join('');
  if (query.isNotEmpty) {
    url += '?' + query.join('&');
  }
  return url;
}

final _random = Random();

double randomDouble() {
  return _random.nextDouble();
}

int randomInt(int max) {
  return _random.nextInt(max);
}

bool randomBool() {
  return _random.nextBool();
}

String randomWalletAddress() {
  // '1NeJEFzY8PbVS9RvYPfDP93iqXxHjav791'
  final kPatt = '#' * 34;
  return kFaker.guid.random.fromPatternToHex([kPatt]);
  // return kFaker.guid.guid();
}
