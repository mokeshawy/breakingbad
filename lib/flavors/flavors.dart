import 'package:breakingbad/flavors/flavor_type.dart';

class Flavor {
  static FlavorType? appFlavor;

  static String get flavorType => appFlavor?.name ?? '';

  static String get baseUrl {
    switch (appFlavor) {
      case FlavorType.stage:
        return 'http://rickandmortyapi.com/api/';
      case FlavorType.live:
        return 'https://rickandmortyapi.com/api/';
      default:
        return 'https://rickandmortyapi.com/api/';
    }
  }
}
