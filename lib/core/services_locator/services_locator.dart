import 'package:get_it/get_it.dart';

import '../../features/characters/di/characters_dependencies.dart';

final servicesLocator = GetIt.instance;

Future<void> setUpServicesLocator() async {
  setUpCharactersDependencies();
}
