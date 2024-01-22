import 'package:breakingbad/core/services_locator/services_locator.dart';

import 'core/services_locator/core_dependencies.dart';

Future<void> initializeMainServicesLocator() async {
  await setUpCoreDependencies();
  await setUpServicesLocator();
}
