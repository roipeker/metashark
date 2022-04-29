import 'package:metashark/commons.dart';

/// add data models here.
class MockDataFactory {
  // static CountryVo randomCountryVo() {
  //   final name = kFaker.address.country();
  //   final province = kFaker.address.city();
  //   return CountryVo(
  //     name: name,
  //     province: province,
  //     checked: false,
  //     image: randomImage(70),
  //   );
  // }
  //
  // static LeaderboardUserVo randomLeaderboardUser() {
  //   final firstName = kFaker.person.firstName();
  //   final lastName = kFaker.person.lastName();
  //   return LeaderboardUserVo(
  //     firstName: firstName,
  //     lastName: lastName,
  //     imageUrl: randomImage(40),
  //     points: kFaker.randomGenerator.integer(300, min: 1),
  //   );
  // }

  // static String getRandomImage([int w = 100, int? h]) {
  static String getRandomImage({
    int? id,
    String? seed,
    int w = 200,
    int? h,
    bool grayscale = false,
    int? blur,
    bool random = false,
    bool webp = true,
  }) {
    return rndImage(
      id: id,
      seed: seed,
      w: w,
      h: h,
      grayscale: grayscale,
      blur: blur,
      random: random,
      webp: webp,
    );
  }

  static final cryptoCurrencies = [
    CurrencyVo(SvgCryptos.btc, 'Bitcoin'),
    CurrencyVo(SvgCryptos.eth, 'Ethereum'),
    CurrencyVo(SvgCryptos.mts, 'MetaShark'),
    CurrencyVo(SvgCryptos.dash, 'Dash'),
    CurrencyVo(SvgCryptos.trx, 'Tron'),
  ];

  static List<String> randomVouchers({int quantity = 50}) {
    final restaurants = getAllRestaurants();
    quantity = min(quantity, 90);
    return restaurants.take(quantity).toList(growable: false);
  }

  static String loremSentences([int sentences = 2, String joiner = ' ']) {
    return kFaker.lorem.sentences(sentences).join(joiner);
  }

  static String loremWords([int words = 30, String joiner = ' ']) {
    return kFaker.lorem.words(words).join(joiner);
  }
}

class CurrencyVo {
  final String iconId;
  final String name;
  final String address;

  CurrencyVo(this.iconId, this.name) : address = randomWalletAddress();
}
